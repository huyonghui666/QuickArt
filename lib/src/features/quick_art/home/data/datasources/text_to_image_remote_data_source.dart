import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:quick_art/src/core/constants/app_constants.dart';
import 'package:quick_art/src/core/exception/exception.dart';
import 'package:quick_art/src/features/quick_art/home/data/models/image_generation_task_model.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

abstract class ITextToImageRemoteDataSource {
  Future<ImageGenerationTaskModel> submitTask(String prompt);
  Stream<ImageGenerationTaskModel> listenTaskResult(String taskId);
}

class TextToImageRemoteDataSource implements ITextToImageRemoteDataSource {
  final Dio _dio;

  TextToImageRemoteDataSource(this._dio);

  @override
  Future<ImageGenerationTaskModel> submitTask(String prompt) async {
    try {
      final response = await _dio
          .post(
            '${AppConstants.apiBaseUrl}/images/generate',
            data: {'prompt': prompt},
          )
          .timeout(AppConstants.timeout);

      if (response.statusCode != 200) {
        throw NetworkException('Submit failed: ${response.data}');
      }

      return ImageGenerationTaskModel.fromJson(response.data);
    } catch (e) {
      throw NetworkException(e.toString());
    }
  }

  @override
  Stream<ImageGenerationTaskModel> listenTaskResult(String taskId) async* {
    int retryCount = 0;
    final uri = Uri.parse(
      AppConstants.webSocketBaseUrl + AppConstants.webSocketPath,
    ).replace(queryParameters: {'taskId': taskId});

    while (retryCount < AppConstants.maxRetries) {
      try {
        final channel = WebSocketChannel.connect(uri);

        await for (final msg in channel.stream.timeout(AppConstants.timeout)) {
          final json = jsonDecode(msg as String);
          final model = ImageGenerationTaskModel.fromJson(json);
          yield model;

          if (model.imageUrl != null || model.error != null) {
            channel.sink.close();
            return;
          }
        }
      } catch (e) {
        retryCount++;
        if (retryCount >= AppConstants.maxRetries) {
          yield ImageGenerationTaskModel(
            taskId: taskId,
            error:
            'WebSocket failed after ${AppConstants.maxRetries} retries: $e',
          );
        }
        await Future.delayed(Duration(seconds: 2 * retryCount)); // 指数退避
      }
    }
  }

  // @override
  // Stream<ImageGenerationTaskModel> listenTaskResult(String taskId) async* {
  //   int retryCount = 0;
  //   final uri = Uri.parse(
  //     AppConstants.webSocketBaseUrl + AppConstants.webSocketPath,
  //   ).replace(queryParameters: {'taskId': taskId});
  //
  //   while (retryCount < AppConstants.maxRetries) {
  //     try {
  //       final channel = WebSocketChannel.connect(uri);
  //
  //       await for (final msg in channel.stream.timeout(AppConstants.timeout)) {
  //         final json = jsonDecode(msg as String);
  //
  //         // 尝试直接解析，如果字段不匹配（比如后端只返回了 imageUrl），则手动构造
  //         // 假设后端返回格式可能不统一，这里做兼容处理
  //         ImageGenerationTaskModel model;
  //         if (json is Map<String, dynamic> && json.containsKey('taskId')) {
  //           model = ImageGenerationTaskModel.fromJson(json);
  //         } else {
  //           // 兼容旧格式：{"imageUrl": "..."}
  //           model = ImageGenerationTaskModel(
  //             taskId: taskId,
  //             imageUrl: json['imageUrl'],
  //             error: json['error'],
  //           );
  //         }
  //
  //         yield model;
  //
  //         if (model.imageUrl != null || model.error != null) {
  //           channel.sink.close();
  //           return;
  //         }
  //       }
  //     } catch (e) {
  //       retryCount++;
  //       if (retryCount >= AppConstants.maxRetries) {
  //         yield ImageGenerationTaskModel(
  //           taskId: taskId,
  //           error:
  //               'WebSocket failed after ${AppConstants.maxRetries} retries: $e',
  //         );
  //       }
  //       await Future.delayed(Duration(seconds: 2 * retryCount)); // 指数退避
  //     }
  //   }
  // }
}
