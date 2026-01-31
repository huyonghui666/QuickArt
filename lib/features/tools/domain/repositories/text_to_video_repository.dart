import 'package:quick_art/features/tools/data/models/video_generation_task_model.dart';

abstract class TextToVideoRepository {
  Future<VideoGenerationTaskModel> generateVideo(String prompt);

  Future<VideoGenerationTaskModel> generateVideoFromFrames(
    String prompt,
    String firstFramePath,
    String lastFramePath,
  );
}
