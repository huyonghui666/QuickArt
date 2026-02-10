import 'dart:async';

import 'package:dio/dio.dart';
import 'package:quick_art/core/error/exception.dart';
import 'package:quick_art/features/home/data/models/image_generation_task_model.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

abstract class ITextToImageRemoteDataSource {
  Future<ImageGenerationTaskModel> submitTask(String prompt);
}

class TextToImageRemoteDataSource implements ITextToImageRemoteDataSource {
  final Dio _dio;

  TextToImageRemoteDataSource(this._dio);

  @override
  Future<ImageGenerationTaskModel> submitTask(String prompt) async {
    try {
      final response = await _dio.post(
        '/images/generate',
        // '/images/mock-generate',
        data: {'prompt': prompt},
      );

      if (response.statusCode != 200) {
        throw NetworkException('Submit failed: ${response.data}');
      }

      return ImageGenerationTaskModel.fromJson(response.data);
    } on DioException catch (e, stackTrace) {
      // 记录错误到 Sentry
      await Sentry.captureException(
        e,
        stackTrace: stackTrace,
        withScope: (scope) {
          scope.setTag('feature', 'image_generation');
          scope.contexts['input'] = {'prompt': prompt};
        },
      );
      throw NetworkException.fromDioError(e);
    } catch (e, stackTrace) {
      // 记录错误到 Sentry
      await Sentry.captureException(
        e,
        stackTrace: stackTrace,
        withScope: (scope) {
          scope.setTag('feature', 'image_generation');
          scope.contexts['input'] = {'prompt': prompt};
        },
      );
      throw UnknownException(e.toString());
    }
  }
}
