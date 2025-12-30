import 'dart:async';

import 'package:quick_art/src/core/di/injection_container.dart';
import 'package:quick_art/src/features/quick_art/home/domain/entities/image_generation_task.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'image_generation_provider.g.dart';

@riverpod
class ImageGenerationNotifier extends _$ImageGenerationNotifier {
  StreamSubscription<ImageGenerationTask>? _subscription;

  @override
  AsyncValue<ImageGenerationTask> build(String prompt) {
    // 注册销毁回调，确保 subscription 被正确取消
    ref.onDispose(() {
      _subscription?.cancel();
    });

    _startGeneration(prompt);
    return const AsyncLoading();
  }

  void _startGeneration(String prompt) {
    final useCase = ref.read(textToGenerateImageUseCaseProvider);
    _subscription = useCase
        .execute(prompt)
        .listen(
          (task) => state = AsyncData(task),
      onError: (e, stack) => state = AsyncError(e, stack),
    );
  }

  void retry() {
    // 优雅重试：直接让 Provider 失效，触发重新构建 (re-build)，
    // 这样会自动调用 build(prompt) 并重新开始 _startGeneration。
    // 由于 prompt 是 Family 参数，它会自动被保留使用。
    ref.invalidateSelf();
  }
}
