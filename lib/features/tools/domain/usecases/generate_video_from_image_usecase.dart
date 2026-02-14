import 'package:quick_art/features/tools/domain/entities/video_generation_task.dart';
import 'package:quick_art/features/tools/domain/repositories/text_to_video_repository.dart';

/// 生成视频基于首帧用例
class GenerateVideoFromImageUseCase {
  /// 构造
  GenerateVideoFromImageUseCase(this._repository);

  final TextToVideoRepository _repository;
  /// 执行用例
  Future<VideoGenerationTask> execute(
    String prompt,
    String imagePath, {
    String aspectRatio = '16:9',
  }) {
    return _repository.generateVideoFromImage(
      prompt,
      imagePath,
      aspectRatio: aspectRatio,
    );
  }
}
