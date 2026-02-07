import 'package:quick_art/features/tools/domain/entities/video_template_page.dart';

/// 视频模板仓库接口
abstract class VideoTemplateRepository {
  /// 获取视频模板列表
  Future<VideoTemplatePage> getVideoTemplates({
    String? category,
    int page = 0,
    int size = 20,
  });
}
