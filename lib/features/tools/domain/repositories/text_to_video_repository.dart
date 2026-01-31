import 'package:quick_art/features/tools/domain/entities/video_generation_task.dart';

abstract class TextToVideoRepository {
  Future<VideoGenerationTask> generateVideo(String prompt);

  Future<VideoGenerationTask> generateVideoFromFrames(
    String prompt,
    String firstFramePath,
    String lastFramePath, {
    String aspectRatio = '16:9',
  });
}
