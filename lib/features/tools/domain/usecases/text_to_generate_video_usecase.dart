import 'package:quick_art/features/tools/data/models/video_generation_task_model.dart';
import 'package:quick_art/features/tools/domain/repositories/text_to_video_repository.dart';

class TextToGenerateVideoUseCase {
  final TextToVideoRepository _textToVideoRepository;

  TextToGenerateVideoUseCase(this._textToVideoRepository);

  Future<VideoGenerationTaskModel> execute(String prompt) {
    return _textToVideoRepository.generateVideo(prompt);
  }
}