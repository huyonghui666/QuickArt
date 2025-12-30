import 'dart:async';

import 'package:quick_art/src/core/exception/exception.dart';
import 'package:quick_art/src/features/quick_art/tools/data/datasources/text_to_video_remote_data_source.dart';
import 'package:quick_art/src/features/quick_art/tools/domain/entities/video_generation_task.dart';
import 'package:quick_art/src/features/quick_art/tools/domain/repositories/text_to_video_repository.dart';

class TextToVideoRepositoryImpl implements TextToVideoRepository {
  final ITextToVideoRemoteDataSource _remoteDataSource;

  TextToVideoRepositoryImpl(this._remoteDataSource);

  @override
  Stream<VideoGenerationTask> getVideoUrlStream(String prompt) async* {
    // -----------------------------------------------------------------------
    // MOCK IMPLEMENTATION (For Testing)
    // -----------------------------------------------------------------------
    const mockTaskId = 'f51ce4df-5fff-4bce-b570-5750911c6034';
    const mockVideoUrl =
        'https://ark-content-generation-cn-beijing.tos-cn-beijing.volces.com/doubao-seedance-1-0-pro/02176701999768800000000000000000000ffffac19188dee70f7.mp4?X-Tos-Algorithm=TOS4-HMAC-SHA256&X-Tos-Credential=AKLTYWJkZTExNjA1ZDUyNDc3YzhjNTM5OGIyNjBhNDcyOTQ%2F20251229%2Fcn-beijing%2Ftos%2Frequest&X-Tos-Date=20251229T145341Z&X-Tos-Expires=86400&X-Tos-Signature=e08708f38d963c4e5114a4f85dfb48e065cc1a3a27efdc62d871d22fc960b63a&X-Tos-SignedHeaders=host';

    // 1. Submitting
    await Future.delayed(const Duration(seconds: 4));

    // 2. Waiting (Simulate processing)
    //yield const VideoGenerationTask.waiting(taskId: mockTaskId);
    await Future.delayed(const Duration(seconds: 2));

    // 3. Success
    yield const VideoGenerationTask.success(
      taskId: mockTaskId,
      videoUrl: mockVideoUrl,
    );

    // -----------------------------------------------------------------------
    // REAL IMPLEMENTATION (Commented out)
    // -----------------------------------------------------------------------
    /*
    try {
      final videoGenerationTaskModel = await _remoteDataSource.submitTask(prompt);
      await for (final model in _remoteDataSource.listenTaskResult(videoGenerationTaskModel.taskId)) {
        yield model.toEntity();
      }
    } catch (e) {
      yield VideoGenerationTask.failed(
        taskId: '',  // 或保留 taskId 如果有
        error: e is AppException ? e.message : e.toString(),
      );
    }
    */
  }
}
