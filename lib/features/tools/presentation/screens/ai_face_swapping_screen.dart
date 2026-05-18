import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_art/core/localization/l10n/app_localizations.dart';
import 'package:quick_art/core/resource_management/app_icons.dart';
import 'package:quick_art/core/resource_management/app_video_image.dart';

/// AI 换脸页面
class AiFaceSwappingScreen extends StatelessWidget {
  /// 构造
  const AiFaceSwappingScreen({super.key});

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
              child: _CustomPhotoCard(l10n: l10n),
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
  const _CustomPhotoCard({required this.l10n});

  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
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
            // 文字居中对齐到左侧
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
    );
  }
}
