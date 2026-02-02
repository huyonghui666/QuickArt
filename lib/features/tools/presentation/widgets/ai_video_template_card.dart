import 'package:flutter/material.dart';
import 'package:quick_art/core/localization/l10n/app_localizations.dart';

class VideoTemplateCard extends StatelessWidget {
  final int index;
  const VideoTemplateCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            'https://picsum.photos/seed/video_template_$index/400/600',
            fit: BoxFit.cover,
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withValues(alpha: 0.7),
                ],
                stops: const [0.6, 1.0],
              ),
            ),
          ),
          Positioned(
            left: 8,
            bottom: 8,
            right: 8,
            child: Text(
              _getTemplateName(index, l10n),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          if (index % 5 == 0) // Add a 'NEW' badge to some items for variety
            Positioned(
              top: 8,
              right: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  l10n.tools_new_badge,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  // Helper to get varied names for templates
  String _getTemplateName(int index, AppLocalizations l10n) {
    final names = [
      l10n.tools_template_kiss_pro,
      l10n.tools_template_cat,
      l10n.tools_template_heartbeat_404,
      l10n.tools_template_skull_universe,
      l10n.tools_template_koi,
      l10n.tools_template_redemption_rain,
    ];
    return names[index % names.length];
  }
}
