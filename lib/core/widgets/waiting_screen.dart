import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_art/core/di/provider/show_bottom_sheet_notifier.dart';
import 'package:quick_art/core/utils/log/logger.dart';
import 'package:quick_art/core/websocket/model/generation_result_model.dart';
import 'package:quick_art/core/websocket/websocket_provider.dart';
import 'package:quick_art/features/home/data/models/image_generation_task_model.dart';
import 'package:quick_art/features/home/presentation/notifiers/image_generation_provider.dart';
import 'package:quick_art/features/tools/data/models/video_generation_task_model.dart';
import 'package:quick_art/features/tools/presentation/notifilers/start_end_frame_generation_provider.dart';
import 'package:quick_art/features/tools/presentation/notifilers/video_generation_provider.dart';
import 'package:rive/rive.dart';

final _waitingScreenErrorProvider = StateProvider.autoDispose<String?>(
  (ref) => null,
);

class WaitingScreen extends ConsumerWidget {
  final String taskType;
  final String prompt;

  const WaitingScreen({
    super.key,
    required this.taskType,
    required this.prompt,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 监听 WebSocket 结果事件
    ref.listen(generationEventProvider, (previous, next) {
      next.whenData((event) {
        _handleEvent(context, ref, event);
      });
    });

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: (taskType == 'video' || taskType == 'start_end_frame')
          ? _buildVideoBody(context, ref)
          : _buildImageBody(context, ref),
    );
  }

  void _handleEvent(
    BuildContext context,
    WidgetRef ref,
    GenerationResultModel result,
  ) {
    // 统一处理事件，根据 taskType 获取对应的 Provider
    if (taskType == 'video') {
      final asyncTask = ref.read(videoGenerationNotifierProvider(prompt));
      asyncTask.whenData((taskModel) {
        _processEvent(context, ref, result, taskModel.taskId);
      });
    } else if (taskType == 'start_end_frame') {
      final asyncTask = ref.read(
        startEndFrameGenerationNotifierProvider(prompt),
      );
      asyncTask.whenData((taskModel) {
        _processEvent(context, ref, result, taskModel.taskId);
      });
    } else {
      final asyncTask = ref.read(imageGenerationNotifierProvider(prompt));
      asyncTask.whenData((taskModel) {
        _processEvent(context, ref, result, taskModel.taskId);
      });
    }
  }

  void _processEvent(
    BuildContext context,
    WidgetRef ref,
    GenerationResultModel result,
    String currentTaskId,
  ) {
    if (currentTaskId == result.taskId) {
      if (result.event == 'success' && result.url != null) {
        logger.i('$taskType generation success: ${result.url}');
        if (context.mounted) {
          context.pop();
        }
        ref
            .read(showBottomSheetNotifierProvider.notifier)
            .trigger(
              result.url!,
              (taskType == 'video' || taskType == 'start_end_frame')
                  ? BottomSheetType.video
                  : BottomSheetType.image,
            );
      } else if (result.event == 'failed') {
        ref.read(_waitingScreenErrorProvider.notifier).state =
            result.error ?? 'Unknown error';
      }
    }
  }

  Widget _buildVideoBody(BuildContext context, WidgetRef ref) {
    final asyncTask = taskType == 'start_end_frame'
        ? ref.watch(startEndFrameGenerationNotifierProvider(prompt))
        : ref.watch(videoGenerationNotifierProvider(prompt));

    final errorMessage = ref.watch(_waitingScreenErrorProvider);

    return asyncTask.when(
      loading: () => _buildLoadingView(context),
      error: (e, _) => _buildErrorView(e.toString(), () {
        if (taskType == 'start_end_frame') {
          ref
              .read(startEndFrameGenerationNotifierProvider(prompt).notifier)
              .retry();
        } else {
          ref.read(videoGenerationNotifierProvider(prompt).notifier).retry();
        }
      }),
      data: (VideoGenerationTaskModel taskModel) {
        if (errorMessage != null) {
          return _buildErrorView(errorMessage, () {
            ref.read(_waitingScreenErrorProvider.notifier).state = null;
            if (taskType == 'start_end_frame') {
              ref
                  .read(
                    startEndFrameGenerationNotifierProvider(prompt).notifier,
                  )
                  .retry();
            } else {
              ref
                  .read(videoGenerationNotifierProvider(prompt).notifier)
                  .retry();
            }
          });
        }
        return _buildLoadingView(context);
      },
    );
  }

  Widget _buildImageBody(BuildContext context, WidgetRef ref) {
    final asyncTask = ref.watch(imageGenerationNotifierProvider(prompt));
    final errorMessage = ref.watch(_waitingScreenErrorProvider);

    return asyncTask.when(
      loading: () => _buildLoadingView(context),
      error: (e, _) => _buildErrorView(e.toString(), () {
        ref.read(imageGenerationNotifierProvider(prompt).notifier).retry();
      }),
      data: (ImageGenerationTaskModel taskModel) {
        if (errorMessage != null) {
          return _buildErrorView(errorMessage, () {
            ref.read(_waitingScreenErrorProvider.notifier).state = null;
            ref.read(imageGenerationNotifierProvider(prompt).notifier).retry();
          });
        }
        return _buildLoadingView(context);
      },
    );
  }

  Widget _buildLoadingView(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        const RepaintBoundary(
          child: RiveAnimation.asset(
            'assets/rive_animation/4533-9212-wave-form.riv',
            fit: BoxFit.cover,
          ),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Creating...',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
              const SizedBox(height: 10),
              const Text(
                'The masterpiece is being generated',
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
              const SizedBox(height: 40),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextButton(
                  onPressed: () {
                    if (context.mounted) {
                      context.pop();
                    }
                  },
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Run in Background',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildErrorView(String error, VoidCallback onRetry) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.error_outline, color: Colors.red, size: 48),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              'Error: $error',
              style: const TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton(onPressed: onRetry, child: const Text('Retry')),
        ],
      ),
    );
  }
}
