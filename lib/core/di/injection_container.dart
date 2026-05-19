import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quick_art/core/di/config/config_provider.dart';
import 'package:quick_art/features/home/data/datasources/Remote_data_source/art_styles_remote_data_source.dart';
import 'package:quick_art/features/home/data/datasources/Remote_data_source/template_remote_data_source.dart';
import 'package:quick_art/features/home/data/datasources/Remote_data_source/text_to_image_remote_data_source.dart';
import 'package:quick_art/features/home/data/datasources/local_data_source/art_styles_local_data_source.dart';
import 'package:quick_art/features/home/data/repositories/remote_art_style_config_repository_impl.dart';
import 'package:quick_art/features/home/data/repositories/template_repository_impl.dart';
import 'package:quick_art/features/home/data/repositories/text_to_image_repository_impl.dart';
import 'package:quick_art/features/home/domain/repositories/remote_config_repository.dart';
import 'package:quick_art/features/home/domain/repositories/template_repository.dart';
import 'package:quick_art/features/home/domain/repositories/text_to_image_repository.dart';
import 'package:quick_art/features/home/domain/usecases/get_templates_usecase.dart';
import 'package:quick_art/features/home/domain/usecases/remote_config_usecase.dart';
import 'package:quick_art/features/home/domain/usecases/text_to_generate_image_usecase.dart';
import 'package:quick_art/features/tools/data/datasources/face_swap_remote_data_source.dart';
import 'package:quick_art/features/tools/data/datasources/generate_video_remote_data_source.dart';
import 'package:quick_art/features/tools/data/datasources/video_template_remote_data_source.dart';
import 'package:quick_art/features/tools/data/repositories/face_swap_repository_impl.dart';
import 'package:quick_art/features/tools/data/repositories/text_to_video_repository_impl.dart';
import 'package:quick_art/features/tools/data/repositories/video_template_repository_impl.dart';
import 'package:quick_art/features/tools/domain/repositories/face_swap_repository.dart';
import 'package:quick_art/features/tools/domain/repositories/text_to_video_repository.dart';
import 'package:quick_art/features/tools/domain/repositories/video_template_repository.dart';
import 'package:quick_art/features/tools/domain/usecases/detect_faces_usecase.dart';
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
ITextToImageRepository textToImageRepository(Ref ref) {
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
ITextToVideoRepository textToVideoRepository(Ref ref) {
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
IWorkshopRepository workshopRepository(Ref ref) {
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
ITemplateRepository templateRepository(Ref ref) {
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
IVideoTemplateRepository videoTemplateRepository(Ref ref) {
  final remoteDataSource = ref.watch(videoTemplateRemoteDataSourceProvider);
  return VideoTemplateRepositoryImpl(remoteDataSource);
}

/// 获取视频模板用例
@riverpod
GetVideoTemplatesUseCase getVideoTemplatesUseCase(Ref ref) {
  final repository = ref.watch(videoTemplateRepositoryProvider);
  return GetVideoTemplatesUseCase(repository);
}

//--------------------------------艺术风格----------------------------------
/// 艺术风格本地数据源
@riverpod
IArtStylesLocalDataSource artStylesLocalDataSource(Ref ref) {
  return ArtStylesLocalDataSource();
}

/// 艺术风格配置远程数据源
@riverpod
IArtStylesRemoteDataSource artStylesRemoteDataSource(Ref ref) {
  final dio = ref.watch(dioProvider);
  return ArtStylesRemoteDataSource(dio);
}

/// 远程配置仓库
@riverpod
RemoteArtStyleConfigRepository remoteArtStyleConfigRepository(Ref ref) {
  final localArtStyleDataSource = ref.watch(artStylesLocalDataSourceProvider);
  final remoteArtStyleDataSource = ref.watch(artStylesRemoteDataSourceProvider);
  return RemoteArtStyleConfigRepositoryImpl(
    localArtStyleDataSource,
    remoteArtStyleDataSource,
  );
}

/// 远程配置聚合用例
@riverpod
RemoteArtStyleConfigUseCase remoteArtStyleConfigUseCase(Ref ref) {
  return RemoteArtStyleConfigUseCase(
    ref.watch(remoteArtStyleConfigRepositoryProvider),
  );
}

//------------------------------AI 换脸------------------------------------------
/// 换脸远程数据源
@riverpod
IFaceSwapRemoteDataSource faceSwapRemoteDataSource(Ref ref) {
  return FaceSwapRemoteDataSource(ref.watch(dioProvider));
}

/// 换脸仓库
@riverpod
IFaceSwapRepository faceSwapRepository(Ref ref) {
  return FaceSwapRepositoryImpl(ref.watch(faceSwapRemoteDataSourceProvider));
}

/// 人脸检测用例
@riverpod
DetectFacesUseCase detectFacesUseCase(Ref ref) {
  return DetectFacesUseCase(ref.watch(faceSwapRepositoryProvider));
}
