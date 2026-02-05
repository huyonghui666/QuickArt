import 'dart:async';

import 'package:quick_art/features/home/domain/entities/image_generation_task.dart';

abstract class TextToImageRepository {
  Future<ImageGenerationTask> submitTask(String prompt);
}
