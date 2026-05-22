import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quick_art/core/localization/l10n/app_localizations.dart';
import 'package:quick_art/core/permission/permission_manager.dart';
import 'package:quick_art/core/resource_management/app_icons.dart';
import 'package:quick_art/core/resource_management/app_video_image.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// AI 换脸页面
class AiFaceSwappingScreen extends StatefulWidget {
  /// 构造
  const AiFaceSwappingScreen({super.key});

  @override
  State<AiFaceSwappingScreen> createState() => _AiFaceSwappingScreenState();
}

class _AiFaceSwappingScreenState extends State<AiFaceSwappingScreen> {
  static const _guideShownKey = 'face_swap_guide_shown';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _maybeShowGuide());
  }

  Future<void> _maybeShowGuide() async {
    final prefs = await SharedPreferences.getInstance();
    final shown = prefs.getBool(_guideShownKey) ?? false;
    if (shown || !mounted) return;
    await prefs.setBool(_guideShownKey, true);
    if (!mounted) return;
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) => const FaceSwapGuideBottomSheet(),
    );
  }

  Future<void> _pickPhoto() async {
    final hasPermission = await PermissionManager.requestPhotosPermission();
    if (!hasPermission) return;
    /// 相册拾取
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null && mounted) {
      context.push('/tools/ai-face-swapping/loading', extra: image.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _AppBar(l10n: l10n),
            const SizedBox(height: 16),
            Center(
              child: Text(
                l10n.tools_ai_face_swap,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Center(
              child: Text(
                l10n.tools_ai_face_swap_subtitle,
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.7),
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: _CustomPhotoCard(l10n: l10n, onTap: _pickPhoto),
            ),
          ],
        ),
      ),
    );
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar({required this.l10n});

  final AppLocalizations l10n;

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

class _CustomPhotoCard extends StatelessWidget {
  const _CustomPhotoCard({required this.l10n, required this.onTap});

  final AppLocalizations l10n;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: SizedBox(
          height: 130,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                AppVideoImage.customPhotoAsset,
                fit: BoxFit.cover,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    l10n.tools_ai_face_swap_custom_photo,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// 换脸引导底部弹窗
class FaceSwapGuideBottomSheet extends StatelessWidget {
  /// 构造
  const FaceSwapGuideBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF1C1C1E),
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 关闭按钮
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: const Icon(Icons.close, color: Colors.white, size: 22),
              ),
            ),
            const SizedBox(height: 4),
            // 标题
            Text(
              l10n.tools_ai_face_swap_guide_title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 20),
            // 适合的照片
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                l10n.tools_ai_face_swap_guide_good,
                style: const TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
            const SizedBox(height: 10),
            const _PhotoGrid(
              paths: [
                AppVideoImage.faceSwapGuideGood1,
                AppVideoImage.faceSwapGuideGood2,
                AppVideoImage.faceSwapGuideGood3,
              ],
              isGood: true,
            ),
            const SizedBox(height: 16),
            // 不适合的照片
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                l10n.tools_ai_face_swap_guide_bad,
                style: const TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
            const SizedBox(height: 10),
            const _PhotoGrid(
              paths: [
                AppVideoImage.faceSwapGuideBad1,
                AppVideoImage.faceSwapGuideBad2,
                AppVideoImage.faceSwapGuideBad3,
              ],
              isGood: false,
            ),
            const SizedBox(height: 16),
            // 提示文字
            Text(
              l10n.tools_ai_face_swap_guide_tip,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.6),
                fontSize: 12,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 24),
            // 知道了按钮
            GestureDetector(
              onTap: () => Navigator.of(context).pop(),
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
                      l10n.tools_ai_face_swap_guide_got_it,
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

class _PhotoGrid extends StatelessWidget {
  const _PhotoGrid({required this.paths, required this.isGood});

  final List<String> paths;
  final bool isGood;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: paths.map((path) {
        return Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              right: path != paths.last ? 8 : 0,
            ),
            child: _PhotoTile(path: path, isGood: isGood),
          ),
        );
      }).toList(),
    );
  }
}

class _PhotoTile extends StatelessWidget {
  const _PhotoTile({required this.path, required this.isGood});

  final String path;
  final bool isGood;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: AspectRatio(
        aspectRatio: 1,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(path, fit: BoxFit.cover),
            Positioned(
              right: 6,
              bottom: 6,
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isGood
                      ? const Color(0xFF4CAF50)
                      : const Color(0xFFE53935),
                ),
                child: Icon(
                  isGood ? Icons.check : Icons.close,
                  color: Colors.white,
                  size: 13,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
