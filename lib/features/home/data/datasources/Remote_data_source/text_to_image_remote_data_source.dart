import 'dart:async';

import 'package:dio/dio.dart';
import 'package:quick_art/core/error/exception.dart';
import 'package:quick_art/features/home/data/models/image_generation_task_model.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

///文生图数据源接口
abstract class ITextToImageRemoteDataSource {
  /// 获取图片模板列表
  ///
  /// [prompt] 提示词
  Future<ImageGenerationTaskModel> submitTextToImageTask(String prompt);
}

///文生图数据源
class TextToImageRemoteDataSource implements ITextToImageRemoteDataSource {
  ///构造
  TextToImageRemoteDataSource(this._dio);
  final Dio _dio;

  @override
  Future<ImageGenerationTaskModel> submitTextToImageTask(String prompt) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        // '/images/generate',
        '/images/mock-generate',
        data: {'prompt': prompt},
      );

      if (response.statusCode != 200) {
        throw NetworkException('Submit failed: ${response.data}');
      }

      final data = response.data;
      if (data == null) {
        throw DataException('No data');
      }

      return ImageGenerationTaskModel.fromJson(data);
    } on DioException catch (e, stackTrace) {
      // 记录错误到 Sentry
      await Sentry.captureException(
        e,
        stackTrace: stackTrace,
        withScope: (scope) async {
          await scope.setTag('feature', 'submitTextToImageTask');
          scope.contexts['input'] = {'prompt': prompt};
        },
      );
      throw NetworkException.fromDioError(e);
    } catch (e, stackTrace) {
      // 记录错误到 Sentry
      await Sentry.captureException(
        e,
        stackTrace: stackTrace,
        withScope: (scope) async {
          await scope.setTag('feature', 'submitTextToImageTask');
          scope.contexts['input'] = {'prompt': prompt};
        },
      );
      throw UnknownException(e.toString());
    }
  }
}
