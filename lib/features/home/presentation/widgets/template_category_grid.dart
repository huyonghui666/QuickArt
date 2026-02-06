import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_art/features/home/presentation/notifiers/template_notifier.dart';

class TemplateCategoryGrid extends ConsumerWidget {
  final String category;

  const TemplateCategoryGrid({super.key, required this.category});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // If category is "newest", pass null to backend
    final backendCategory = category == 'newest' ? null : category;

    final templatesAsync = ref.watch(
      templatesProvider(category: backendCategory),
    );

    return templatesAsync.when(
      data: (templatePage) {
        final templates = templatePage.items;
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

        return SliverGrid.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.75,
          ),
          itemCount: templates.length + (templatePage.hasMore ? 1 : 0),
          itemBuilder: (context, index) {
            if (index == templates.length) {
              return const Center(child: CircularProgressIndicator());
            }

            final template = templates[index];
            return GestureDetector(
              onTap: () {
                // context.push('/tools/text-to-image?templateId=${template.id}');
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    CachedNetworkImage(
                      imageUrl: template.thumbnailUrl ?? template.imageUrl,
                      fit: BoxFit.cover,
                      placeholder: (_, __) =>
                          const Center(child: CircularProgressIndicator()),
                      errorWidget: (_, __, ___) => const Icon(Icons.error),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.black.withOpacity(0.8),
                              Colors.transparent,
                            ],
                          ),
                        ),
                        child: Text(
                          template.name[Localizations.localeOf(
                                context,
                              ).languageCode] ??
                              template.name['en'] ??
                              template.name.values.first ??
                              '',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      loading: () => const SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Center(child: CircularProgressIndicator()),
        ),
      ),
      error: (err, stack) => SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Text(
              'Error loading templates: $err',
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
