import 'package:quick_art/src/features/quick_art/tools/data/models/video_generation_task_model.dart';
import 'package:quick_art/src/features/quick_art/tools/domain/repositories/text_to_video_repository.dart';

class StartEndFrameGenerateVideoUseCase {
  final TextToVideoRepository _textToVideoRepository;

  StartEndFrameGenerateVideoUseCase(this._textToVideoRepository);

  Future<VideoGenerationTaskModel> execute(
    String prompt,
    String firstFramePath,
    String lastFramePath,
  ) {
    return _textToVideoRepository.generateVideoFromFrames(
      prompt,
      firstFramePath,
      lastFramePath,
    );
  }
}
