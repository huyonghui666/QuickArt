import 'dart:async';

import 'package:quick_art/core/di/injection_container.dart';
import 'package:quick_art/core/models/generate_task_type.dart';
import 'package:quick_art/core/websocket/websocket_provider.dart';
import 'package:quick_art/features/home/data/models/image_generation_task_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'image_generation_provider.g.dart';

@riverpod
class ImageGenerationNotifier extends _$ImageGenerationNotifier {
  @override
  AsyncValue<ImageGenerationTaskModel> build(String prompt) {
    // 自动触发请求
    _startGeneration(prompt);
    return const AsyncLoading();
  }

  Future<void> _startGeneration(String prompt) async {
    state = const AsyncLoading();
    try {
      final useCase = ref.read(textToGenerateImageUseCaseProvider);
      final taskIdModel = await useCase.execute(prompt);

      // 自动订阅 WebSocket 任务状态
      ref
          .read(webSocketNotifierProvider.notifier)
          .subscribeTask(taskIdModel.taskId, type: GenerateTaskType.image);

      state = AsyncData(taskIdModel);
    } catch (e, stack) {
      state = AsyncError(e, stack);
    }
  }

  void retry() {
    ref.invalidateSelf();
  }
}
