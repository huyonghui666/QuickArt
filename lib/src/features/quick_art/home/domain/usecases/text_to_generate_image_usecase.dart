import 'package:quick_art/src/features/quick_art/home/data/models/image_generation_task_model.dart';
import 'package:quick_art/src/features/quick_art/home/domain/repositories/text_to_image_repository.dart';

class TextToGenerateImageUseCase {
  final TextToImageRepository _textToImageRepository;

  TextToGenerateImageUseCase(this._textToImageRepository);

  Future<ImageGenerationTaskModel> execute(String prompt) {
    return _textToImageRepository.generateImage(prompt);
  }
}
