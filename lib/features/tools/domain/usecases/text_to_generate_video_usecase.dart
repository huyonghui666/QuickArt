import 'package:quick_art/features/tools/domain/entities/video_generation_task.dart';
import 'package:quick_art/features/tools/domain/repositories/text_to_video_repository.dart';

/// 文生视频用例
class TextToGenerateVideoUseCase {
  /// 构造
  TextToGenerateVideoUseCase(this._repository);
  final TextToVideoRepository _repository;
  /// 执行用例
  Future<VideoGenerationTask> execute(String prompt) {
    return _repository.generateVideo(prompt);
  }
}
