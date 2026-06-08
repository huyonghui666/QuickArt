import 'dart:async';

import 'package:quick_art/core/di/injection_container.dart';
import 'package:quick_art/core/models/generate_task_type.dart';
import 'package:quick_art/core/websocket/websocket_provider.dart';
import 'package:quick_art/features/home/domain/entities/image_generation_task.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'image_edit_generation_provider.g.dart';

@riverpod
/// 图生图 Notifier
class ImageEditGenerationNotifier extends _$ImageEditGenerationNotifier {
  @override
  AsyncValue<ImageGenerationTask> build(String prompt, String imagePath) {
    _startGeneration(prompt, imagePath);
    return const AsyncLoading();
  }

  Future<void> _startGeneration(String prompt, String imagePath) async {
    state = const AsyncLoading();
    try {
      final useCase = ref.read(imageEditUseCaseProvider);
      final task = await useCase.execute(prompt, imagePath);

      ref
          .read(webSocketNotifierProvider.notifier)
          .subscribeTask(task.taskId, type: GenerateTaskType.imageEdit);

      state = AsyncData(task);
    } on Exception catch (e, stack) {
      state = AsyncError(e, stack);
    }
  }

  /// 重试
  void retry() {
    ref.invalidateSelf();
  }
}
