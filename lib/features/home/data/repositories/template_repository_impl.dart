import 'package:quick_art/features/home/data/datasources/template_remote_data_source.dart';
import 'package:quick_art/features/home/domain/entities/image_template_page.dart';
import 'package:quick_art/features/home/domain/repositories/template_repository.dart';

class TemplateRepositoryImpl implements TemplateRepository {
  final ITemplateRemoteDataSource _dataSource;

  TemplateRepositoryImpl(this._dataSource);

  @override
  Future<ImageTemplatePage> getTemplates({
    String? category,
    int page = 0,
    int size = 20,
  }) async {
    try {
      final model = await _dataSource.getTemplates(
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
