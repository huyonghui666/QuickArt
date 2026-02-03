import 'dart:async';

import 'package:quick_art/features/home/data/models/image_generation_task_model.dart';

abstract class TextToImageRepository {
  Future<ImageGenerationTaskModel> submitTask(String prompt);
}
