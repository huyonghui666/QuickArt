import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:quick_art/core/localization/l10n/app_localizations.dart';
import 'package:quick_art/core/resource_management/app_icons.dart';
import 'package:quick_art/features/tools/domain/entities/face_detect_result.dart';
import 'package:quick_art/features/tools/presentation/notifilers/face_detect_notifier.dart';
import 'package:quick_art/features/tools/presentation/notifilers/face_swap_generation_notifier.dart';

/// AI 换脸 — 人脸选择页面
///
/// 展示检测到的人脸列表，用户从下方相册网格选取目标照片后，
/// 触发二次人脸检测，并弹出底部弹窗让用户选择具体面孔。
class AiFaceSelectScreen extends ConsumerStatefulWidget {
  /// 构造
  const AiFaceSelectScreen({required this.result, super.key});

  /// 第一次人脸检测结果，包含检测到的所有人脸信息
  final FaceDetectResult result;

  @override
  ConsumerState<AiFaceSelectScreen> createState() =>
      _AiFaceSelectScreenState();
}

class _AiFaceSelectScreenState extends ConsumerState<AiFaceSelectScreen> {
  /// 顶部人脸行中当前高亮的人脸索引（用户点击了该行的某个人脸）
  int? _activeFaceIndex;

  /// 每个顶部人脸槽对应的已确认替换面孔：key = 顶部人脸索引
  final Map<int, FaceInfo> _confirmedFaces = {};

  /// 检测中的临时照片，仅用于相册网格高亮
  AssetEntity? _pendingPhoto;
  /// 正在等待检测结果的顶部人脸槽索引
  int? _pendingFaceIndex;

  /// true 时显示全屏加载蒙层，阻止交互
  bool _detecting = false;

  /// 已加载的相册照片列表
  final List<AssetEntity> _photos = [];

  /// 是否还有更多照片可加载
  bool _hasMore = true;

  /// 是否正在加载相册（防止重复触发）
  bool _loading = false;

  /// 当前已加载的页码（photo_manager 从 0 开始）
  int _page = 0;

  /// 每页加载数量
  static const int _pageSize = 30;

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    // 首帧渲染完成后再请求权限，避免在 build 阶段触发异步操作
    WidgetsBinding.instance.addPostFrameCallback((_) => _loadPhotos());
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  /// 滚动监听：距底部 200px 时预加载下一页
  void _onScroll() {
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 200 &&
        !_loading &&
        _hasMore) {
      _loadPhotos();
    }
  }

  /// 请求相册权限并分页加载照片
  Future<void> _loadPhotos() async {
    if (_loading || !_hasMore) return;
    setState(() => _loading = true);

    final permission = await PhotoManager.requestPermissionExtend();
    // isAuth: 完全授权；hasAccess: 受限访问（iOS 仅选中部分）
    if (!permission.isAuth && !permission.hasAccess) {
      setState(() => _loading = false);
      return;
    }

    // 取第一个相册（"最近项目" / "所有照片"）
    final albums = await PhotoManager.getAssetPathList(
      type: RequestType.image,
    );

    if (albums.isEmpty) {
      setState(() {
        _loading = false;
        _hasMore = false;
      });
      return;
    }

    final assets = await albums.first.getAssetListPaged(
      page: _page,
      size: _pageSize,
    );

    setState(() {
      _photos.addAll(assets);
      _page++;
      // 返回数量小于 pageSize 说明已到末尾
      _hasMore = assets.length == _pageSize;
      _loading = false;
    });
  }

  /// 用户点击相册照片后触发：显示加载蒙层 → 人脸检测 → 弹出底部弹窗
  Future<void> _onPhotoSelected(AssetEntity asset) async {
    setState(() {
      _detecting = true;
      _pendingFaceIndex = _activeFaceIndex;
    });

    final file = await asset.file;
    if (file == null) {
      setState(() => _detecting = false);
      return;
    }

    ref.invalidate(faceDetectProvider);
    _pendingPhoto = asset;
    ref.read(faceDetectProvider.notifier).detect(file.path);
  }

  /// 底部弹窗确认后，将选中的面孔存入对应顶部槽
  void _onFaceConfirmed(FaceInfo face, int faceIndex) {
    if (_pendingFaceIndex == null) return;
    setState(() {
      _confirmedFaces[_pendingFaceIndex!] = face;
    });
  }

  /// 点击绘制按钮：校验参数 → 设置输入 → 跳转等待页
  ///
  /// originalFacePaths: 目标照片里要被替换的脸（第二次检测结果的 path）
  /// faceImageUrls:     用来替换的自拍脸 CDN URL（第一次检测结果的 url），
  ///                    顺序与 originalFacePaths 一一对应
  void _onDraw() {
    if (_confirmedFaces.isEmpty) return;

    final originalFacePaths = <String>[];
    final faceImageUrls = <String>[];

    final orderedEntries = _confirmedFaces.entries.toList()
      ..sort((a, b) => a.key.compareTo(b.key));

    for (final entry in orderedEntries) {
      final slotIndex = entry.key;
      if (slotIndex >= widget.result.faces.length) continue;
      originalFacePaths.add(widget.result.faces[slotIndex].path);
      faceImageUrls.add(entry.value.url);
    }

    if (originalFacePaths.isEmpty) return;

    ref.read(faceSwapInputHolderProvider.notifier).set(
          FaceSwapInput(
            targetOssUrl: widget.result.targetOssUrl,
            originalFacePaths: originalFacePaths,
            faceImageUrls: faceImageUrls,
          ),
        );

    context.push('/wait/face_swap?prompt=face_swap');
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    // 监听人脸检测结果：成功则弹出面孔选择底部弹窗，失败则提示
    ref.listen(faceDetectProvider, (_, next) {
      next.whenOrNull(
        data: (result) {
          if (!context.mounted) return;
          if (result == null) return;
          setState(() => _detecting = false);
          if (result.faces.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(l10n.tools_ai_face_swap_no_face_hint),
              ),
            );
          } else {
            showModalBottomSheet<void>(
              context: context,
              backgroundColor: Colors.transparent,
              isScrollControlled: true,
              builder: (_) => _FaceSelectBottomSheet(
                asset: _pendingPhoto!,
                faces: result.faces,
                onConfirm: _onFaceConfirmed,
              ),
            );
          }
        },
        // 网络/API 失败时也要关闭蒙层，避免 UI 卡死
        error: (_, _) {
          if (!context.mounted) return;
          setState(() => _detecting = false);
        },
      );
    });

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _AppBar(),
                const SizedBox(height: 16),
                Center(
                  child: Text(
                    l10n.tools_ai_face_swap_select_face,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: _FaceSwapRow(
                    faces: widget.result.faces,
                    activeFaceIndex: _activeFaceIndex,
                    confirmedFaces: _confirmedFaces,
                    onSelectFace: (i) =>
                        setState(() => _activeFaceIndex = i),
                  ),
                ),
                const SizedBox(height: 24),
                Center(
                  child: Text(
                    l10n.tools_ai_face_swap_all,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: _PhotoGrid(
                    photos: _photos,
                    loading: _loading,
                    selectedPhoto: _pendingPhoto,
                    scrollController: _scrollController,
                    onSelect: _onPhotoSelected,
                  ),
                ),
                // 底部留出悬浮按钮的空间
                const SizedBox(height: 80),
              ],
            ),
          ),
          // 悬浮绘制按钮
          Positioned(
            left: 16,
            right: 16,
            bottom: 16,
            child: SafeArea(
              top: false,
              child: GestureDetector(
                onTap: _onDraw,
                child: SizedBox(
                  height: 56,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SvgPicture.asset(
                        AppIcons.draw,
                        fit: BoxFit.fill,
                        width: double.infinity,
                        height: 56,
                      ),
                      Text(
                        l10n.widgets_draw_button_draw,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // 人脸检测进行中：全屏蒙层 + 转圈动画，阻止所有交互
          if (_detecting) ...[
            const ModalBarrier(dismissible: false, color: Colors.transparent),
            ColoredBox(
              color: Colors.black.withValues(alpha: 0.6),
              child: const Center(child: CircularProgressIndicator()),
            ),
          ],
        ],
      ),
    );
  }
}

class _AppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, top: 8, right: 16),
      child: Row(
        children: [
          IconButton(
            icon: SvgPicture.asset(
              AppIcons.backPreviousPage,
              width: 24,
              height: 24,
            ),
            onPressed: () => context.pop(),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

/// 人脸换脸操作行：横向可滚动，每组 = [检测人脸] + [切换图标] + [目标照片槽]
class _FaceSwapRow extends StatelessWidget {
  const _FaceSwapRow({
    required this.faces,
    required this.activeFaceIndex,
    required this.confirmedFaces,
    required this.onSelectFace,
  });

  final List<FaceInfo> faces;

  /// 当前高亮的顶部人脸索引（用户最后点击的那个）
  final int? activeFaceIndex;

  /// 每个顶部槽已确认的替换面孔，key = 顶部人脸索引
  final Map<int, FaceInfo> confirmedFaces;
  final ValueChanged<int> onSelectFace;

  static const double _tileSize = 90;
  static const double _iconSize = 40;
  static const double _gap = 8;

  // 每组宽度：人脸90 + 间距8 + 图标40 + 间距8 + 占位90 = 236
  static const double _groupWidth =
      _tileSize + _gap + _iconSize + _gap + _tileSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _tileSize + 20, // 上下留出边框高亮空间
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.zero,
        itemCount: faces.length,
        separatorBuilder: (_, _) => const SizedBox(width: 16),
        itemBuilder: (_, i) {
          final isActive = activeFaceIndex == i;
          return SizedBox(
            width: _groupWidth,
            child: Row(
              children: [
                _FaceTile(
                  url: faces[i].url,
                  isSelected: isActive,
                  onTap: () => onSelectFace(i),
                ),
                const SizedBox(width: _gap),
                SvgPicture.asset(
                  isActive
                      ? AppIcons.faceSwapAvatarChange
                      : AppIcons.faceSwapAvatarChangeUn,
                  width: _iconSize,
                  height: _iconSize,
                ),
                const SizedBox(width: _gap),
                _TargetPhotoSlot(
                  size: _tileSize,
                  // 每个槽独立查找自己已确认的面孔
                  face: confirmedFaces[i],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

/// 单张检测人脸缩略图，选中时显示紫色边框
class _FaceTile extends StatelessWidget {
  const _FaceTile({
    required this.url,
    required this.isSelected,
    required this.onTap,
  });

  final String url;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 90,
        height: 90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected
                ? const Color(0xFF9B59B6)
                : Colors.transparent,
            width: 2.5,
          ),
        ),
        child: ClipRRect(
          // 内圆角比外圆角小 2px，避免边框被裁切
          borderRadius: BorderRadius.circular(14),
          child: CachedNetworkImage(
            imageUrl: url,
            fit: BoxFit.cover,
            placeholder: (_, _) => const ColoredBox(
              color: Color(0xFF2C2C2E),
            ),
            errorWidget: (_, _, _) => const ColoredBox(
              color: Color(0xFF2C2C2E),
            ),
          ),
        ),
      ),
    );
  }
}

/// 右侧目标照片槽
///
/// - [face] 为 null：显示灰色占位框，等待用户确认面孔
/// - [face] 不为 null：显示已确认面孔的缩略图
class _TargetPhotoSlot extends StatelessWidget {
  const _TargetPhotoSlot({required this.size, required this.face});

  final double size;
  final FaceInfo? face;

  @override
  Widget build(BuildContext context) {
    if (face == null) {
      return Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: const Color(0xFF2C2C2E),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.15),
          ),
        ),
      );
    }
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: SizedBox(
        width: size,
        height: size,
        child: CachedNetworkImage(
          imageUrl: face!.url,
          fit: BoxFit.cover,
          placeholder: (_, _) => const ColoredBox(color: Color(0xFF2C2C2E)),
          errorWidget: (_, _, _) => const ColoredBox(color: Color(0xFF2C2C2E)),
        ),
      ),
    );
  }
}

/// 异步加载 [AssetEntity] 缩略图并以 [Image.memory] 渲染
///
/// photo_manager v3 将 AssetEntityImage 拆分到独立包，
/// 此处直接调用 [AssetEntity.thumbnailDataWithSize] 避免额外依赖。
class _AssetThumb extends StatefulWidget {
  const _AssetThumb({required this.asset, required this.size});

  final AssetEntity asset;

  /// 缩略图边长（px），正方形裁切
  final double size;

  @override
  State<_AssetThumb> createState() => _AssetThumbState();
}

class _AssetThumbState extends State<_AssetThumb> {
  List<int>? _bytes;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final px = widget.size.toInt();
    final data = await widget.asset.thumbnailDataWithSize(
      ThumbnailSize(px, px),
    );
    if (mounted) setState(() => _bytes = data);
  }

  @override
  Widget build(BuildContext context) {
    if (_bytes == null) {
      return const ColoredBox(color: Color(0xFF2C2C2E));
    }
    return Image.memory(
      Uint8List.fromList(_bytes!),
      fit: BoxFit.cover,
    );
  }
}

/// 与 [_AssetThumb] 相同，但使用 [BoxFit.contain] 完整展示照片，
/// 适用于底部弹窗中需要看到完整构图的场景。
class _AssetThumbContain extends StatefulWidget {
  const _AssetThumbContain({required this.asset});

  final AssetEntity asset;

  @override
  State<_AssetThumbContain> createState() => _AssetThumbContainState();
}

class _AssetThumbContainState extends State<_AssetThumbContain> {
  List<int>? _bytes;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    // 请求较大尺寸以保证 contain 模式下清晰度
    final data = await widget.asset.thumbnailDataWithSize(
      const ThumbnailSize(800, 800),
    );
    if (mounted) setState(() => _bytes = data);
  }

  @override
  Widget build(BuildContext context) {
    if (_bytes == null) {
      return const ColoredBox(color: Color(0xFF2C2C2E));
    }
    return Image.memory(
      Uint8List.fromList(_bytes!),
      fit: BoxFit.contain,
    );
  }
}

/// 相册照片网格
///
/// - 分页加载，滚动到底部时由父级触发下一页
/// - 加载中时在末尾追加 3 个灰色占位格
/// - 选中照片后显示紫色蒙层 + 勾选图标
class _PhotoGrid extends StatelessWidget {
  const _PhotoGrid({
    required this.photos,
    required this.loading,
    required this.selectedPhoto,
    required this.scrollController,
    required this.onSelect,
  });

  final List<AssetEntity> photos;
  final bool loading;
  final AssetEntity? selectedPhoto;
  final ScrollController scrollController;

  /// 异步回调，选中照片后触发人脸检测
  final Future<void> Function(AssetEntity) onSelect;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: scrollController,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
      ),
      // 加载中时在末尾追加 3 个占位格，给用户视觉反馈
      itemCount: photos.length + (loading ? 3 : 0),
      itemBuilder: (_, i) {
        if (i >= photos.length) {
          return const ColoredBox(color: Color(0xFF2C2C2E));
        }
        final asset = photos[i];
        final isSelected = selectedPhoto?.id == asset.id;
        return GestureDetector(
          onTap: () => onSelect(asset),
          child: Stack(
            fit: StackFit.expand,
            children: [
              _AssetThumb(asset: asset, size: 200),
              if (isSelected)
                ColoredBox(
                  color: const Color(0xFF9B59B6).withValues(alpha: 0.45),
                  child: const Center(
                    child: Icon(
                      Icons.check_circle,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

/// 人脸选择底部弹窗
///
/// 展示用户选中的目标照片缩略图，以及二次检测出的所有人脸，
/// 用户选择一张面孔后点击"确认"完成选择。
class _FaceSelectBottomSheet extends StatefulWidget {
  const _FaceSelectBottomSheet({
    required this.asset,
    required this.faces,
    required this.onConfirm,
  });

  /// 用户从相册选中的目标照片
  final AssetEntity asset;

  /// 二次人脸检测结果中的所有人脸
  final List<FaceInfo> faces;

  /// 用户点击确认后的回调，传出选中的面孔
  final void Function(FaceInfo face, int faceIndex) onConfirm;

  @override
  State<_FaceSelectBottomSheet> createState() =>
      _FaceSelectBottomSheetState();
}

class _FaceSelectBottomSheetState extends State<_FaceSelectBottomSheet> {
  /// 默认选中第一张人脸
  int _selectedFaceIndex = 0;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF1C1C1E),
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 顶部：X 关闭按钮独立一行，右对齐，不覆盖在照片上
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: SvgPicture.asset(
                  AppIcons.promptDelete,
                  width: 28,
                  height: 28,
                ),
              ),
            ),
            const SizedBox(height: 8),
            // 选中的目标照片缩略图：contain 模式完整展示
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: SizedBox(
                width: double.infinity,
                height: 200,
                child: _AssetThumbContain(asset: widget.asset),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              l10n.tools_ai_face_swap_select_which_face,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            // 横向人脸列表，选中态显示渐变色边框
            SizedBox(
              height: 80,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: widget.faces.length,
                separatorBuilder: (_, _) => const SizedBox(width: 12),
                itemBuilder: (_, i) {
                  final isSelected = _selectedFaceIndex == i;
                  return GestureDetector(
                    onTap: () => setState(() => _selectedFaceIndex = i),
                    child: Container(
                      width: 72,
                      height: 72,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        // 渐变边框：用渐变背景 + 内部 padding 模拟
                        gradient: isSelected
                            ? const LinearGradient(
                                colors: [
                                  Color(0xFF9B59B6),
                                  Color(0xFFE67E22),
                                ],
                              )
                            : null,
                        border: isSelected
                            ? null
                            : Border.all(
                                color: Colors.white.withValues(alpha: 0.2),
                                width: 2,
                              ),
                      ),
                      // 2px padding 让渐变背景露出，形成渐变边框效果
                      padding: const EdgeInsets.all(2),
                      child: ClipOval(
                        child: CachedNetworkImage(
                          imageUrl: widget.faces[i].url,
                          fit: BoxFit.cover,
                          placeholder: (_, _) => const ColoredBox(
                            color: Color(0xFF2C2C2E),
                          ),
                          errorWidget: (_, _, _) => const ColoredBox(
                            color: Color(0xFF2C2C2E),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            // 确认按钮，使用 draw.svg 作为背景
            GestureDetector(
              onTap: () {
                widget.onConfirm(
                  widget.faces[_selectedFaceIndex],
                  _selectedFaceIndex,
                );
                Navigator.of(context).pop();
              },
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SvgPicture.asset(
                      AppIcons.draw,
                      fit: BoxFit.fill,
                      width: double.infinity,
                      height: 56,
                    ),
                    Text(
                      l10n.tools_ai_face_swap_confirm,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
