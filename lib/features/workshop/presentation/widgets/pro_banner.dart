import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quick_art/core/localization/l10n/app_localizations.dart';
import 'package:quick_art/core/theme/app_icons.dart';

/// Pro组件
class ProBanner extends StatelessWidget {
  /// 构造
  const ProBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF4A00E0), // Deep Purple
            Color(0xFF8E2DE2), // Light Purple
            Color(0xFFE94057), // Red/Pink
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SvgPicture.asset(AppIcons.quickArtTitle, height: 35),
                  const SizedBox(width: 8),
                  SvgPicture.asset(
                    AppIcons.pro,
                    height: 22,
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                l10n.pro_banner_description,
                style: const TextStyle(fontSize: 14, color: Colors.white70),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            ),
            child: Text(l10n.pro_banner_action),
          ),
        ],
      ),
    );
  }
}
