import 'package:quick_art/core/di/injection_container.dart';
import 'package:quick_art/features/tools/domain/entities/video_generation_task.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'video_generation_provider.g.dart';

@riverpod
class VideoGenerationNotifier extends _$VideoGenerationNotifier {
  String? _lastPrompt;

  @override
  AsyncValue<VideoGenerationTask?> build() {
    return const AsyncValue.data(null);
  }

  Future<void> generateVideo(String prompt) async {
    _lastPrompt = prompt;
    state = const AsyncValue.loading();
    try {
      final useCase = ref.read(textToGenerateVideoUseCaseProvider);
      final task = await useCase.execute(prompt);
      state = AsyncValue.data(task);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  Future<void> retry() async {
    if (_lastPrompt != null) {
      await generateVideo(_lastPrompt!);
    }
  }
}
