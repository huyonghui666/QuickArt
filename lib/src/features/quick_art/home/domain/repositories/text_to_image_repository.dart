import 'dart:async';

import 'package:quick_art/src/features/quick_art/home/data/models/image_generation_task_model.dart';

abstract class TextToImageRepository {
  Future<ImageGenerationTaskModel> generateImage(String prompt);
}
