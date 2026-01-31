import 'dart:async';

import 'package:dio/dio.dart';
import 'package:quick_art/core/error/exception.dart';
import 'package:quick_art/core/utils/constants/app_constants.dart';
import 'package:quick_art/features/home/data/models/image_generation_task_model.dart';


abstract class ITextToImageRemoteDataSource {
  Future<ImageGenerationTaskModel> submitTask(String prompt);
}

class TextToImageRemoteDataSource implements ITextToImageRemoteDataSource {
  final Dio _dio;

  TextToImageRemoteDataSource(this._dio);

  @override
  Future<ImageGenerationTaskModel> submitTask(String prompt) async {
    try {
      final response = await _dio
          .post(
            '${AppConstants.apiBaseUrl}/images/mock-generate',
            data: {'prompt': prompt},
          )
          // .post(
          //   '${AppConstants.apiBaseUrl}/images/generate',
          //   data: {'prompt': prompt},
          // )
          .timeout(AppConstants.timeout);

      if (response.statusCode != 200) {
        throw NetworkException('Submit failed: ${response.data}');
      }

      return ImageGenerationTaskModel.fromJson(response.data);
    } catch (e) {
      throw NetworkException(e.toString());
    }
  }
}
