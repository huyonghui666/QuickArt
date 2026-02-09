import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quick_art/features/tools/presentation/notifilers/video_template_notifier.dart';
import 'package:quick_art/features/tools/presentation/widgets/ai_video_grid_item.dart';

class VideoTemplateGrid extends ConsumerStatefulWidget {
  /// 分类 Key
  final String category;

  const VideoTemplateGrid({super.key, required this.category});

  @override
  ConsumerState<VideoTemplateGrid> createState() => _VideoTemplateGridState();
}

class _VideoTemplateGridState extends ConsumerState<VideoTemplateGrid> {
  @override
  Widget build(BuildContext context) {
    // 监听视频模板数据状态
    final templatesAsync = ref.watch(
      videoTemplatesProvider(category: widget.category),
    );

    return templatesAsync.when(
      data: (page) {
        if (page.items.isEmpty) {
          return const Center(child: Text('No templates found'));
        }
        // 使用 NotificationListener 监听滚动到底部事件，触发加载更多
        return NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification scrollInfo) {
            if (scrollInfo.metrics.pixels >=
                scrollInfo.metrics.maxScrollExtent - 200) {
              ref
                  .read(
                    videoTemplatesProvider(category: widget.category).notifier,
                  )
                  .loadMore();
            }
            return false;
          },
          // 下拉刷新
          child: GridView.builder(
            padding: const EdgeInsets.all(16.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 3 / 4,
            ),
            itemCount: page.items.length + (page.hasMore ? 1 : 0),
            itemBuilder: (context, index) {
              // 如果渲染到最后一个 item 且还有更多数据，显示加载指示器并触发加载更多
              if (index == page.items.length) {
                Future.microtask(
                  () => ref
                      .read(
                        videoTemplatesProvider(
                          category: widget.category,
                        ).notifier,
                      )
                      .loadMore(),
                );
                return const Center(child: CircularProgressIndicator());
              }
              final template = page.items[index];
              return AiVideoGridItem(
                index: index,
                videoUrl: template.videoUrl,
                coverUrl: template.coverUrl,
                name: _getTemplateName(context, template.name),
                template: template,
              );
            },
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Center(child: Text('Error: $err')),
    );
  }

  String _getTemplateName(BuildContext context, Map<String, String> nameMap) {
    final locale = Localizations.localeOf(context).languageCode;
    // 优先匹配当前语言，如果没找到则尝试匹配 'en'，最后取第一个值
    return nameMap[locale] ?? nameMap['en'] ?? nameMap.values.firstOrNull ?? '';
  }
}
