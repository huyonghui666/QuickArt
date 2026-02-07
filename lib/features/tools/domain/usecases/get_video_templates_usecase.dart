import 'package:quick_art/features/tools/domain/entities/video_template_page.dart';
import 'package:quick_art/features/tools/domain/repositories/video_template_repository.dart';

/// 获取视频模板列表用例
class GetVideoTemplatesUseCase {
  final VideoTemplateRepository _repository;

  GetVideoTemplatesUseCase(this._repository);

  /// 执行用例
  Future<VideoTemplatePage> call({
    String? category,
    int page = 0,
    int size = 20,
  }) {
    return _repository.getVideoTemplates(
      category: category,
      page: page,
      size: size,
    );
  }
}
