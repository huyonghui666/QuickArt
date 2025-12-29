import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quick_art/src/features/quick_art/tools/data/datasources/text_to_video_remote_data_source.dart';
import 'package:quick_art/src/features/quick_art/tools/data/repositories/text_to_video_repository_impl.dart';
import 'package:quick_art/src/features/quick_art/tools/domain/repositories/text_to_video_repository.dart';


class TextToVideoState {
  final bool isLoading;
  final String? videoUrl;
  final String? error;
  final String? taskId;

  TextToVideoState({
    this.isLoading = false,
    this.videoUrl,
    this.error,
    this.taskId,
  });
}

// class TextToVideoNotifier extends StateNotifier<TextToVideoState> {
//   final GenerateVideoUseCase _generateVideoUseCase;
//
//   TextToVideoNotifier(this._generateVideoUseCase) : super(TextToVideoState());
//
//   Future<void> generateVideo(String prompt) async {
//     logger.i('Generating video with prompt: $prompt');
//     state = TextToVideoState(isLoading: true);
//     try {
//       final task = await _generateVideoUseCase(prompt);
//       state = TextToVideoState(isLoading: false, taskId: task.taskId);
//       logger.i('Video generation task created with taskId: ${task.taskId}');
//     } catch (e) {
//       logger.e('Error generating video: $e');
//       state = TextToVideoState(error: e.toString());
//     }
//   }
// }

// final textToVideoRemoteDataSourceProvider =
//     Provider<ITextToVideoRemoteDataSource>((ref) {
//       final dio = ref.watch(dioProvider);
//       return TextToVideoRemoteDataSource(dio);
//     });
//
// final textToVideoRepositoryProvider = Provider<TextToVideoRepository>((ref) {
//   final remoteDataSource = ref.watch(textToVideoRemoteDataSourceProvider);
//   return TextToVideoRepositoryImpl(remoteDataSource);
// });

// final generateVideoUseCaseProvider = Provider<GenerateVideoUseCase>((ref) {
//   final repository = ref.watch(textToVideoRepositoryProvider);
//   return GenerateVideoUseCase(repository);
// });
//
// final getVideoUrlStreamUseCaseProvider = Provider<GetVideoUrlStreamUseCase>((
//   ref,
// ) {
//   final repository = ref.watch(textToVideoRepositoryProvider);
//   return GetVideoUrlStreamUseCase(repository);
// });

// final textToVideoNotifierProvider =
//     StateNotifierProvider<TextToVideoNotifier, TextToVideoState>((ref) {
//       final useCase = ref.watch(generateVideoUseCaseProvider);
//       return TextToVideoNotifier(useCase);
//     });
//
// final videoUrlProvider = StreamProvider.autoDispose.family<String, String>((
//   ref,
//   taskId,
// ) {
//   final useCase = ref.watch(getVideoUrlStreamUseCaseProvider);
//   return useCase(taskId);
// });
