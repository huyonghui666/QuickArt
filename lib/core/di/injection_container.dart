import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quick_art/features/home/data/datasources/template_remote_data_source.dart';
import 'package:quick_art/features/home/data/datasources/text_to_image_remote_data_source.dart';
import 'package:quick_art/features/home/data/repositories/template_repository_impl.dart';
import 'package:quick_art/features/home/data/repositories/text_to_image_repository_impl.dart';
import 'package:quick_art/features/home/domain/repositories/template_repository.dart';
import 'package:quick_art/features/home/domain/repositories/text_to_image_repository.dart';
import 'package:quick_art/features/home/domain/usecases/text_to_generate_image_usecase.dart';
import 'package:quick_art/features/tools/data/datasources/text_to_video_remote_data_source.dart';
import 'package:quick_art/features/tools/data/repositories/text_to_video_repository_impl.dart';
import 'package:quick_art/features/tools/domain/repositories/text_to_video_repository.dart';
import 'package:quick_art/features/tools/domain/usecases/start_end_frame_generate_video_usecase.dart';
import 'package:quick_art/features/tools/domain/usecases/text_to_generate_video_usecase.dart';
import 'package:quick_art/features/workshop/data/datasources/local_data_source/database_helper.dart';
import 'package:quick_art/features/workshop/data/repositories/workshop_repository_impl.dart';
import 'package:quick_art/features/workshop/domain/repositories/workshop_repository.dart';
import 'package:quick_art/features/workshop/domain/usecases/get_workshop_tasks_usecase.dart';
import 'package:quick_art/features/home/domain/usecases/get_templates_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

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

//-----------------------------------Workshop-------------------------------------------------
@riverpod
DatabaseHelper databaseHelper(Ref ref) {
  return DatabaseHelper();
}

@riverpod
WorkshopRepository workshopRepository(Ref ref) {
  final databaseHelper = ref.watch(databaseHelperProvider);
  return WorkshopRepositoryImpl(databaseHelper);
}

@riverpod
GetWorkshopTasksUseCase getWorkshopTasksUseCase(Ref ref) {
  final repository = ref.watch(workshopRepositoryProvider);
  return GetWorkshopTasksUseCase(repository);
}

//------------------------------图片模板------------------------------------------
@riverpod
ITemplateRemoteDataSource templateRemoteDataSource(Ref ref) {
  return TemplateRemoteDataSource(ref.watch(dioProvider));
}

@riverpod
TemplateRepository templateRepository(Ref ref) {
  return TemplateRepositoryImpl(ref.watch(templateRemoteDataSourceProvider));
}

@riverpod
GetTemplatesUseCase getTemplatesUseCase(Ref ref) {
  return GetTemplatesUseCase(ref.watch(templateRepositoryProvider));
}
