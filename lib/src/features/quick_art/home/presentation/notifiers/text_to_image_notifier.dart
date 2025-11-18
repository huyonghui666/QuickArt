import 'package:quick_art/src/core/utils/logger.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quick_art/src/features/quick_art/home/data/datasources/text_to_image_remote_data_source.dart';
import 'package:quick_art/src/features/quick_art/home/data/repositories/text_to_image_repository_impl.dart';
import 'package:quick_art/src/core/providers/dio_provider.dart';
import 'package:quick_art/src/features/quick_art/home/domain/usecases/generate_image_use_case.dart';

class TextToImageState {
  final bool isLoading;
  final String? imageUrl;
  final String? error;
  final String? taskId;

  TextToImageState({
    this.isLoading = false,
    this.imageUrl,
    this.error,
    this.taskId,
  });
}

class TextToImageNotifier extends StateNotifier<TextToImageState> {
  final GenerateImageUseCase _generateImageUseCase;

  TextToImageNotifier(this._generateImageUseCase) : super(TextToImageState());

  Future<void> generateImage(String prompt) async {
    logger.i('Generating image with prompt: $prompt');
    state = TextToImageState(isLoading: true);
    try {
      final task = await _generateImageUseCase(prompt);
      state = TextToImageState(isLoading: false, taskId: task.taskId);
      logger.i('Image generation task created with taskId: ${task.taskId}');
    } catch (e) {
      logger.e('Error generating image: $e');
      state = TextToImageState(error: e.toString());
    }
  }
}

final textToImageNotifierProvider =
    StateNotifierProvider<TextToImageNotifier, TextToImageState>((ref) {
      final dio = ref.watch(dioProvider);
      final remoteDataSource = TextToImageRemoteDataSource(dio);
      final repository = TextToImageRepositoryImpl(remoteDataSource);
      final useCase = GenerateImageUseCase(repository);
      return TextToImageNotifier(useCase);
    });

final imageUrlProvider = StreamProvider.autoDispose.family<String, String>((
  ref,
  taskId,
) {
  final dio = ref.watch(dioProvider);
  final remoteDataSource = TextToImageRemoteDataSource(dio);
  return remoteDataSource.getImageUrlStream(taskId);
});