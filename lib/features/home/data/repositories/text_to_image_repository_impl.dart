import 'dart:async';

import 'package:quick_art/features/home/data/datasources/text_to_image_remote_data_source.dart';
import 'package:quick_art/features/home/domain/entities/image_generation_task.dart';
import 'package:quick_art/features/home/domain/repositories/text_to_image_repository.dart';

/// 文生图 Repository 实现
class TextToImageRepositoryImpl implements TextToImageRepository {

  /// 构造函数
  TextToImageRepositoryImpl(this._remoteDataSource);
  final ITextToImageRemoteDataSource _remoteDataSource;

  @override
  Future<ImageGenerationTask> submitTextToImageTask(String prompt) async {
    try {
      final model = await _remoteDataSource.submitTextToImageTask(prompt);
      return model.toEntity();
    } catch (e) {
      rethrow;
    }
  }
}
