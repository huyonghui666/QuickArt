import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quick_art/src/features/quick_art/workshop/presentation/notifiers/workshop_tasks_provider.dart';
import 'package:quick_art/src/features/quick_art/workshop/presentation/widgets/pro_banner.dart';
import 'package:quick_art/src/features/quick_art/workshop/presentation/widgets/workshop_header.dart';
import 'package:quick_art/src/features/quick_art/workshop/presentation/widgets/workshop_task_card.dart';
import 'package:quick_art/src/shared/models/generate_task_type.dart';
import 'package:quick_art/src/shared/provider/show_bottom_sheet_notifier.dart';

class WorkshopScreen extends ConsumerStatefulWidget {
  const WorkshopScreen({super.key});

  @override
  ConsumerState<WorkshopScreen> createState() => _WorkshopScreenState();
}

class _WorkshopScreenState extends ConsumerState<WorkshopScreen> {
  @override
  Widget build(BuildContext context) {
    final tasksAsyncValue = ref.watch(workshopTasksNotifierProvider);

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            const WorkshopHeader(),
            const ProBanner(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: tasksAsyncValue.when(
                  data: (tasks) {
                    if (tasks.isEmpty) {
                      return SizedBox.expand(
                        child: Image.asset(
                          'assets/images/bg/workshop_bg.webp',
                          fit: BoxFit.cover,
                        ),
                      );
                    }
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 16,
                            crossAxisSpacing: 16,
                            childAspectRatio: 0.8,
                          ),
                      itemCount: tasks.length,
                      itemBuilder: (context, index) {
                        final task = tasks[index];
                        return WorkshopTaskCard(
                          task: task,
                          onTap: () {
                            if (task.url != null) {
                              ref
                                  .read(
                                    showBottomSheetNotifierProvider.notifier,
                                  )
                                  .trigger(
                                    task.url!,
                                    task.type == GenerateTaskType.video
                                        ? BottomSheetType.video
                                        : BottomSheetType.image,
                                  );
                            }
                          },
                          onRetry: () {
                            // TODO: Implement retry logic
                            debugPrint('Retry task ${task.id}');
                          },
                        );
                      },
                    );
                  },
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (error, stack) => Center(
                    child: Text(
                      '加载失败: $error',
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
