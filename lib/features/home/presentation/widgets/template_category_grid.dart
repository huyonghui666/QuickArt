import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quick_art/core/localization/l10n/app_localizations.dart';
import 'package:quick_art/features/home/presentation/notifiers/template_notifier.dart';
import 'package:quick_art/features/home/presentation/widgets/template_detail_show_modal_bottom_sheet.dart';

class TemplateCategoryGrid extends ConsumerWidget {
  final String category;

  const TemplateCategoryGrid({super.key, required this.category});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 由于后端存储的是new，但是new是关键字冲突了，所以先判断是newest就转为new去作为Category
    final backendCategory = category == 'newest' ? 'new' : category;

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
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.black,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  clipBehavior: Clip.hardEdge,
                  builder: (context) => FractionallySizedBox(
                    heightFactor: 0.75,
                    child: TemplateDetailShowModalBottomSheet(
                      template: template,
                    ),
                  ),
                );
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
                      bottom: 12,
                      right: 12,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0x33FFFFFF), // 半透明白色背景
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.white.withValues(alpha: 0.2),
                            width: 0.5,
                          ),
                        ),
                        child: Text(
                          AppLocalizations.of(context)!.try_it,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
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
