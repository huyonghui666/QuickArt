import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:quick_art/features/home/presentation/notifiers/inspiration_provider.dart';

import 'package:quick_art/core/localization/l10n/app_localizations.dart';

class InspirationCard extends StatelessWidget {
  const InspirationCard({super.key, required this.card});

  final InspirationCardModel card;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final imageWidth = constraints.maxWidth;
        final imageHeight = constraints.maxHeight;
        final devicePixelRatio = MediaQuery.of(context).devicePixelRatio;

        return ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Stack(
            fit: StackFit.expand,
            children: [
              CachedNetworkImage(
                imageUrl: card.imageUrl,
                memCacheWidth: (imageWidth * devicePixelRatio).round(),
                memCacheHeight: (imageHeight * devicePixelRatio).round(),
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              Positioned(
                bottom: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.5),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    AppLocalizations.of(context)!.inspiration_try,
                    style: const TextStyle(color: Colors.white, fontSize: 12),
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

class InspirationGrid extends StatelessWidget {
  const InspirationGrid({super.key, required this.cards});

  final List<InspirationCardModel> cards;

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.75,
      ),
      itemBuilder: (context, index) {
        final card = cards[index];
        return InspirationCard(card: card);
      },
      itemCount: cards.length,
    );
  }
}
