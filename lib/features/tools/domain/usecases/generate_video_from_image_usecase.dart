import 'package:quick_art/features/tools/domain/entities/video_generation_task.dart';
import 'package:quick_art/features/tools/domain/repositories/text_to_video_repository.dart';

class GenerateVideoFromImageUseCase {
  final TextToVideoRepository _repository;

  GenerateVideoFromImageUseCase(this._repository);

  Future<VideoGenerationTask> execute(
    String prompt,
    String imagePath, {
    String aspectRatio = '16:9',
  }) {
    return _repository.generateVideoFromImage(
      prompt,
      imagePath,
      aspectRatio: aspectRatio,
    );
  }
}
