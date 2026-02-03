import 'package:quick_art/features/home/domain/entities/image_generation_task.dart';
import 'package:quick_art/features/home/domain/repositories/text_to_image_repository.dart';

class TextToGenerateImageUseCase {
  final TextToImageRepository _textToImageRepository;

  TextToGenerateImageUseCase(this._textToImageRepository);

  Future<ImageGenerationTask> execute(String prompt) {
    return _textToImageRepository.submitTask(prompt);
  }
}
