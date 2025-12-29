import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:quick_art/src/core/constants/app_constants.dart';
import 'package:quick_art/src/core/exception/exception.dart';
import 'package:quick_art/src/features/quick_art/tools/data/models/video_generation_task_model.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

abstract class ITextToVideoRemoteDataSource {
  Future<VideoGenerationTaskModel> submitTask(String prompt);
  Stream<VideoGenerationTaskModel> listenTaskResult(String taskId);
}

class TextToVideoRemoteDataSource implements ITextToVideoRemoteDataSource {
  final Dio _dio;

  TextToVideoRemoteDataSource(this._dio);

  @override
  Future<VideoGenerationTaskModel> submitTask(String prompt) async {
    try {
      final response = await _dio.post(
        '${AppConstants.apiBaseUrl}/videos/generate',
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

  @override
  Stream<VideoGenerationTaskModel> listenTaskResult(String taskId) async* {
    int retryCount = 0;
    final uri = Uri.parse(
      '${AppConstants.webSocketBaseUrl}/ws/video-generation',
    ).replace(queryParameters: {'taskId': taskId});

    while (retryCount < AppConstants.maxRetries) {
      try {
        final channel = WebSocketChannel.connect(uri);

        // yield VideoGenerationTaskModel(taskId: taskId);  // waiting

        await for (final msg in channel.stream.timeout(AppConstants.timeout)) {
          final json = jsonDecode(msg as String);
          final model = VideoGenerationTaskModel.fromJson(json);
          yield model;
          //这里需要去修改后端代码，以便保持相同的逻辑
          if (model.videoUrl != null || model.error != null) {
            channel.sink.close();
            return;
          }
        }
      } catch (e) {
        retryCount++;
        if (retryCount >= AppConstants.maxRetries) {
          yield VideoGenerationTaskModel(taskId: taskId, error: 'WebSocket failed after $AppConstants.maxRetries retries: $e');
        }
        await Future.delayed(Duration(seconds: 2 * retryCount));  // 指数退避
      }
    }
  }

}
