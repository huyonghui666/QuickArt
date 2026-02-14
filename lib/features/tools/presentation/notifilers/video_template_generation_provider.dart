import 'package:quick_art/core/di/injection_container.dart';
import 'package:quick_art/core/models/generate_task_type.dart';
import 'package:quick_art/core/websocket/websocket_provider.dart';
import 'package:quick_art/features/tools/domain/entities/video_generation_task.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'video_template_generation_provider.g.dart';

/// State to hold the input
class VideoTemplateGenerationInput {
  /// 构造
  VideoTemplateGenerationInput({this.imagePath, this.prompt});
  /// 图片本地路径
  final String? imagePath;
  /// 提示词
  final String? prompt;
}

///
@Riverpod(keepAlive: true)
class VideoTemplateInput extends _$VideoTemplateInput {
  @override
  VideoTemplateGenerationInput build() => VideoTemplateGenerationInput();
  /// 设置
  void setInput(String imagePath, String prompt) {
    state = VideoTemplateGenerationInput(imagePath: imagePath, prompt: prompt);
  }
}

/// 视频模板生成Notifier
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
        throw Exception('Image not selected');
      }

      final useCase = ref.read(generateVideoFromImageUseCaseProvider);
      final task = await useCase.execute(prompt, input.imagePath!);

      // 自动订阅 WebSocket 任务状态
      ref
          .read(webSocketNotifierProvider.notifier)
          .subscribeTask(task.taskId, type: GenerateTaskType.video);

      state = AsyncValue.data(task);
    } on Exception catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }
  /// 重试
  void retry() {
    ref.invalidateSelf();
  }
}
