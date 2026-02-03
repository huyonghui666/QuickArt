import 'package:quick_art/features/home/data/models/image_generation_task_model.dart';
import 'package:quick_art/features/home/domain/repositories/text_to_image_repository.dart';


class TextToGenerateImageUseCase {
  final TextToImageRepository _textToImageRepository;

  TextToGenerateImageUseCase(this._textToImageRepository);

  Future<ImageGenerationTaskModel> execute(String prompt) {
    return _textToImageRepository.submitTask(prompt);
  }
}
