import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quick_art/core/di/config/config_provider.dart';
import 'package:quick_art/features/home/data/datasources/template_remote_data_source.dart';
import 'package:quick_art/features/home/data/datasources/text_to_image_remote_data_source.dart';
import 'package:quick_art/features/home/data/repositories/template_repository_impl.dart';
import 'package:quick_art/features/home/data/repositories/text_to_image_repository_impl.dart';
import 'package:quick_art/features/home/domain/repositories/template_repository.dart';
import 'package:quick_art/features/home/domain/repositories/text_to_image_repository.dart';
import 'package:quick_art/features/home/domain/usecases/get_templates_usecase.dart';
import 'package:quick_art/features/home/domain/usecases/text_to_generate_image_usecase.dart';
import 'package:quick_art/features/tools/data/datasources/generate_video_remote_data_source.dart';
import 'package:quick_art/features/tools/data/datasources/video_template_remote_data_source.dart';
import 'package:quick_art/features/tools/data/repositories/text_to_video_repository_impl.dart';
import 'package:quick_art/features/tools/data/repositories/video_template_repository_impl.dart';
import 'package:quick_art/features/tools/domain/repositories/text_to_video_repository.dart';
import 'package:quick_art/features/tools/domain/repositories/video_template_repository.dart';
import 'package:quick_art/features/tools/domain/usecases/generate_video_from_image_usecase.dart';
import 'package:quick_art/features/tools/domain/usecases/get_video_templates_usecase.dart';
import 'package:quick_art/features/tools/domain/usecases/start_end_frame_generate_video_usecase.dart';
import 'package:quick_art/features/tools/domain/usecases/text_to_generate_video_usecase.dart';
import 'package:quick_art/features/workshop/data/datasources/local_data_source/database_helper.dart';
import 'package:quick_art/features/workshop/data/repositories/workshop_repository_impl.dart';
import 'package:quick_art/features/workshop/domain/repositories/workshop_repository.dart';
import 'package:quick_art/features/workshop/domain/usecases/get_workshop_tasks_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'injection_container.g.dart';

//------------------------dio-----------------------------------------
/// dio 实例
@riverpod
Dio dio(Ref ref) {
  final baseUrl = ref.watch(apiBaseUrlProvider);
  final config = ref.watch(appConfigProvider);

  final options = BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: config.connectionTimeout,
    receiveTimeout: config.connectionTimeout,
  );

  final dio = Dio(options);

  if (config.logNetworkRequests) {
    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
  }

  return dio;
}

//----------------------------文生图-------------------------------------
/// 文生图远程数据源
@riverpod
ITextToImageRemoteDataSource textToImageRemoteDataSource(Ref ref) {
  final dio = ref.watch(dioProvider);
  return TextToImageRemoteDataSource(dio);
}

/// 文生图仓库
@riverpod
TextToImageRepository textToImageRepository(Ref ref) {
  final remoteDataSource = ref.watch(textToImageRemoteDataSourceProvider);
  return TextToImageRepositoryImpl(remoteDataSource);
}

/// 文生图用例
@riverpod
TextToGenerateImageUseCase textToGenerateImageUseCase(Ref ref) {
  final repository = ref.watch(textToImageRepositoryProvider);
  return TextToGenerateImageUseCase(repository);
}

//-----------------------------------生视频--------------------------------------
/// 视频生成远程数据源
@riverpod
IGenerateVideoRemoteDataSource textToVideoRemoteDataSource(Ref ref) {
  final dio = ref.watch(dioProvider);
  return GenerateVideoRemoteDataSource(dio);
}

/// 视频生成仓库
@riverpod
TextToVideoRepository textToVideoRepository(Ref ref) {
  final remoteDataSource = ref.watch(textToVideoRemoteDataSourceProvider);
  return GenerateVideoRepositoryImpl(remoteDataSource);
}

/// 文生视频用例
@riverpod
TextToGenerateVideoUseCase textToGenerateVideoUseCase(Ref ref) {
  final repository = ref.watch(textToVideoRepositoryProvider);
  return TextToGenerateVideoUseCase(repository);
}

/// 首尾帧生成视频用例
@riverpod
StartEndFrameGenerateVideoUseCase startEndFrameGenerateVideoUseCase(Ref ref) {
  final repository = ref.watch(textToVideoRepositoryProvider);
  return StartEndFrameGenerateVideoUseCase(repository);
}

/// 图生视频用例
@riverpod
GenerateVideoFromImageUseCase generateVideoFromImageUseCase(Ref ref) {
  final repository = ref.watch(textToVideoRepositoryProvider);
  return GenerateVideoFromImageUseCase(repository);
}

//-----------------------------------Workshop-----------------------------------
/// 数据库帮助类
@riverpod
DatabaseHelper databaseHelper(Ref ref) {
  return DatabaseHelper();
}

/// 工作坊仓库
@riverpod
WorkshopRepository workshopRepository(Ref ref) {
  final databaseHelper = ref.watch(databaseHelperProvider);
  return WorkshopRepositoryImpl(databaseHelper);
}

/// 获取工作坊任务用例
@riverpod
GetWorkshopTasksUseCase getWorkshopTasksUseCase(Ref ref) {
  final repository = ref.watch(workshopRepositoryProvider);
  return GetWorkshopTasksUseCase(repository);
}

//------------------------------图片模板------------------------------------------
/// 图片模板远程数据源
@riverpod
ITemplateRemoteDataSource templateRemoteDataSource(Ref ref) {
  return TemplateRemoteDataSource(ref.watch(dioProvider));
}

/// 图片模板仓库
@riverpod
TemplateRepository templateRepository(Ref ref) {
  return TemplateRepositoryImpl(ref.watch(templateRemoteDataSourceProvider));
}

/// 获取图片模板用例
@riverpod
GetTemplatesUseCase getTemplatesUseCase(Ref ref) {
  return GetTemplatesUseCase(ref.watch(templateRepositoryProvider));
}

//------------------------------视频模板------------------------------------------
/// 视频模板远程数据源
@riverpod
IVideoTemplateRemoteDataSource videoTemplateRemoteDataSource(Ref ref) {
  final dio = ref.watch(dioProvider);
  return VideoTemplateRemoteDataSource(dio);
}

/// 视频模板仓库
@riverpod
VideoTemplateRepository videoTemplateRepository(Ref ref) {
  final remoteDataSource = ref.watch(videoTemplateRemoteDataSourceProvider);
  return VideoTemplateRepositoryImpl(remoteDataSource);
}

/// 获取视频模板用例
@riverpod
GetVideoTemplatesUseCase getVideoTemplatesUseCase(Ref ref) {
  final repository = ref.watch(videoTemplateRepositoryProvider);
  return GetVideoTemplatesUseCase(repository);
}
