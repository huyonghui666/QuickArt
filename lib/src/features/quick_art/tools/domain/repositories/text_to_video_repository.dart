import 'dart:async';

import 'package:quick_art/src/features/quick_art/tools/domain/entities/video_generation_task.dart';

abstract class TextToVideoRepository {
  Stream<VideoGenerationTask> getVideoUrlStream(String prompt);
}
