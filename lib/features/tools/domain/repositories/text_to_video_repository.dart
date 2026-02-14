import 'package:quick_art/features/tools/domain/entities/video_generation_task.dart';

/// 文生视频仓库抽象
abstract class TextToVideoRepository {
  /// 文生图视频生成
  Future<VideoGenerationTask> generateVideo(String prompt);
  /// 首尾帧
  Future<VideoGenerationTask> generateVideoFromFrames(
    String prompt,
    String firstFramePath,
    String lastFramePath, {
    String aspectRatio = '16:9',
  });
  /// 首帧
  Future<VideoGenerationTask> generateVideoFromImage(
    String prompt,
    String imagePath, {
    String aspectRatio = '16:9',
  });
}
