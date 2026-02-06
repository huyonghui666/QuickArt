import 'package:quick_art/features/home/domain/entities/image_template.dart';

abstract class TemplateRepository {
  Future<List<ImageTemplate>> getTemplates({
    String? category,
    int page = 0,
    int size = 20,
  });
}
