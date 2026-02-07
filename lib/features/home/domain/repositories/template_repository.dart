import 'package:quick_art/features/home/domain/entities/image_template_page.dart';

///获取图片模板
/// @param category tab类别
/// @param page 默认从0页
/// @param size 一页20个图片url数据
abstract class TemplateRepository {
  Future<ImageTemplatePage> getTemplates({
    String? category,
    int page = 0,
    int size = 20,
  });
}
