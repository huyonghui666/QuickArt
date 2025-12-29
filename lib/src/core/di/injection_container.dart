import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:quick_art/src/features/quick_art/tools/data/datasources/text_to_video_remote_data_source.dart';
import 'package:quick_art/src/features/quick_art/tools/data/repositories/text_to_video_repository_impl.dart';
import 'package:quick_art/src/features/quick_art/tools/domain/repositories/text_to_video_repository.dart';
import 'package:quick_art/src/features/quick_art/tools/domain/usecases/text_to_generate_video_usecase.dart';

part 'injection_container.g.dart';

//------------------------dio-----------------------------------------
@riverpod
Dio dio(Ref ref) {
  return Dio();
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
