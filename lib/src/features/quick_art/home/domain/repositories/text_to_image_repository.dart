import 'dart:async';

import 'package:quick_art/src/features/quick_art/home/domain/entities/image_generation_task.dart';

abstract class TextToImageRepository {
  Future<ImageGenerationTask> generateImage(String prompt);
  Stream<String> getImageUrlStream(String taskId);
}
