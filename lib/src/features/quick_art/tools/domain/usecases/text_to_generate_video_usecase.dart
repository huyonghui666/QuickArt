import 'package:quick_art/src/features/quick_art/tools/domain/entities/video_generation_task.dart';
import 'package:quick_art/src/features/quick_art/tools/domain/repositories/text_to_video_repository.dart';

class TextToGenerateVideoUseCase {
  final TextToVideoRepository _textToVideoRepository;

  TextToGenerateVideoUseCase(this._textToVideoRepository);

  Stream<VideoGenerationTask> execute(String prompt) {
    return _textToVideoRepository.getVideoUrlStream(prompt);
  }
}