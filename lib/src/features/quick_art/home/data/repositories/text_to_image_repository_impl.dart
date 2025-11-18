import 'dart:async';

import 'package:quick_art/src/features/quick_art/home/data/datasources/text_to_image_remote_data_source.dart';
import 'package:quick_art/src/features/quick_art/home/domain/entities/image_generation_task.dart';
import 'package:quick_art/src/features/quick_art/home/domain/repositories/text_to_image_repository.dart';

class TextToImageRepositoryImpl implements TextToImageRepository {
  final TextToImageRemoteDataSource remoteDataSource;

  TextToImageRepositoryImpl(this.remoteDataSource);

  @override
  Future<ImageGenerationTask> generateImage(String prompt) {
    return remoteDataSource.generateImage(prompt);
  }

  @override
  Stream<String> getImageUrlStream(String taskId) {
    return remoteDataSource.getImageUrlStream(taskId);
  }
}
