import 'package:dio/dio.dart';
import 'package:quick_art/core/error/exception.dart';
import 'package:quick_art/features/tools/data/models/video_template_page_model.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

/// 视频模板远程数据源接口
abstract class IVideoTemplateRemoteDataSource {
  /// 获取视频模板列表
  Future<VideoTemplatePageModel> getVideoTemplates({
    String? category,
    int page = 0,
    int size = 20,
  });
}

/// 视频模板远程数据源实现
class VideoTemplateRemoteDataSource implements IVideoTemplateRemoteDataSource {
  final Dio _dio;

  VideoTemplateRemoteDataSource(this._dio);

  @override
  Future<VideoTemplatePageModel> getVideoTemplates({
    String? category,
    int page = 0,
    int size = 20,
  }) async {
    try {
      final queryParameters = {
        'page': page,
        'size': size,
        if (category != null) 'category': category,
      };

      final response = await _dio.get(
        '/video-templates',
        queryParameters: queryParameters,
      );

      return VideoTemplatePageModel.fromJson(response.data);
    } on DioException catch (e, stackTrace) {
      // 记录错误到 Sentry
      await Sentry.captureException(
        e,
        stackTrace: stackTrace,
        withScope: (scope) {
          scope.setTag('feature', 'video_template');
          scope.contexts['input'] = {
            'category': category,
            'page': page,
            'size': size,
          };
        },
      );
      throw NetworkException.fromDioError(e);
    } catch (e, stackTrace) {
      // 记录错误到 Sentry
      await Sentry.captureException(
        e,
        stackTrace: stackTrace,
        withScope: (scope) {
          scope.setTag('feature', 'video_template');
          scope.contexts['input'] = {
            'category': category,
            'page': page,
            'size': size,
          };
        },
      );
      throw UnknownException(e.toString());
    }
  }
}
