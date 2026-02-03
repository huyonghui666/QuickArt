import 'dart:async';

import 'package:quick_art/features/home/data/datasources/text_to_image_remote_data_source.dart';
import 'package:quick_art/features/home/data/models/image_generation_task_model.dart';
import 'package:quick_art/features/home/domain/repositories/text_to_image_repository.dart';

class TextToImageRepositoryImpl implements TextToImageRepository {
  final ITextToImageRemoteDataSource _remoteDataSource;

  TextToImageRepositoryImpl(this._remoteDataSource);

  @override
  Future<ImageGenerationTaskModel> submitTask(String prompt) async {
    try {
      return await _remoteDataSource.submitTask(prompt);
    } catch (e) {
      rethrow;
    }
  }
}
