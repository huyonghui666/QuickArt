import 'package:quick_art/features/tools/domain/entities/video_generation_task.dart';
import 'package:quick_art/features/tools/domain/repositories/text_to_video_repository.dart';

class TextToGenerateVideoUseCase {
  final TextToVideoRepository _repository;

  TextToGenerateVideoUseCase(this._repository);

  Future<VideoGenerationTask> execute(String prompt) {
    return _repository.generateVideo(prompt);
  }
}