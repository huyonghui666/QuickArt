import 'package:quick_art/features/home/data/datasources/template_remote_data_source.dart';
import 'package:quick_art/features/home/domain/entities/image_template.dart';
import 'package:quick_art/features/home/domain/repositories/template_repository.dart';

class TemplateRepositoryImpl implements TemplateRepository {
  final TemplateRemoteDataSource _dataSource;

  TemplateRepositoryImpl(this._dataSource);

  @override
  Future<List<ImageTemplate>> getTemplates({
    String? category,
    int page = 0,
    int size = 20,
  }) async {
    try {
      final models = await _dataSource.getTemplates(
        category: category,
        page: page,
        size: size,
      );
      return models.map((e) => e.toEntity()).toList();
    } catch (e) {
      rethrow;
    }
  }
}
