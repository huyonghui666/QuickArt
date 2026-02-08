import 'package:dio/dio.dart';
import 'package:quick_art/core/error/exception.dart';
import 'package:quick_art/features/home/data/models/image_template_page_model.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

abstract class ITemplateRemoteDataSource {
  Future<ImageTemplatePageModel> getTemplates({
    String? category,
    int page = 0,
    int size = 20,
  });
}

class TemplateRemoteDataSource implements ITemplateRemoteDataSource {
  final Dio _dio;

  TemplateRemoteDataSource(this._dio);

  @override
  Future<ImageTemplatePageModel> getTemplates({
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
        '/templates',
        queryParameters: queryParameters,
      );
      // .timeout(AppConstants.timeout);

      if (response.statusCode != 200) {
        throw NetworkException('Get templates failed: ${response.data}');
      }

      final data = response.data;
      if (data['content'] == null) {
        throw DataException('No content');
      }
      return ImageTemplatePageModel.fromJson(data);
    } on DioException catch (e, stackTrace) {
      // 记录错误到 Sentry
      await Sentry.captureException(
        e,
        stackTrace: stackTrace,
        withScope: (scope) {
          scope.setTag('feature', 'get_templates');
          scope.contexts['input'] = {
            'category': category ?? 'all',
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
          scope.setTag('feature', 'get_templates');
          scope.contexts['input'] = {
            'category': category ?? 'all',
            'page': page,
            'size': size,
          };
        },
      );
      throw UnknownException(e.toString());
    }
  }
}
