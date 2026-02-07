import 'package:quick_art/features/tools/data/datasources/video_template_remote_data_source.dart';
import 'package:quick_art/features/tools/domain/entities/video_template_page.dart';
import 'package:quick_art/features/tools/domain/repositories/video_template_repository.dart';

/// 视频模板仓库实现类
class VideoTemplateRepositoryImpl implements VideoTemplateRepository {
  final IVideoTemplateRemoteDataSource _remoteDataSource;

  VideoTemplateRepositoryImpl(this._remoteDataSource);

  @override
  Future<VideoTemplatePage> getVideoTemplates({
    String? category,
    int page = 0,
    int size = 20,
  }) async {
    final model = await _remoteDataSource.getVideoTemplates(
      category: category,
      page: page,
      size: size,
    );
    return model.toEntity();
  }
}
