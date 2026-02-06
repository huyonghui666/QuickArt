import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quick_art/features/home/presentation/notifiers/inspiration_provider.dart';
import 'package:quick_art/features/home/presentation/notifiers/template_notifier.dart';
import 'package:quick_art/features/home/presentation/widgets/inspiration_section.dart';

class TemplateCategoryGrid extends ConsumerWidget {
  final String category;

  const TemplateCategoryGrid({super.key, required this.category});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // If category is "newest", pass null to backend
    // Assuming the backend uses uppercase or specific strings for categories,
    // we might need to adjust. For now passing the enum name (e.g. "manga").
    final backendCategory = category == 'newest' ? null : category;

    final templatesAsync = ref.watch(
      templatesProvider(category: backendCategory),
    );

    return templatesAsync.when(
      data: (templates) {
        if (templates.isEmpty) {
          return const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Center(
                child: Text(
                  'No templates found',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          );
        }
        final cards = templates
            .map(
              (t) =>
                  InspirationCardModel(imageUrl: t.thumbnailUrl ?? t.imageUrl),
            )
            .toList();
        return InspirationGrid(cards: cards);
      },
      loading: () => const SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Center(child: CircularProgressIndicator()),
        ),
      ),
      error: (err, stack) => const SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Center(
            child: Text(
              'Error loading templates',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
