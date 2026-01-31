import 'package:quick_art/core/di/injection_container.dart';
import 'package:quick_art/core/models/generate_task_type.dart';
import 'package:quick_art/core/websocket/websocket_provider.dart';
import 'package:quick_art/features/tools/domain/entities/video_generation_task.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'video_generation_provider.g.dart';

@riverpod
class VideoGenerationNotifier extends _$VideoGenerationNotifier {
  @override
  AsyncValue<VideoGenerationTask> build(String prompt) {
    _startGeneration(prompt);
    return const AsyncValue.loading();
  }

  Future<void> _startGeneration(String prompt) async {
    state = const AsyncValue.loading();
    try {
      final useCase = ref.read(textToGenerateVideoUseCaseProvider);
      final task = await useCase.execute(prompt);

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
    // 优雅重试：直接让 Provider 失效，触发重新构建 (re-build)，
    // 这样会自动调用 build(prompt) 并重新开始 _startGeneration。
    // 由于 prompt 是 Family 参数，它会自动被保留使用。
    ref.invalidateSelf();
  }
}
