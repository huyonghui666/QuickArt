import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_art/core/localization/l10n/app_localizations.dart';
import 'package:quick_art/core/resource_management/app_icons.dart';
import 'package:quick_art/features/tools/domain/entities/face_detect_result.dart';

/// AI 换脸 — 人脸选择页面
class AiFaceSelectScreen extends StatefulWidget {
  /// 构造
  const AiFaceSelectScreen({required this.result, super.key});

  /// 人脸检测结果
  final FaceDetectResult result;

  @override
  State<AiFaceSelectScreen> createState() => _AiFaceSelectScreenState();
}

class _AiFaceSelectScreenState extends State<AiFaceSelectScreen> {
  int? _selectedIndex;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
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
                selectedIndex: _selectedIndex,
                onSelect: (i) => setState(() => _selectedIndex = i),
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
            const Expanded(child: _PlaceholderGrid()),
          ],
        ),
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

class _FaceSwapRow extends StatelessWidget {
  const _FaceSwapRow({
    required this.faces,
    required this.selectedIndex,
    required this.onSelect,
  });

  final List<FaceInfo> faces;
  final int? selectedIndex;
  final ValueChanged<int> onSelect;

  // 每组宽度：人脸90 + 间距8 + 图标40 + 间距8 + 占位90 = 236
  static const double _tileSize = 90;
  static const double _iconSize = 40;
  static const double _gap = 8;
  static const double _groupWidth =
      _tileSize + _gap + _iconSize + _gap + _tileSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _tileSize + 20, // 上下留出边框空间
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.zero,
        itemCount: faces.length,
        separatorBuilder: (_, _) => const SizedBox(width: 16),
        itemBuilder: (_, i) {
          final isSelected = selectedIndex == i;
          return SizedBox(
            width: _groupWidth,
            child: Row(
              children: [
                _FaceTile(
                  url: faces[i].url,
                  isSelected: isSelected,
                  onTap: () => onSelect(i),
                ),
                const SizedBox(width: _gap),
                SvgPicture.asset(
                  isSelected
                      ? AppIcons.faceSwapAvatarChange
                      : AppIcons.faceSwapAvatarChangeUn,
                  width: _iconSize,
                  height: _iconSize,
                ),
                const SizedBox(width: _gap),
                // 占位容器
                Container(
                  width: _tileSize,
                  height: _tileSize,
                  decoration: BoxDecoration(
                    color: const Color(0xFF2C2C2E),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.15),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

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

class _PlaceholderGrid extends StatelessWidget {
  const _PlaceholderGrid();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: 12,
      itemBuilder: (_, _) => Container(
        decoration: BoxDecoration(
          color: const Color(0xFF2C2C2E),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
