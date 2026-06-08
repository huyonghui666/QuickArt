import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quick_art/core/di/widgets/prompt_provider.dart';
import 'package:quick_art/core/localization/l10n/app_localizations.dart';
import 'package:quick_art/core/permission/permission_manager.dart';
import 'package:quick_art/core/resource_management/app_icons.dart';
import 'package:quick_art/core/resource_management/app_video_image.dart';
import 'package:quick_art/core/widgets/draw_button.dart';
import 'package:quick_art/core/widgets/prompt_text_field.dart';
import 'package:quick_art/features/home/domain/entities/art_style.dart';
import 'package:quick_art/features/home/presentation/notifiers/art_style_notifier.dart';
import 'package:quick_art/features/home/presentation/notifiers/inspiration_provider.dart';
import 'package:quick_art/features/home/presentation/notifiers/template_notifier.dart';
import 'package:quick_art/features/home/presentation/widgets/art_style_selector.dart';
import 'package:quick_art/features/home/presentation/widgets/inspiration_tab_header_delegate.dart';
import 'package:quick_art/features/home/presentation/widgets/template_category_grid.dart';
import 'package:quick_art/features/setting/presentation/notifiers/user_profile_notifier.dart';

/// 首页
class HomeScreen extends ConsumerStatefulWidget {
  /// 构造
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenTestState();
}

class _HomeScreenTestState extends ConsumerState<HomeScreen>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  static const List<String> _ratios = [
    '1:1',
    '4:5',
    '5:4',
    '3:4',
    '4:3',
    '9:16',
    '16:9',
  ];

  late final TabController _tabController;
  late final ScrollController _outerScrollController;
  XFile? _selectedImage;
  final _picker = ImagePicker();
  bool _isRatioSelectorVisible = false;
  String _selectedRatio = '1:1';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    final categories = ref.read(inspirationCategoriesProvider);
    _tabController = TabController(length: categories.length, vsync: this);
    _outerScrollController = ScrollController();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _tabController.dispose();
    _outerScrollController.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      ref.read(userProfileNotifierProvider.notifier).refresh();
    }
  }

  @override
  Widget build(BuildContext context) {
    final categories = ref.watch(inspirationCategoriesProvider);
    final statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          NestedScrollView(
            controller: _outerScrollController,
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverToBoxAdapter(child: _buildTopSection(context, ref)),
                SliverPersistentHeader(
                  delegate: InspirationTabHeaderDelegate(
                    controller: _tabController,
                    categories: categories,
                    statusBarHeight: statusBarHeight,
                  ),
                  pinned: true,
                ),
              ];
            },
            body: TabBarView(
              controller: _tabController,
              children: categories.map((category) {
                ///在每个 Tab 页内部监听滚动事件
                return NotificationListener<ScrollNotification>(
                  onNotification: (notification) {
                    /// 当距离底部不足 500 像素时，触发 loadMore()
                    if (notification is ScrollEndNotification &&
                        notification.metrics.extentAfter < 500) {
                      ///由于InspirationCategoryType的newest不能更改为new，
                      ///所以这么获取后端category为new的数据
                      final backendCategory =
                          category == InspirationCategoryType.newest
                          ? 'new'
                          : category.name;
                      ref
                          .read(
                            templatesProvider(
                              category: backendCategory,
                            ).notifier,
                          )
                          .loadMore();
                    }
                    return false;
                  },
                  child: CustomScrollView(
                    key: PageStorageKey(category.name),
                    slivers: [
                      SliverPadding(
                        padding: const EdgeInsets.fromLTRB(
                          20,
                          20,
                          20,
                          100,
                        ), // Bottom padding for DrawButton
                        sliver: TemplateCategoryGrid(category: category.name),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Center(
              child: DrawButton(
                family: 'textToImage',
                pointsCost: 5,
                onTap: () {
                  final prompt = ref.read(promptProvider('textToImage')).text;
                  if (prompt.isEmpty) return;

                  if (_selectedImage != null) {
                    context.pushNamed(
                      'Wait',
                      pathParameters: {'taskType': 'image_edit'},
                      queryParameters: {
                        'prompt': prompt,
                        'imagePath': _selectedImage!.path,
                      },
                    );
                  } else {
                    context.pushNamed(
                      'Wait',
                      pathParameters: {'taskType': 'image'},
                      queryParameters: {'prompt': prompt},
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _pickPhotoFromGallery() async {
    final hasPermission = await PermissionManager.requestPhotosPermission();
    if (!hasPermission) return;

    final file = await _picker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      setState(() => _selectedImage = file);
    }
  }

  /// 构建顶部区域（背景图 + 标题 + 输入框）
  Widget _buildTopSection(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        Positioned.fill(
          child: Consumer(
            builder: (context, ref, child) {
              final selectedStyle = ref.watch(artStyleNotifierProvider);
              // 无风格时显示纯黑背景，有风格时加载服务端返回的背景大图 URL
              if (selectedStyle.isNoStyle || selectedStyle.url.isEmpty) {
                return Image.asset(
                  AppVideoImage.quickArtNoStyleBackground,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                );
              }
              return CachedNetworkImage(
                imageUrl: selectedStyle.url,
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
                placeholder: (context, url) => Container(color: Colors.black),
                errorWidget: (context, url, error) =>
                    Container(color: Colors.black),
              );
            },
          ),
        ),
        Positioned.fill(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black],
              ),
            ),
          ),
        ),
        Column(
          children: [
            SizedBox(height: MediaQuery.of(context).padding.top),
            _buildHeader(context),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 12),
                  //提示词文本域
                  const PromptTextField(family: 'textToImage'),
                  const SizedBox(height: 12),
                  //可选区域，例如图生文、参考图片、数量、比例
                  _buildOptionsSection(context),
                  const SizedBox(height: 12),
                  //艺术风格
                  const ArtStyleSelector(),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(AppIcons.quickArtTitle, height: 50),
          Row(
            children: [
              GestureDetector(
                onTap: () => context.push('/payment'),
                child: Container(
                  height: 34,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF222222),
                    borderRadius: BorderRadius.circular(17),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(AppIcons.points, width: 16, height: 16),
                      const SizedBox(width: 4),
                      Text(
                        ref
                            .watch(userProfileNotifierProvider)
                            .whenData((p) => p.pointsBalance)
                            .valueOrNull
                            ?.toString() ??
                            '-',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          height: 1,
                        ),
                      ),
                      const SizedBox(width: 6),
                      SvgPicture.asset(AppIcons.vip, width: 20, height: 20),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 16),
              GestureDetector(
                onTap: () => context.push('/setting'),
                child: SvgPicture.asset(
                  AppIcons.homeSettings,
                  width: 24,
                  height: 24,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOptionsSection(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    if (_isRatioSelectorVisible) {
      return SizedBox(
        height: 28,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: _ratios.length + 1,
          separatorBuilder: (_, _) => const SizedBox(width: 10),
          itemBuilder: (context, index) {
            if (index == 0) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _isRatioSelectorVisible = false;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF2A2A2A),
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: const Color(0xFF4A4A4A)),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      AppIcons.backPreviousPage,
                      width: 14,
                      height: 14,
                    ),
                  ),
                ),
              );
            }

            final ratio = _ratios[index - 1];
            final isSelected = ratio == _selectedRatio;
            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedRatio = ratio;
                });
              },
              child: _buildRatioChip(ratio, isSelected: isSelected),
            );
          },
        ),
      );
    }

    return Row(
      children: [
        _buildActionItem(
          AppIcons.homeImageToText,
          l10n.home_describe,
        ),
        const SizedBox(width: 10),
        _buildPhotoButton(context, l10n),
        const SizedBox(width: 10),
        GestureDetector(
          onTap: () {
            setState(() {
              _isRatioSelectorVisible = true;
            });
          },
          child: _buildActionItem(
            _ratioIconPath(_selectedRatio),
            _selectedRatio,
            trailingIconPath: AppIcons.ratioNext,
          ),
        ),
      ],
    );
  }

  Widget _buildPhotoButton(BuildContext context, AppLocalizations l10n) {
    if (_selectedImage != null) {
      return GestureDetector(
        onTap: () => setState(() => _selectedImage = null),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
          decoration: BoxDecoration(
            color: const Color(0xFF2A2A2A),
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: const Color(0xFF4A4A4A)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(3),
                child: Image.file(
                  File(_selectedImage!.path),
                  width: 20,
                  height: 20,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 4),
              const Icon(Icons.close, color: Colors.white, size: 12),
              const SizedBox(width: 2),
              Text(
                l10n.home_remove_photo,
                style: const TextStyle(
                  color: Color(0xFFCECECE),
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      );
    }
    return GestureDetector(
      onTap: _pickPhotoFromGallery,
      child: _buildActionItem(AppIcons.homePhoto, l10n.home_add_photo),
    );
  }

  Widget _buildRatioChip(String ratio, {required bool isSelected}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFF2A2A2A),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: isSelected
              ? const Color(0xFF6E5BFF)
              : const Color(0xFF4A4A4A),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(_ratioIconPath(ratio), width: 12, height: 12),
          const SizedBox(width: 8),
          Text(
            ratio,
            style: const TextStyle(
              color: Color(0xFFCECECE),
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  String _ratioIconPath(String ratio) {
    switch (ratio) {
      case '1:1':
        return AppIcons.ratioIc11;
      case '4:5':
        return AppIcons.ratioIc45;
      case '5:4':
        return AppIcons.ratioIc54;
      case '3:4':
        return AppIcons.ratioIc34;
      case '4:3':
        return AppIcons.ratioIc43;
      case '9:16':
        return AppIcons.ratioIc916;
      case '16:9':
        return AppIcons.ratioIc169;
      default:
        return AppIcons.ratioIc11;
    }
  }

  Widget _buildActionItem(
    String iconPath,
    String label, {
    String? trailingIconPath,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFF2A2A2A),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: const Color(0xFF4A4A4A)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(iconPath, width: 12, height: 12),
          const SizedBox(width: 4),
          Text(
            label,
            style: const TextStyle(
              color: Color(0xFFCECECE),
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          if (trailingIconPath != null) ...[
            const SizedBox(width: 4),
            SvgPicture.asset(trailingIconPath, width: 12, height: 12),
          ],
        ],
      ),
    );
  }
}
