import 'package:quick_art/src/features/quick_art/home/domain/entities/image_generation_task.dart';
import 'package:quick_art/src/features/quick_art/home/domain/repositories/text_to_image_repository.dart';

class TextToGenerateImageUseCase {
  final TextToImageRepository _textToImageRepository;

  TextToGenerateImageUseCase(this._textToImageRepository);

  Stream<ImageGenerationTask> execute(String prompt) {
    return _textToImageRepository.generateImageStream(prompt);
  }
}
