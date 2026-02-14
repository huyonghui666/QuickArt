import 'package:quick_art/features/tools/domain/entities/video_generation_task.dart';
import 'package:quick_art/features/tools/domain/repositories/text_to_video_repository.dart';

/// 基于首尾帧生成视频
class StartEndFrameGenerateVideoUseCase {
  /// 构造
  StartEndFrameGenerateVideoUseCase(this._repository);
  final TextToVideoRepository _repository;
  /// 执行用例
  Future<VideoGenerationTask> execute(
    String prompt,
    String firstFramePath,
    String lastFramePath, {
    String aspectRatio = '16:9',
  }) {
    return _repository.generateVideoFromFrames(
      prompt,
      firstFramePath,
      lastFramePath,
      aspectRatio: aspectRatio,
    );
  }
}
