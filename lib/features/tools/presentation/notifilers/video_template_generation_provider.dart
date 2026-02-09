import 'package:quick_art/core/di/injection_container.dart';
import 'package:quick_art/core/models/generate_task_type.dart';
import 'package:quick_art/core/websocket/websocket_provider.dart';
import 'package:quick_art/features/tools/domain/entities/video_generation_task.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'video_template_generation_provider.g.dart';

// State to hold the input
class VideoTemplateGenerationInput {
  final String? imagePath;
  final String? prompt;

  VideoTemplateGenerationInput({this.imagePath, this.prompt});
}

@Riverpod(keepAlive: true)
class VideoTemplateInput extends _$VideoTemplateInput {
  @override
  VideoTemplateGenerationInput build() => VideoTemplateGenerationInput();

  void setInput(String imagePath, String prompt) {
    state = VideoTemplateGenerationInput(imagePath: imagePath, prompt: prompt);
  }
}

@riverpod
class VideoTemplateGenerationNotifier
    extends _$VideoTemplateGenerationNotifier {
  @override
  AsyncValue<VideoGenerationTask> build(String prompt) {
    _startGeneration(prompt);
    return const AsyncValue.loading();
  }

  Future<void> _startGeneration(String prompt) async {
    state = const AsyncValue.loading();
    try {
      final input = ref.read(videoTemplateInputProvider);
      if (input.imagePath == null) {
        throw Exception("Image not selected");
      }

      final useCase = ref.read(generateVideoFromImageUseCaseProvider);
      final task = await useCase.execute(prompt, input.imagePath!);

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
