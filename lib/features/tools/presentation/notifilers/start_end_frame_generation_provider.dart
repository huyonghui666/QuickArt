import 'package:quick_art/core/di/injection_container.dart';
import 'package:quick_art/features/tools/domain/entities/video_generation_task.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'start_end_frame_generation_provider.g.dart';

@riverpod
class StartEndFrameGenerationNotifier
    extends _$StartEndFrameGenerationNotifier {
  String? _lastPrompt;
  String? _lastFirstFramePath;
  String? _lastLastFramePath;

  @override
  AsyncValue<VideoGenerationTask?> build() {
    return const AsyncValue.data(null);
  }

  Future<void> generateVideo(
    String prompt,
    String firstFramePath,
    String lastFramePath,
  ) async {
    _lastPrompt = prompt;
    _lastFirstFramePath = firstFramePath;
    _lastLastFramePath = lastFramePath;
    state = const AsyncValue.loading();
    try {
      final useCase = ref.read(startEndFrameGenerateVideoUseCaseProvider);
      final task = await useCase.execute(prompt, firstFramePath, lastFramePath);
      state = AsyncValue.data(task);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  Future<void> retry() async {
    if (_lastPrompt != null &&
        _lastFirstFramePath != null &&
        _lastLastFramePath != null) {
      await generateVideo(
        _lastPrompt!,
        _lastFirstFramePath!,
        _lastLastFramePath!,
      );
    }
  }
}
