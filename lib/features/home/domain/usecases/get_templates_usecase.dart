import 'package:quick_art/features/home/domain/entities/image_template_page.dart';
import 'package:quick_art/features/home/domain/repositories/template_repository.dart';

/// 获取图片模板用例
class GetTemplatesUseCase {
  /// 构造函数
  GetTemplatesUseCase(this._repository);

  final TemplateRepository _repository;

  /// 执行用例
  /// [category] 分类
  /// [page] 页码
  /// [size] 每页数量
  Future<ImageTemplatePage> call({
    required String category,
    int page = 0,
    int size = 20,
  }) {
    return _repository.getImageTemplates(
      category: category,
      page: page,
      size: size,
    );
  }
}
