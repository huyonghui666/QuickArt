import 'package:quick_art/features/home/domain/entities/image_generation_task.dart';
import 'package:quick_art/features/home/domain/repositories/text_to_image_repository.dart';

/// 图生图用例
class ImageEditUseCase {
  /// 构造函数
  ImageEditUseCase(this._repository);

  final ITextToImageRepository _repository;

  /// 执行图生图任务提交
  Future<ImageGenerationTask> execute(String prompt, String imagePath) {
    return _repository.submitImageEditTask(prompt, imagePath);
  }
}
