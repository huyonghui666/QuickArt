import 'dart:async';

import 'package:quick_art/features/home/data/datasources/text_to_image_remote_data_source.dart';
import 'package:quick_art/features/home/data/models/image_generation_task_model.dart';
import 'package:quick_art/features/home/domain/repositories/text_to_image_repository.dart';

class TextToImageRepositoryImpl implements TextToImageRepository {
  final ITextToImageRemoteDataSource _remoteDataSource;

  TextToImageRepositoryImpl(this._remoteDataSource);

  @override
  Future<ImageGenerationTaskModel> generateImage(String prompt) async {
    try {
      return await _remoteDataSource.submitTask(prompt);
    } catch (e) {
      // 如果提交失败，也返回 failed 状态，或者直接抛出异常让上层处理
      // 这里为了统一返回类型，返回 failed 状态（如果能获取到 taskId 最好，没有则为空字符串）
      // 但通常 Repository 抛出 Failure 更好。这里为了简单，先假设 submitTask 抛出 NetworkException
      rethrow;
    }
  }
}
