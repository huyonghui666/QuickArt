import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quick_art/core/localization/l10n/app_localizations.dart';

class GeneratedImageBottomSheet extends StatelessWidget {
  final String imageUrl;

  const GeneratedImageBottomSheet({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: AspectRatio(
              aspectRatio: 1,
              child: Image.network(imageUrl, fit: BoxFit.cover),
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
                'assets/icons/svg/Home/home_ic_history.svg',
                l10n.share_save,
              ),
              _buildSocialButton(
                'assets/icons/svg/Setting/setting_ic_tt.svg',
                l10n.share_tiktok,
              ),
              _buildSocialButton(
                'assets/icons/svg/Setting/setting_ic_ins.svg',
                l10n.share_instagram,
              ),
              _buildSocialButton(
                'assets/icons/svg/Setting/setting_ic_fb.svg',
                l10n.share_facebook,
              ),
            ],
          ),
        ],
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
