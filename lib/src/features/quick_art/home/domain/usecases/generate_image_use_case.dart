import 'package:quick_art/src/features/quick_art/home/domain/entities/image_generation_task.dart';
import 'package:quick_art/src/features/quick_art/home/domain/repositories/text_to_image_repository.dart';

class GenerateImageUseCase {
  final TextToImageRepository repository;

  GenerateImageUseCase(this.repository);

  Future<ImageGenerationTask> call(String prompt) {
    return repository.generateImage(prompt);
  }
}
