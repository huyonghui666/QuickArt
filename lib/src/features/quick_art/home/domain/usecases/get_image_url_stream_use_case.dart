import 'dart:async';

import 'package:quick_art/src/features/quick_art/home/domain/repositories/text_to_image_repository.dart';

class GetImageUrlStreamUseCase {
  final TextToImageRepository repository;

  GetImageUrlStreamUseCase(this.repository);

  Stream<String> call(String taskId) {
    return repository.getImageUrlStream(taskId);
  }
}