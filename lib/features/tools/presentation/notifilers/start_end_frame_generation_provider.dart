import 'dart:async';

import 'package:quick_art/core/di/injection_container.dart';
import 'package:quick_art/core/models/generate_task_type.dart';
import 'package:quick_art/core/websocket/websocket_provider.dart';
import 'package:quick_art/features/tools/data/models/video_generation_task_model.dart';
import 'package:quick_art/features/tools/presentation/notifilers/start_end_frame_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'start_end_frame_generation_provider.g.dart';

@riverpod
class StartEndFrameGenerationNotifier
    extends _$StartEndFrameGenerationNotifier {
  @override
  AsyncValue<VideoGenerationTaskModel> build(String prompt) {
    _startGeneration(prompt);
    return const AsyncLoading();
  }

  Future<void> _startGeneration(String prompt) async {
    state = const AsyncLoading();
    try {
      final frames = ref.read(startEndFrameProvider);
      if (frames.startFramePath == null || frames.endFramePath == null) {
        throw Exception("Images not selected");
      }

      final useCase = ref.read(startEndFrameGenerateVideoUseCaseProvider);
      final taskModel = await useCase.execute(
        prompt,
        frames.startFramePath!,
        frames.endFramePath!,
      );

      // 自动订阅 WebSocket 任务状态
      ref
          .read(webSocketNotifierProvider.notifier)
          .subscribeTask(taskModel.taskId, type: GenerateTaskType.video);

      state = AsyncData(taskModel);
    } catch (e, stack) {
      state = AsyncError(e, stack);
    }
  }

  void retry() {
    ref.invalidateSelf();
  }
}
