import 'package:quick_art/features/tools/data/datasources/generate_video_remote_data_source.dart';
import 'package:quick_art/features/tools/domain/entities/video_generation_task.dart';
import 'package:quick_art/features/tools/domain/repositories/text_to_video_repository.dart';

class GenerateVideoRepositoryImpl implements TextToVideoRepository {
  final IGenerateVideoRemoteDataSource _remoteDataSource;

  GenerateVideoRepositoryImpl(this._remoteDataSource);

  @override
  Future<VideoGenerationTask> generateVideo(String prompt) async {
    final model = await _remoteDataSource.submitTask(prompt);
    return model.toEntity();
  }

  @override
  Future<VideoGenerationTask> generateVideoFromFrames(
    String prompt,
    String firstFramePath,
    String lastFramePath, {
    String aspectRatio = '16:9',
  }) async {
    final model = await _remoteDataSource.submitTaskFromFrames(
      prompt,
      firstFramePath,
      lastFramePath,
      aspectRatio: aspectRatio,
    );
    return model.toEntity();
  }

  @override
  Future<VideoGenerationTask> generateVideoFromImage(
    String prompt,
    String imagePath, {
    String aspectRatio = '16:9',
  }) async {
    final model = await _remoteDataSource.submitTaskFromImage(
      prompt,
      imagePath,
      aspectRatio: aspectRatio,
    );
    return model.toEntity();
  }
}
