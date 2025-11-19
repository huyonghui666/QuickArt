import 'package:quick_art/src/features/quick_art/home/data/models/image_generation_task.dart';
import 'package:quick_art/src/features/quick_art/home/domain/repositories/text_to_image_repository.dart';

/// 实际只能获得taskId
class GenerateImageUseCase {
  final TextToImageRepository repository;

  GenerateImageUseCase(this.repository);

  Future<ImageGenerationTask> call(String prompt) {
    return repository.generateImage(prompt);
  }
}
