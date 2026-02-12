import 'dart:async';

import 'package:dio/dio.dart';
import 'package:quick_art/core/error/exception.dart';
import 'package:quick_art/features/tools/data/models/video_generation_task_model.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

abstract class IGenerateVideoRemoteDataSource {
  Future<VideoGenerationTaskModel> submitTask(String prompt);

  Future<VideoGenerationTaskModel> submitTaskFromFrames(
    String prompt,
    String firstFramePath,
    String lastFramePath, {
    String aspectRatio = '16:9',
  });

  Future<VideoGenerationTaskModel> submitTaskFromImage(
    String prompt,
    String imagePath, {
    String aspectRatio = '16:9',
  });
}

class GenerateVideoRemoteDataSource implements IGenerateVideoRemoteDataSource {
  final Dio _dio;

  GenerateVideoRemoteDataSource(this._dio);

  @override
  Future<VideoGenerationTaskModel> submitTask(String prompt) async {
    try {
      final response = await _dio.post(
        '/videos/generate',
        // '/videos/mock-generate',
        data: {'prompt': prompt},
      );
      if (response.statusCode != 200) {
        throw NetworkException('Submit failed: ${response.data}');
      }

      return VideoGenerationTaskModel.fromJson(response.data);
    } on DioException catch (e, stackTrace) {
      await Sentry.captureException(
        e,
        stackTrace: stackTrace,
        withScope: (scope) {
          scope.setTag('feature', 'video_generation');
          scope.contexts['input'] = {'prompt': prompt};
        },
      );
      throw NetworkException.fromDioError(e);
    } catch (e, stackTrace) {
      await Sentry.captureException(
        e,
        stackTrace: stackTrace,
        withScope: (scope) {
          scope.setTag('feature', 'video_generation');
          scope.contexts['input'] = {'prompt': prompt};
        },
      );
      throw UnknownException(e.toString());
    }
  }

  ///图生视频-基于首尾帧
  @override
  Future<VideoGenerationTaskModel> submitTaskFromFrames(
    String prompt,
    String firstFramePath,
    String lastFramePath, {
    String aspectRatio = '16:9',
  }) async {
    try {
      final formData = FormData.fromMap({
        'prompt': prompt,
        'firstFrame': await MultipartFile.fromFile(firstFramePath),
        'lastFrame': await MultipartFile.fromFile(lastFramePath),
        'aspectRatio': aspectRatio,
      });

      final response = await _dio.post(
        // '/videos/mock-generate-from-frames',
        '/videos/generate-from-frames',
        data: formData,
      );

      if (response.statusCode != 200) {
        throw NetworkException('Submit failed: ${response.data}');
      }

      return VideoGenerationTaskModel.fromJson(response.data);
    } on DioException catch (e, stackTrace) {
      await Sentry.captureException(
        e,
        stackTrace: stackTrace,
        withScope: (scope) {
          scope.setTag('feature', 'video_generation_frames');
          scope.contexts['input'] = {
            'prompt': prompt,
            'first_frame': firstFramePath,
            'last_frame': lastFramePath,
          };
        },
      );
      throw NetworkException.fromDioError(e);
    } catch (e, stackTrace) {
      await Sentry.captureException(
        e,
        stackTrace: stackTrace,
        withScope: (scope) {
          scope.setTag('feature', 'video_generation_frames');
          scope.contexts['input'] = {
            'prompt': prompt,
            'first_frame': firstFramePath,
            'last_frame': lastFramePath,
          };
        },
      );
      throw UnknownException(e.toString());
    }
  }

  ///图生视频-基于首帧
  @override
  Future<VideoGenerationTaskModel> submitTaskFromImage(
    String prompt,
    String imagePath, {
    String aspectRatio = '16:9',
  }) async {
    try {
      final formData = FormData.fromMap({
        'prompt': prompt,
        'image': await MultipartFile.fromFile(imagePath),
        'aspectRatio': aspectRatio,
      });

      final response = await _dio.post(
        '/videos/generate-from-image',
        // '/videos/mock-generate-from-image',
        data: formData,
      );

      if (response.statusCode != 200) {
        throw NetworkException('Submit failed: ${response.data}');
      }

      return VideoGenerationTaskModel.fromJson(response.data);
    } on DioException catch (e, stackTrace) {
      await Sentry.captureException(
        e,
        stackTrace: stackTrace,
        withScope: (scope) {
          scope.setTag('feature', 'video_generation_image');
          scope.contexts['input'] = {'prompt': prompt};
        },
      );
      throw NetworkException.fromDioError(e);
    } catch (e, stackTrace) {
      await Sentry.captureException(
        e,
        stackTrace: stackTrace,
        withScope: (scope) {
          scope.setTag('feature', 'video_generation_image');
          scope.contexts['input'] = {'prompt': prompt};
        },
      );
      throw UnknownException(e.toString());
    }
  }
}
