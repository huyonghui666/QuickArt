import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quick_art/core/localization/l10n/app_localizations.dart';
import 'package:quick_art/core/theme/app_icons.dart';

/// 生成图片底部弹出框
class GeneratedImageBottomSheet extends StatelessWidget {
  /// 构造
  const GeneratedImageBottomSheet({required this.imageUrl, super.key});
  /// 图片url
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return RepaintBoundary(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: AspectRatio(
                aspectRatio: 1,
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    color: Colors.grey[900],
                    child: const Center(
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  ),
                  errorWidget: (context, url, error) => Container(
                    color: Colors.grey[900],
                    child: const Icon(Icons.error, color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 42),
          Text(
            l10n.share_social_hint,
            style: const TextStyle(color: Colors.white70),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildSocialButton(
                AppIcons.homeHistory,
                l10n.share_save,
              ),
              _buildSocialButton(
                AppIcons.tikTok,
                l10n.share_tiktok,
              ),
              _buildSocialButton(
                AppIcons.instagram,
                l10n.share_instagram,
              ),
              _buildSocialButton(
                AppIcons.facebook,
                l10n.share_facebook,
              ),
            ],
          ),
        ],
        ),
      ),
    );
  }

  Widget _buildSocialButton(String iconPath, String label) {
    return Column(
      children: [
        SvgPicture.asset(iconPath, width: 50, height: 50),
        const SizedBox(height: 4),
        Text(label),
      ],
    );
  }
}
