import 'dart:async';

import 'package:quick_art/features/home/data/datasources/text_to_image_remote_data_source.dart';
import 'package:quick_art/features/home/domain/entities/image_generation_task.dart';
import 'package:quick_art/features/home/domain/repositories/text_to_image_repository.dart';

class TextToImageRepositoryImpl implements TextToImageRepository {
  final ITextToImageRemoteDataSource _remoteDataSource;

  TextToImageRepositoryImpl(this._remoteDataSource);

  @override
  Future<ImageGenerationTask> submitTask(String prompt) async {
    try {
      final model = await _remoteDataSource.submitTask(prompt);
      return model.toEntity();
    } catch (e) {
      rethrow;
    }
  }
}
