import 'dart:async';

import 'package:quick_art/src/core/exception/exception.dart';
import 'package:quick_art/src/features/quick_art/tools/data/datasources/text_to_video_remote_data_source.dart';
import 'package:quick_art/src/features/quick_art/tools/data/models/video_generation_task_model.dart';
import 'package:quick_art/src/features/quick_art/tools/domain/entities/video_generation_task.dart';
import 'package:quick_art/src/features/quick_art/tools/domain/repositories/text_to_video_repository.dart';

class TextToVideoRepositoryImpl implements TextToVideoRepository {
  final ITextToVideoRemoteDataSource _remoteDataSource;

  TextToVideoRepositoryImpl(this._remoteDataSource);

  @override
  Stream<VideoGenerationTask> getVideoUrlStream(String prompt) async* {
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
  }
}
