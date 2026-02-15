import 'package:quick_art/features/home/domain/entities/image_generation_task.dart';
import 'package:quick_art/features/home/domain/repositories/text_to_image_repository.dart';

/// 文生图用例
class TextToGenerateImageUseCase {
  /// 构造函数
  TextToGenerateImageUseCase(this._textToImageRepository);

  final TextToImageRepository _textToImageRepository;

  /// 执行任务提交
  /// [prompt] 提示词
  Future<ImageGenerationTask> execute(String prompt) {
    return _textToImageRepository.submitTextToImageTask(prompt);
  }
}
