import 'dart:async';

import 'package:dio/dio.dart';
import 'package:path/path.dart' as p;
import 'package:quick_art/core/error/exception.dart';
import 'package:quick_art/features/home/data/models/image_generation_task_model.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

///文生图数据源接口
abstract class ITextToImageRemoteDataSource {
  /// 获取图片模板列表
  ///
  /// [prompt] 提示词
  Future<ImageGenerationTaskModel> submitTextToImageTask({
    required String prompt,
    required String token,
  });

  /// 提交图生图任务
  Future<ImageGenerationTaskModel> submitImageEditTask({
    required String prompt,
    required String imagePath,
    required String token,
  });
}

///文生图数据源
class TextToImageRemoteDataSource implements ITextToImageRemoteDataSource {
  ///构造
  TextToImageRemoteDataSource(this._dio);
  final Dio _dio;

  @override
  Future<ImageGenerationTaskModel> submitTextToImageTask({
    required String prompt,
    required String token,
  }) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/images/generate',
        // '/images/mock-generate',
        data: {'prompt': prompt},
        options: Options(headers: {'Authorization': 'Bearer $token'}),
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

  @override
  Future<ImageGenerationTaskModel> submitImageEditTask({
    required String prompt,
    required String imagePath,
    required String token,
  }) async {
    try {
      final fileName = p.basename(imagePath);
      final formData = FormData.fromMap({
        'prompt': prompt,
        'image': await MultipartFile.fromFile(imagePath, filename: fileName),
      });

      final response = await _dio.post<Map<String, dynamic>>(
        '/images/edit',
        data: formData,
        options: Options(headers: {'Authorization': 'Bearer $token'}),
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
      await Sentry.captureException(
        e,
        stackTrace: stackTrace,
        withScope: (scope) async {
          await scope.setTag('feature', 'submitImageEditTask');
          scope.contexts['input'] = {'prompt': prompt, 'imagePath': imagePath};
        },
      );
      throw NetworkException.fromDioError(e);
    } catch (e, stackTrace) {
      await Sentry.captureException(
        e,
        stackTrace: stackTrace,
        withScope: (scope) async {
          await scope.setTag('feature', 'submitImageEditTask');
          scope.contexts['input'] = {'prompt': prompt, 'imagePath': imagePath};
        },
      );
      throw UnknownException(e.toString());
    }
  }
}
