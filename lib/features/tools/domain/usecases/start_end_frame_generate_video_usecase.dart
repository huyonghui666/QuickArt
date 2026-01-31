import 'package:quick_art/features/tools/domain/entities/video_generation_task.dart';
import 'package:quick_art/features/tools/domain/repositories/text_to_video_repository.dart';

class StartEndFrameGenerateVideoUseCase {
  final TextToVideoRepository _repository;

  StartEndFrameGenerateVideoUseCase(this._repository);

  Future<VideoGenerationTask> execute(
    String prompt,
    String firstFramePath,
    String lastFramePath, {
    String aspectRatio = '16:9',
  }) {
    return _repository.generateVideoFromFrames(
      prompt,
      firstFramePath,
      lastFramePath,
      aspectRatio: aspectRatio,
    );
  }
}
