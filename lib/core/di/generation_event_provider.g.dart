// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generation_event_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$generationEventControllerHash() =>
    r'7aa70d4b704e6740dff565c87cae1f566aa5e407';

/// 全局任务结果事件流控制器
/// 使用 Provider 管理 Controller，确保可测试性和生命周期管理
///
/// Copied from [generationEventController].
@ProviderFor(generationEventController)
final generationEventControllerProvider =
    Provider<StreamController<GenerationResultModel>>.internal(
      generationEventController,
      name: r'generationEventControllerProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$generationEventControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GenerationEventControllerRef =
    ProviderRef<StreamController<GenerationResultModel>>;
String _$generationEventHash() => r'a37e9f8f45bfff1ec92eae768b1939fd9334879e';

/// 全局任务结果事件流
/// 用于通知 UI 任务完成（成功或失败）
///
/// Copied from [generationEvent].
@ProviderFor(generationEvent)
final generationEventProvider = StreamProvider<GenerationResultModel>.internal(
  generationEvent,
  name: r'generationEventProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$generationEventHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GenerationEventRef = StreamProviderRef<GenerationResultModel>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
