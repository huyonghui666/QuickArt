import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quick_art/features/home/presentation/notifiers/inspiration_provider.dart';

import 'package:quick_art/core/localization/l10n/app_localizations.dart';

class InspirationTabBar extends ConsumerWidget {
  const InspirationTabBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(inspirationCategoriesProvider);
    final selectedIndex = ref.watch(selectedInspirationTabIndexProvider);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(categories.length, (index) {
          final category = categories[index];
          final isSelected = index == selectedIndex;
          return GestureDetector(
            onTap: () {
              ref
                  .read(selectedInspirationTabIndexProvider.notifier)
                  .setIndex(index);
            },
            child: Container(
              margin: const EdgeInsets.only(right: 16),
              child: Text(
                category.label,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.grey[600],
                  fontSize: 16,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class InspirationGrid extends ConsumerWidget {
  const InspirationGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cards = ref.watch(currentInspirationCardsProvider);

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
