import 'package:dio/dio.dart';
import 'package:quick_art/core/error/exception.dart';
import 'package:quick_art/features/home/data/models/image_template_page_model.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

/// 图片模板数据源接口
abstract class ITemplateRemoteDataSource {
  /// 获取图片模板列表
  ///
  /// [category] 分类
  /// [page] 页码
  /// [size] 每页数量
  Future<ImageTemplatePageModel> getImageTemplates({
    required String category,
    int page = 0,
    int size = 20,
  });
}

/// 图片模板数据源实现类
class TemplateRemoteDataSource implements ITemplateRemoteDataSource {
  /// 构造函数
  TemplateRemoteDataSource(this._dio);

  final Dio _dio;

  @override
  Future<ImageTemplatePageModel> getImageTemplates({
    required String category,
    int page = 0,
    int size = 20,
  }) async {
    try {
      final queryParameters = <String, dynamic>{
        'page': page,
        'size': size,
        'category': category,
      };

      final response = await _dio.get<Map<String, dynamic>>(
        '/templates',
        queryParameters: queryParameters,
      );

      if (response.statusCode != 200) {
        throw NetworkException('Get templates failed: ${response.data}');
      }

      final data = response.data;
      if (data == null || data['content'] == null) {
        throw DataException('No content');
      }
      return ImageTemplatePageModel.fromJson(data);
    } on DioException catch (e, stackTrace) {
      // 记录错误到 Sentry
      await Sentry.captureException(
        e,
        stackTrace: stackTrace,
        withScope: (scope) async {
          await scope.setTag('feature', 'get_image_templates');
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
        withScope: (scope) async {
          await scope.setTag('feature', 'get_image_templates');
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
