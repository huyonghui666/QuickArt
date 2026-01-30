import 'package:quick_art/src/features/quick_art/tools/data/datasources/text_to_video_remote_data_source.dart';
import 'package:quick_art/src/features/quick_art/tools/data/models/video_generation_task_model.dart';
import 'package:quick_art/src/features/quick_art/tools/domain/repositories/text_to_video_repository.dart';

class TextToVideoRepositoryImpl implements TextToVideoRepository {
  final ITextToVideoRemoteDataSource _remoteDataSource;

  TextToVideoRepositoryImpl(this._remoteDataSource);

  @override
  Future<VideoGenerationTaskModel> generateVideo(String prompt) async {
    return await _remoteDataSource.submitTask(prompt);
  }

  @override
  Future<VideoGenerationTaskModel> generateVideoFromFrames(
    String prompt,
    String firstFramePath,
    String lastFramePath,
  ) async {
    return await _remoteDataSource.submitTaskFromFrames(
      prompt,
      firstFramePath,
      lastFramePath,
    );
  }
}
