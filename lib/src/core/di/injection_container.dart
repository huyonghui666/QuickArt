import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:quick_art/src/features/quick_art/tools/data/datasources/text_to_video_remote_data_source.dart';
import 'package:quick_art/src/features/quick_art/tools/data/repositories/text_to_video_repository_impl.dart';
import 'package:quick_art/src/features/quick_art/tools/domain/repositories/text_to_video_repository.dart';
import 'package:quick_art/src/features/quick_art/tools/domain/usecases/text_to_generate_video_usecase.dart';
import 'package:quick_art/src/features/quick_art/tools/domain/usecases/start_end_frame_generate_video_usecase.dart';
import 'package:quick_art/src/features/quick_art/home/data/datasources/text_to_image_remote_data_source.dart';
import 'package:quick_art/src/features/quick_art/home/data/repositories/text_to_image_repository_impl.dart';
import 'package:quick_art/src/features/quick_art/home/domain/repositories/text_to_image_repository.dart';
import 'package:quick_art/src/features/quick_art/home/domain/usecases/text_to_generate_image_usecase.dart';

part 'injection_container.g.dart';

//------------------------dio-----------------------------------------
@riverpod
Dio dio(Ref ref) {
  return Dio();
}

//----------------------------文生图-------------------------------------

@riverpod
ITextToImageRemoteDataSource textToImageRemoteDataSource(Ref ref) {
  final dio = ref.watch(dioProvider);
  return TextToImageRemoteDataSource(dio);
}

@riverpod
TextToImageRepository textToImageRepository(Ref ref) {
  final remoteDataSource = ref.watch(textToImageRemoteDataSourceProvider);
  return TextToImageRepositoryImpl(remoteDataSource);
}

@riverpod
TextToGenerateImageUseCase textToGenerateImageUseCase(Ref ref) {
  final repository = ref.watch(textToImageRepositoryProvider);
  return TextToGenerateImageUseCase(repository);
}

//-----------------------------------文生视频-------------------------------------------------
@riverpod
ITextToVideoRemoteDataSource textToVideoRemoteDataSource(Ref ref) {
  final dio = ref.watch(dioProvider);
  return TextToVideoRemoteDataSource(dio);
}

@riverpod
TextToVideoRepository textToVideoRepository(Ref ref) {
  final remoteDataSource = ref.watch(textToVideoRemoteDataSourceProvider);
  return TextToVideoRepositoryImpl(remoteDataSource);
}

@riverpod
TextToGenerateVideoUseCase textToGenerateVideoUseCase(Ref ref) {
  final repository = ref.watch(textToVideoRepositoryProvider);
  return TextToGenerateVideoUseCase(repository);
}

@riverpod
StartEndFrameGenerateVideoUseCase startEndFrameGenerateVideoUseCase(Ref ref) {
  final repository = ref.watch(textToVideoRepositoryProvider);
  return StartEndFrameGenerateVideoUseCase(repository);
}
