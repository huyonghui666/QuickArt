import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quick_art/src/features/quick_art/home/presentation/notifiers/inspiration_provider.dart';

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
              ref.read(selectedInspirationTabIndexProvider.notifier).state =
                  index;
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

    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.75,
      ),
      delegate: SliverChildBuilderDelegate((context, index) {
        final card = cards[index];
        return InspirationCard(card: card);
      }, childCount: cards.length),
    );
  }
}

class InspirationCard extends StatelessWidget {
  const InspirationCard({super.key, required this.card});

  final InspirationCardModel card;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(card.imageUrl, fit: BoxFit.cover),
          Positioned(
            bottom: 8,
            right: 8,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'Try',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
