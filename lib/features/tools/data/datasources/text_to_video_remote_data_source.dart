import 'dart:async';

import 'package:dio/dio.dart';
import 'package:quick_art/core/error/exception.dart';
import 'package:quick_art/core/utils/constants/app_constants.dart';
import 'package:quick_art/features/tools/data/models/video_generation_task_model.dart';

abstract class ITextToVideoRemoteDataSource {
  Future<VideoGenerationTaskModel> submitTask(String prompt);

  Future<VideoGenerationTaskModel> submitTaskFromFrames(
    String prompt,
    String firstFramePath,
    String lastFramePath, {
    String aspectRatio = '16:9',
  });
}

class TextToVideoRemoteDataSource implements ITextToVideoRemoteDataSource {
  final Dio _dio;

  TextToVideoRemoteDataSource(this._dio);

  @override
  Future<VideoGenerationTaskModel> submitTask(String prompt) async {
    try {
      final response = await _dio
          .post(
            // '${AppConstants.apiBaseUrl}/videos/generate',
            '${AppConstants.apiBaseUrl}/videos/mock-generate',
            data: {'prompt': prompt},
          )
          .timeout(AppConstants.timeout);
      if (response.statusCode != 200) {
        throw NetworkException('Submit failed: ${response.data}');
      }

      return VideoGenerationTaskModel.fromJson(response.data);
    } catch (e) {
      throw NetworkException(e.toString());
    }
  }

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

      final response = await _dio
          .post(
            '${AppConstants.apiBaseUrl}/videos/mock-generate-from-frames',
            // '${AppConstants.apiBaseUrl}/videos/generate-from-frames',
            data: formData,
          )
          .timeout(AppConstants.timeout);

      if (response.statusCode != 200) {
        throw NetworkException('Submit failed: ${response.data}');
      }

      return VideoGenerationTaskModel.fromJson(response.data);
    } catch (e) {
      throw NetworkException(e.toString());
    }
  }
}
