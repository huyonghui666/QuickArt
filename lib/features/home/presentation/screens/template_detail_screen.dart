import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_art/core/localization/l10n/app_localizations.dart';
import 'package:quick_art/core/theme/app_icons.dart';
import 'package:quick_art/features/home/domain/entities/image_template.dart';

import 'package:quick_art/core/provider/prompt_provider.dart';

class TemplateDetailScreen extends ConsumerWidget {
  final ImageTemplate template;

  const TemplateDetailScreen({super.key, required this.template});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RepaintBoundary(
      child: Container(
        color: Colors.black,
        child: Stack(
          children: [
            // Fullscreen Image
            Positioned.fill(
              child: InteractiveViewer(
                child: CachedNetworkImage(
                  imageUrl: template.imageUrl,
                  fit: BoxFit.cover,
                  memCacheWidth: (MediaQuery.of(context).size.width *
                          MediaQuery.of(context).devicePixelRatio)
                      .toInt(),
                  placeholder: (_, __) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (_, __, ___) =>
                      const Icon(Icons.error, color: Colors.white),
                ),
              ),
            ),

            // Bottom Content
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withOpacity(0.9),
                    Colors.black.withOpacity(0.0),
                  ],
                ),
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    template.name[Localizations.localeOf(
                          context,
                        ).languageCode] ??
                        template.name['en'] ??
                        template.name.values.first ??
                        '',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  if (template.description != null)
                    Text(
                      template.description![Localizations.localeOf(
                            context,
                          ).languageCode] ??
                          template.description!['en'] ??
                          template.description!.values.first ??
                          '',
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                        height: 1.4,
                      ),
                      maxLines: 6,
                      overflow: TextOverflow.ellipsis,
                    ),
                  const SizedBox(height: 24),

                  // Try Prompt Button
                  GestureDetector(
                    onTap: () {
                      // Update prompt text and close
                      final currentLocale = Localizations.localeOf(
                        context,
                      ).languageCode;
                      final prompt =
                          template.description?[currentLocale] ??
                          template.description?['en'] ??
                          template.description?.values.first ??
                          '';
                      ref.read(promptProvider('textToImage').notifier)
                          .updateText(prompt);
                      context.pop();
                    },
                    child: SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(28),
                            child: SvgPicture.asset(
                              AppIcons.homeBtnStart,
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                            ),
                          ),
                          Text(
                            AppLocalizations.of(context)!.try_prompt ?? '尝试提示',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
      )
    );
  }
}
