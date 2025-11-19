import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:quick_art/src/core/constants/app_constants.dart';
import 'package:quick_art/src/features/quick_art/home/data/models/image_generation_task.dart';
import 'package:quick_art/src/core/log/logger.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

abstract class ITextToImageRemoteDataSource {
  Future<ImageGenerationTask> generateImage(String prompt);
  Stream<String> getImageUrlStream(String taskId);
}

class TextToImageRemoteDataSource implements ITextToImageRemoteDataSource {
  final Dio _dio;

  TextToImageRemoteDataSource(this._dio);

  /// 实际上只返回taskId
  @override
  Future<ImageGenerationTask> generateImage(String prompt) async {
    try {
      final response = await _dio.post(
        '${AppConstants.apiBaseUrl}/images/generate',
        data: {'prompt': prompt},
      );
      return ImageGenerationTask.fromJson(response.data);
    } catch (e) {
      // TODO: Handle error
      rethrow;
    }
  }

  /// 返回真实的AI图片url
  @override
  Stream<String> getImageUrlStream(String taskId) {
    final uri = Uri.parse(
      AppConstants.webSocketBaseUrl + AppConstants.webSocketPath,
    ).replace(queryParameters: {'taskId': taskId});

    //TODO Websocket暂未关闭连接
    logger.i('Connecting to WebSocket: $uri');
    final channel = WebSocketChannel.connect(uri);

    return channel.stream
        .map((message) {
          logger.i('Received WebSocket message: $message');
          final data = jsonDecode(message);
          return data['imageUrl'] as String;
        })
        .handleError((error) {
          logger.e('WebSocket error: $error');
          throw error;
        });
  }
}