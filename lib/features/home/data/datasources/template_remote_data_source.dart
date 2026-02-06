import 'package:dio/dio.dart';
import 'package:quick_art/core/error/exception.dart';
import 'package:quick_art/core/utils/constants/app_constants.dart';
import 'package:quick_art/features/home/data/models/image_template_model.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class TemplateRemoteDataSource {
  final Dio _dio;

  TemplateRemoteDataSource(this._dio);

  Future<List<ImageTemplateModel>> getTemplates({
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

      final response = await _dio
          .get(
            '${AppConstants.apiBaseUrl}/templates',
            queryParameters: queryParameters,
          )
          .timeout(AppConstants.timeout);

      if (response.statusCode != 200) {
        throw NetworkException('Get templates failed: ${response.data}');
      }

      final data = response.data;
      final List<dynamic> content = data['content'];

      return content.map((e) => ImageTemplateModel.fromJson(e)).toList();
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
