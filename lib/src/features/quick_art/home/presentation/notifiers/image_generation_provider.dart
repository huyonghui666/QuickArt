import 'dart:async';

import 'package:quick_art/src/core/di/injection_container.dart';
import 'package:quick_art/src/core/websocket/websocket_provider.dart';
import 'package:quick_art/src/features/quick_art/home/data/models/image_generation_task_model.dart';
import 'package:quick_art/src/shared/models/generate_task_type.dart';
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
    // 优雅重试：直接让 Provider 失效，触发重新构建 (re-build)，
    // 这样会自动调用 build(prompt) 并重新开始 _startGeneration。
    // 由于 prompt 是 Family 参数，它会自动被保留使用。
    ref.invalidateSelf();
  }
}
