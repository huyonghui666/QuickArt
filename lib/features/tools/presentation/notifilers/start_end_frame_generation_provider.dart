import 'package:quick_art/core/di/injection_container.dart';
import 'package:quick_art/core/models/generate_task_type.dart';
import 'package:quick_art/core/websocket/websocket_provider.dart';
import 'package:quick_art/features/tools/domain/entities/video_generation_task.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:quick_art/features/tools/presentation/notifilers/start_end_frame_provider.dart';

part 'start_end_frame_generation_provider.g.dart';

@riverpod
class StartEndFrameGenerationNotifier extends _$StartEndFrameGenerationNotifier {
  @override
  AsyncValue<VideoGenerationTask> build(String prompt) {
    _startGeneration(prompt);
    return const AsyncValue.loading();
  }

  Future<void> _startGeneration(String prompt) async {
    state = const AsyncValue.loading();
    try {
      final frames = ref.read(startEndFrameProvider);
      if (frames.startFramePath == null || frames.endFramePath == null) {
        throw Exception("Images not selected");
      }

      final useCase = ref.read(startEndFrameGenerateVideoUseCaseProvider);
      final task = await useCase.execute(
        prompt,
        frames.startFramePath!,
        frames.endFramePath!,
      );

      // 自动订阅 WebSocket 任务状态
      ref
          .read(webSocketNotifierProvider.notifier)
          .subscribeTask(task.taskId, type: GenerateTaskType.video);

      state = AsyncValue.data(task);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  void retry() {
    ref.invalidateSelf();
  }
}
