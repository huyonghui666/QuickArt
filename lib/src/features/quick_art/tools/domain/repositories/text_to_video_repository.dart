import 'package:quick_art/src/features/quick_art/tools/data/models/video_generation_task_model.dart';

abstract class TextToVideoRepository {
  Future<VideoGenerationTaskModel> generateVideo(String prompt);

  Future<VideoGenerationTaskModel> generateVideoFromFrames(
    String prompt,
    String firstFramePath,
    String lastFramePath,
  );
}
