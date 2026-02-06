import 'package:quick_art/features/home/domain/entities/image_template_page.dart';
import 'package:quick_art/features/home/domain/repositories/template_repository.dart';

class GetTemplatesUseCase {
  final TemplateRepository _repository;

  GetTemplatesUseCase(this._repository);

  Future<ImageTemplatePage> call({
    String? category,
    int page = 0,
    int size = 20,
  }) {
    return _repository.getTemplates(category: category, page: page, size: size);
  }
}
