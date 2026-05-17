// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'injection_container.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$dioHash() => r'12c3f9ea7b0a2c11d6239a75a4352a954eb063f4';

/// dio 实例
///
/// Copied from [dio].
@ProviderFor(dio)
final dioProvider = AutoDisposeProvider<Dio>.internal(
  dio,
  name: r'dioProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$dioHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef DioRef = AutoDisposeProviderRef<Dio>;
String _$textToImageRemoteDataSourceHash() =>
    r'2d1363d546f3093493a3f885a5f21d77d10b5e35';

/// 文生图远程数据源
///
/// Copied from [textToImageRemoteDataSource].
@ProviderFor(textToImageRemoteDataSource)
final textToImageRemoteDataSourceProvider =
    AutoDisposeProvider<ITextToImageRemoteDataSource>.internal(
      textToImageRemoteDataSource,
      name: r'textToImageRemoteDataSourceProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$textToImageRemoteDataSourceHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TextToImageRemoteDataSourceRef =
    AutoDisposeProviderRef<ITextToImageRemoteDataSource>;
String _$textToImageRepositoryHash() =>
    r'ae715e6daf35e555f1b5fb187b6a5fbd28fedb56';

/// 文生图仓库
///
/// Copied from [textToImageRepository].
@ProviderFor(textToImageRepository)
final textToImageRepositoryProvider =
    AutoDisposeProvider<ITextToImageRepository>.internal(
      textToImageRepository,
      name: r'textToImageRepositoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$textToImageRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TextToImageRepositoryRef =
    AutoDisposeProviderRef<ITextToImageRepository>;
String _$textToGenerateImageUseCaseHash() =>
    r'32dc099d58dfc2a676cd3b564b556afd58d6605e';

/// 文生图用例
///
/// Copied from [textToGenerateImageUseCase].
@ProviderFor(textToGenerateImageUseCase)
final textToGenerateImageUseCaseProvider =
    AutoDisposeProvider<TextToGenerateImageUseCase>.internal(
      textToGenerateImageUseCase,
      name: r'textToGenerateImageUseCaseProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$textToGenerateImageUseCaseHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TextToGenerateImageUseCaseRef =
    AutoDisposeProviderRef<TextToGenerateImageUseCase>;
String _$textToVideoRemoteDataSourceHash() =>
    r'5d6430e3a4f341644ca1d8e48df4ed64ee6a70c4';

/// 视频生成远程数据源
///
/// Copied from [textToVideoRemoteDataSource].
@ProviderFor(textToVideoRemoteDataSource)
final textToVideoRemoteDataSourceProvider =
    AutoDisposeProvider<IGenerateVideoRemoteDataSource>.internal(
      textToVideoRemoteDataSource,
      name: r'textToVideoRemoteDataSourceProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$textToVideoRemoteDataSourceHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TextToVideoRemoteDataSourceRef =
    AutoDisposeProviderRef<IGenerateVideoRemoteDataSource>;
String _$textToVideoRepositoryHash() =>
    r'1775ad0d27296c4fb5ac8f590a8065acba12b60a';

/// 视频生成仓库
///
/// Copied from [textToVideoRepository].
@ProviderFor(textToVideoRepository)
final textToVideoRepositoryProvider =
    AutoDisposeProvider<ITextToVideoRepository>.internal(
      textToVideoRepository,
      name: r'textToVideoRepositoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$textToVideoRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TextToVideoRepositoryRef =
    AutoDisposeProviderRef<ITextToVideoRepository>;
String _$textToGenerateVideoUseCaseHash() =>
    r'ed29f04324270fc75d89b3a8da9ed5a9ae1bb4b7';

/// 文生视频用例
///
/// Copied from [textToGenerateVideoUseCase].
@ProviderFor(textToGenerateVideoUseCase)
final textToGenerateVideoUseCaseProvider =
    AutoDisposeProvider<TextToGenerateVideoUseCase>.internal(
      textToGenerateVideoUseCase,
      name: r'textToGenerateVideoUseCaseProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$textToGenerateVideoUseCaseHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TextToGenerateVideoUseCaseRef =
    AutoDisposeProviderRef<TextToGenerateVideoUseCase>;
String _$startEndFrameGenerateVideoUseCaseHash() =>
    r'e1b8a3a1b12b8a9efe01a00cc7bef741a86d1712';

/// 首尾帧生成视频用例
///
/// Copied from [startEndFrameGenerateVideoUseCase].
@ProviderFor(startEndFrameGenerateVideoUseCase)
final startEndFrameGenerateVideoUseCaseProvider =
    AutoDisposeProvider<StartEndFrameGenerateVideoUseCase>.internal(
      startEndFrameGenerateVideoUseCase,
      name: r'startEndFrameGenerateVideoUseCaseProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$startEndFrameGenerateVideoUseCaseHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef StartEndFrameGenerateVideoUseCaseRef =
    AutoDisposeProviderRef<StartEndFrameGenerateVideoUseCase>;
String _$generateVideoFromImageUseCaseHash() =>
    r'5049fb5e154c3c8209369fcd7ac187cd0f3164ae';

/// 图生视频用例
///
/// Copied from [generateVideoFromImageUseCase].
@ProviderFor(generateVideoFromImageUseCase)
final generateVideoFromImageUseCaseProvider =
    AutoDisposeProvider<GenerateVideoFromImageUseCase>.internal(
      generateVideoFromImageUseCase,
      name: r'generateVideoFromImageUseCaseProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$generateVideoFromImageUseCaseHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GenerateVideoFromImageUseCaseRef =
    AutoDisposeProviderRef<GenerateVideoFromImageUseCase>;
String _$databaseHelperHash() => r'd9a91b257d3ed9a4f2d87bd829e17dc900678685';

/// 数据库帮助类
///
/// Copied from [databaseHelper].
@ProviderFor(databaseHelper)
final databaseHelperProvider = AutoDisposeProvider<DatabaseHelper>.internal(
  databaseHelper,
  name: r'databaseHelperProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$databaseHelperHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef DatabaseHelperRef = AutoDisposeProviderRef<DatabaseHelper>;
String _$workshopRepositoryHash() =>
    r'96ecab35c53586f20523abb835a492115697f05b';

/// 工作坊仓库
///
/// Copied from [workshopRepository].
@ProviderFor(workshopRepository)
final workshopRepositoryProvider =
    AutoDisposeProvider<IWorkshopRepository>.internal(
      workshopRepository,
      name: r'workshopRepositoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$workshopRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef WorkshopRepositoryRef = AutoDisposeProviderRef<IWorkshopRepository>;
String _$getWorkshopTasksUseCaseHash() =>
    r'079c3c56bf7b9865ddb51c6f72f60c08c13201ef';

/// 获取工作坊任务用例
///
/// Copied from [getWorkshopTasksUseCase].
@ProviderFor(getWorkshopTasksUseCase)
final getWorkshopTasksUseCaseProvider =
    AutoDisposeProvider<GetWorkshopTasksUseCase>.internal(
      getWorkshopTasksUseCase,
      name: r'getWorkshopTasksUseCaseProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$getWorkshopTasksUseCaseHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetWorkshopTasksUseCaseRef =
    AutoDisposeProviderRef<GetWorkshopTasksUseCase>;
String _$templateRemoteDataSourceHash() =>
    r'7499ad9f691e09bf18a697c2e7493419eacd2766';

/// 图片模板远程数据源
///
/// Copied from [templateRemoteDataSource].
@ProviderFor(templateRemoteDataSource)
final templateRemoteDataSourceProvider =
    AutoDisposeProvider<ITemplateRemoteDataSource>.internal(
      templateRemoteDataSource,
      name: r'templateRemoteDataSourceProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$templateRemoteDataSourceHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TemplateRemoteDataSourceRef =
    AutoDisposeProviderRef<ITemplateRemoteDataSource>;
String _$templateRepositoryHash() =>
    r'64e3392471abfc6e86e37ca303dbcd19ad655c0d';

/// 图片模板仓库
///
/// Copied from [templateRepository].
@ProviderFor(templateRepository)
final templateRepositoryProvider =
    AutoDisposeProvider<ITemplateRepository>.internal(
      templateRepository,
      name: r'templateRepositoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$templateRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TemplateRepositoryRef = AutoDisposeProviderRef<ITemplateRepository>;
String _$getTemplatesUseCaseHash() =>
    r'ef04dfdb077b93f6ec17d5566aaa98d75abc0885';

/// 获取图片模板用例
///
/// Copied from [getTemplatesUseCase].
@ProviderFor(getTemplatesUseCase)
final getTemplatesUseCaseProvider =
    AutoDisposeProvider<GetTemplatesUseCase>.internal(
      getTemplatesUseCase,
      name: r'getTemplatesUseCaseProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$getTemplatesUseCaseHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetTemplatesUseCaseRef = AutoDisposeProviderRef<GetTemplatesUseCase>;
String _$videoTemplateRemoteDataSourceHash() =>
    r'33f93f9d3abbf502811c220b16b7706c00595b30';

/// 视频模板远程数据源
///
/// Copied from [videoTemplateRemoteDataSource].
@ProviderFor(videoTemplateRemoteDataSource)
final videoTemplateRemoteDataSourceProvider =
    AutoDisposeProvider<IVideoTemplateRemoteDataSource>.internal(
      videoTemplateRemoteDataSource,
      name: r'videoTemplateRemoteDataSourceProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$videoTemplateRemoteDataSourceHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef VideoTemplateRemoteDataSourceRef =
    AutoDisposeProviderRef<IVideoTemplateRemoteDataSource>;
String _$videoTemplateRepositoryHash() =>
    r'4bb469f3ebb396484c843d0bb681216e0f53d37f';

/// 视频模板仓库
///
/// Copied from [videoTemplateRepository].
@ProviderFor(videoTemplateRepository)
final videoTemplateRepositoryProvider =
    AutoDisposeProvider<IVideoTemplateRepository>.internal(
      videoTemplateRepository,
      name: r'videoTemplateRepositoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$videoTemplateRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef VideoTemplateRepositoryRef =
    AutoDisposeProviderRef<IVideoTemplateRepository>;
String _$getVideoTemplatesUseCaseHash() =>
    r'c87de6ef7b5560eb7e676bd92eb2a2795ac6aa9b';

/// 获取视频模板用例
///
/// Copied from [getVideoTemplatesUseCase].
@ProviderFor(getVideoTemplatesUseCase)
final getVideoTemplatesUseCaseProvider =
    AutoDisposeProvider<GetVideoTemplatesUseCase>.internal(
      getVideoTemplatesUseCase,
      name: r'getVideoTemplatesUseCaseProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$getVideoTemplatesUseCaseHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetVideoTemplatesUseCaseRef =
    AutoDisposeProviderRef<GetVideoTemplatesUseCase>;
String _$artStylesLocalDataSourceHash() =>
    r'79d28d98a2b7c1ba2a8e7bb134fdd3a5e2e52275';

/// 艺术风格本地数据源
///
/// Copied from [artStylesLocalDataSource].
@ProviderFor(artStylesLocalDataSource)
final artStylesLocalDataSourceProvider =
    AutoDisposeProvider<IArtStylesLocalDataSource>.internal(
      artStylesLocalDataSource,
      name: r'artStylesLocalDataSourceProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$artStylesLocalDataSourceHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ArtStylesLocalDataSourceRef =
    AutoDisposeProviderRef<IArtStylesLocalDataSource>;
String _$artStylesRemoteDataSourceHash() =>
    r'6b2c52b754ab21036cec91ab174750e4a0d7bb3b';

/// 艺术风格配置远程数据源
///
/// Copied from [artStylesRemoteDataSource].
@ProviderFor(artStylesRemoteDataSource)
final artStylesRemoteDataSourceProvider =
    AutoDisposeProvider<IArtStylesRemoteDataSource>.internal(
      artStylesRemoteDataSource,
      name: r'artStylesRemoteDataSourceProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$artStylesRemoteDataSourceHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ArtStylesRemoteDataSourceRef =
    AutoDisposeProviderRef<IArtStylesRemoteDataSource>;
String _$remoteArtStyleConfigRepositoryHash() =>
    r'25de2da99a23ae1041ecbb2b0ee6a61d349b2935';

/// 远程配置仓库
///
/// Copied from [remoteArtStyleConfigRepository].
@ProviderFor(remoteArtStyleConfigRepository)
final remoteArtStyleConfigRepositoryProvider =
    AutoDisposeProvider<RemoteArtStyleConfigRepository>.internal(
      remoteArtStyleConfigRepository,
      name: r'remoteArtStyleConfigRepositoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$remoteArtStyleConfigRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef RemoteArtStyleConfigRepositoryRef =
    AutoDisposeProviderRef<RemoteArtStyleConfigRepository>;
String _$remoteArtStyleConfigUseCaseHash() =>
    r'0dd59cd972c20e0c83a4d11702f5f67a190adcb9';

/// 远程配置聚合用例
///
/// Copied from [remoteArtStyleConfigUseCase].
@ProviderFor(remoteArtStyleConfigUseCase)
final remoteArtStyleConfigUseCaseProvider =
    AutoDisposeProvider<RemoteArtStyleConfigUseCase>.internal(
      remoteArtStyleConfigUseCase,
      name: r'remoteArtStyleConfigUseCaseProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$remoteArtStyleConfigUseCaseHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef RemoteArtStyleConfigUseCaseRef =
    AutoDisposeProviderRef<RemoteArtStyleConfigUseCase>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
