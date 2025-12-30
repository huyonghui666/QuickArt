import 'dart:async';

import 'package:quick_art/src/core/exception/exception.dart';
import 'package:quick_art/src/features/quick_art/home/data/datasources/text_to_image_remote_data_source.dart';
import 'package:quick_art/src/features/quick_art/home/data/models/image_generation_task_model.dart';
import 'package:quick_art/src/features/quick_art/home/domain/entities/image_generation_task.dart';
import 'package:quick_art/src/features/quick_art/home/domain/repositories/text_to_image_repository.dart';

class TextToImageRepositoryImpl implements TextToImageRepository {
  final ITextToImageRemoteDataSource _remoteDataSource;

  TextToImageRepositoryImpl(this._remoteDataSource);

  @override
  Stream<ImageGenerationTask> generateImageStream(String prompt) async* {
    // -----------------------------------------------------------------------
    // MOCK IMPLEMENTATION (For Testing)
    // -----------------------------------------------------------------------
    const mockTaskId = '19ec35d4-a4d1-4562-8c67-076e123c989e';
    const mockImageUrl =
        'https://ark-content-generation-v2-cn-beijing.tos-cn-beijing.volces.com/doubao-seedream-4-0/021767101288309cb73d4777d7105aa914c783cfa2dd58ccce785_0.jpeg?X-Tos-Algorithm=TOS4-HMAC-SHA256&X-Tos-Credential=AKLTYWJkZTExNjA1ZDUyNDc3YzhjNTM5OGIyNjBhNDcyOTQ%2F20251230%2Fcn-beijing%2Ftos%2Frequest&X-Tos-Date=20251230T132817Z&X-Tos-Expires=86400&X-Tos-Signature=618ff567d9bc4229f8e104b2f338c9d7c17505f6493c22e11e4a68d9c93aa2b7&X-Tos-SignedHeaders=host&x-tos-process=image%2Fwatermark%2Cimage_YXNzZXRzL3dhdGVybWFya192MS5wbmc_eC10b3MtcHJvY2Vzcz1pbWFnZS9yZXNpemUscF8xMzE%3D%2Cx_115%2Cy_115';

    // 1. Submitting & Processing Simulation
    await Future.delayed(const Duration(seconds: 4));

    // 2. Success
    yield const ImageGenerationTask.success(
      taskId: mockTaskId,
      imageUrl: mockImageUrl,
    );

    // -----------------------------------------------------------------------
    // REAL IMPLEMENTATION (Commented out)
    // -----------------------------------------------------------------------
    /*
    try {
      // 1. 调用 HTTP 接口创建任务
      final imageGenerationTaskModel = await _remoteDataSource.submitTask(prompt);

      // 2. 拿到 taskId 后，建立 WebSocket 连接并监听结果
      await for (final model in _remoteDataSource.listenTaskResult(imageGenerationTaskModel.taskId)) {
        yield model.toEntity();
      }

    } catch (e) {
      // 捕获 HTTP 错误或 WebSocket 建立错误
      yield ImageGenerationTask.failed(
        taskId: '',
        error: e is AppException ? e.message : e.toString(),
      );
    }
    */
  }
}
