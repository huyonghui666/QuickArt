import 'dart:async';

import 'package:quick_art/core/di/injection_container.dart';
import 'package:quick_art/core/models/generate_task_type.dart';
import 'package:quick_art/core/websocket/websocket_provider.dart';
import 'package:quick_art/features/home/domain/entities/image_generation_task.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'image_generation_provider.g.dart';

@riverpod
class ImageGenerationNotifier extends _$ImageGenerationNotifier {
  @override
  AsyncValue<ImageGenerationTask> build(String prompt) {
    // 自动触发请求
    _startGeneration(prompt);
    return const AsyncLoading();
  }

  Future<void> _startGeneration(String prompt) async {
    state = const AsyncLoading();
    try {
      final useCase = ref.read(textToGenerateImageUseCaseProvider);
      final task = await useCase.execute(prompt);

      // 自动订阅 WebSocket 任务状态
      ref
          .read(webSocketNotifierProvider.notifier)
          .subscribeTask(task.taskId, type: GenerateTaskType.image);

      state = AsyncData(task);
    } catch (e, stack) {
      state = AsyncError(e, stack);
    }
  }

  void retry() {
    ref.invalidateSelf();
  }
}
