import 'package:quick_art/features/home/data/datasources/template_remote_data_source.dart';
import 'package:quick_art/features/home/domain/entities/image_template_page.dart';
import 'package:quick_art/features/home/domain/repositories/template_repository.dart';

/// 图片模板 Repository 实现
class TemplateRepositoryImpl implements TemplateRepository {
  /// 构造函数
  TemplateRepositoryImpl(this._dataSource);
  final ITemplateRemoteDataSource _dataSource;

  @override
  Future<ImageTemplatePage> getImageTemplates({
    required String category,
    int page = 0,
    int size = 20,
  }) async {
    try {
      final model = await _dataSource.getImageTemplates(
        category: category,
        page: page,
        size: size,
      );
      return model.toEntity();
    } catch (e) {
      rethrow;
    }
  }
}
