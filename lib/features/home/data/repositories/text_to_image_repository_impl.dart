import 'dart:async';

import 'package:quick_art/features/auth_login/data/datasources/auth_login_local_data_source.dart';
import 'package:quick_art/features/home/data/datasources/Remote_data_source/text_to_image_remote_data_source.dart';
import 'package:quick_art/features/home/domain/entities/image_generation_task.dart';
import 'package:quick_art/features/home/domain/repositories/text_to_image_repository.dart';

/// 文生图 Repository 实现
class TextToImageRepositoryImpl implements ITextToImageRepository {
  /// 构造函数
  TextToImageRepositoryImpl(this._remoteDataSource, this._localDataSource);

  final ITextToImageRemoteDataSource _remoteDataSource;
  final IAuthLoginLocalDataSource _localDataSource;

  @override
  Future<ImageGenerationTask> submitTextToImageTask(String prompt) async {
    try {
      final token = await _localDataSource.getJwtToken();
      if (token == null || token.isEmpty) {
        throw Exception('未登录，无法提交图片生成任务');
      }

      final model = await _remoteDataSource.submitTextToImageTask(
        prompt: prompt,
        token: token,
      );
      return model.toEntity();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ImageGenerationTask> submitImageEditTask(
    String prompt,
    String imagePath,
  ) async {
    try {
      final token = await _localDataSource.getJwtToken();
      if (token == null || token.isEmpty) {
        throw Exception('未登录，无法提交图生图任务');
      }

      final model = await _remoteDataSource.submitImageEditTask(
        prompt: prompt,
        imagePath: imagePath,
        token: token,
      );
      return model.toEntity();
    } catch (e) {
      rethrow;
    }
  }
}
