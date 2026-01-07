import 'dart:async';

import 'package:dio/dio.dart';
import 'package:quick_art/src/core/constants/app_constants.dart';
import 'package:quick_art/src/core/exception/exception.dart';
import 'package:quick_art/src/features/quick_art/tools/data/models/video_generation_task_model.dart';

abstract class ITextToVideoRemoteDataSource {
  Future<VideoGenerationTaskModel> submitTask(String prompt);
}

class TextToVideoRemoteDataSource implements ITextToVideoRemoteDataSource {
  final Dio _dio;

  TextToVideoRemoteDataSource(this._dio);

  @override
  Future<VideoGenerationTaskModel> submitTask(String prompt) async {
    try {
      final response = await _dio.post(
        // '${AppConstants.apiBaseUrl}/videos/generate',
        '${AppConstants.apiBaseUrl}/videos/mock-generate',
        data: {'prompt': prompt},
      ).timeout(AppConstants.timeout);
      if (response.statusCode != 200) {
        throw NetworkException('Submit failed: ${response.data}');
      }

      return VideoGenerationTaskModel.fromJson(response.data);
    } catch (e) {
      throw NetworkException(e.toString());
    }
  }
}
