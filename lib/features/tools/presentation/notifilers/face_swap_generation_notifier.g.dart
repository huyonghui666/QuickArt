// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'face_swap_generation_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$faceSwapInputHolderHash() =>
    r'3e53aedaa57abc1e3e03c3b3ff6e2e531312398e';

/// 换脸输入参数持有者（keepAlive，跨页面传递）
///
/// Copied from [FaceSwapInputHolder].
@ProviderFor(FaceSwapInputHolder)
final faceSwapInputHolderProvider =
    NotifierProvider<FaceSwapInputHolder, FaceSwapInput?>.internal(
      FaceSwapInputHolder.new,
      name: r'faceSwapInputHolderProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$faceSwapInputHolderHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$FaceSwapInputHolder = Notifier<FaceSwapInput?>;
String _$faceSwapGenerationNotifierHash() =>
    r'997ccbf3558f85339dcc79c6984e84b35c7b068b';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$FaceSwapGenerationNotifier
    extends BuildlessAutoDisposeNotifier<AsyncValue<FaceSwapTask>> {
  late final String taskKey;

  AsyncValue<FaceSwapTask> build(String taskKey);
}

/// 换脸任务生成 Notifier
///
/// Copied from [FaceSwapGenerationNotifier].
@ProviderFor(FaceSwapGenerationNotifier)
const faceSwapGenerationNotifierProvider = FaceSwapGenerationNotifierFamily();

/// 换脸任务生成 Notifier
///
/// Copied from [FaceSwapGenerationNotifier].
class FaceSwapGenerationNotifierFamily
    extends Family<AsyncValue<FaceSwapTask>> {
  /// 换脸任务生成 Notifier
  ///
  /// Copied from [FaceSwapGenerationNotifier].
  const FaceSwapGenerationNotifierFamily();

  /// 换脸任务生成 Notifier
  ///
  /// Copied from [FaceSwapGenerationNotifier].
  FaceSwapGenerationNotifierProvider call(String taskKey) {
    return FaceSwapGenerationNotifierProvider(taskKey);
  }

  @override
  FaceSwapGenerationNotifierProvider getProviderOverride(
    covariant FaceSwapGenerationNotifierProvider provider,
  ) {
    return call(provider.taskKey);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'faceSwapGenerationNotifierProvider';
}

/// 换脸任务生成 Notifier
///
/// Copied from [FaceSwapGenerationNotifier].
class FaceSwapGenerationNotifierProvider
    extends
        AutoDisposeNotifierProviderImpl<
          FaceSwapGenerationNotifier,
          AsyncValue<FaceSwapTask>
        > {
  /// 换脸任务生成 Notifier
  ///
  /// Copied from [FaceSwapGenerationNotifier].
  FaceSwapGenerationNotifierProvider(String taskKey)
    : this._internal(
        () => FaceSwapGenerationNotifier()..taskKey = taskKey,
        from: faceSwapGenerationNotifierProvider,
        name: r'faceSwapGenerationNotifierProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$faceSwapGenerationNotifierHash,
        dependencies: FaceSwapGenerationNotifierFamily._dependencies,
        allTransitiveDependencies:
            FaceSwapGenerationNotifierFamily._allTransitiveDependencies,
        taskKey: taskKey,
      );

  FaceSwapGenerationNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.taskKey,
  }) : super.internal();

  final String taskKey;

  @override
  AsyncValue<FaceSwapTask> runNotifierBuild(
    covariant FaceSwapGenerationNotifier notifier,
  ) {
    return notifier.build(taskKey);
  }

  @override
  Override overrideWith(FaceSwapGenerationNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: FaceSwapGenerationNotifierProvider._internal(
        () => create()..taskKey = taskKey,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        taskKey: taskKey,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<
    FaceSwapGenerationNotifier,
    AsyncValue<FaceSwapTask>
  >
  createElement() {
    return _FaceSwapGenerationNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FaceSwapGenerationNotifierProvider &&
        other.taskKey == taskKey;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, taskKey.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FaceSwapGenerationNotifierRef
    on AutoDisposeNotifierProviderRef<AsyncValue<FaceSwapTask>> {
  /// The parameter `taskKey` of this provider.
  String get taskKey;
}

class _FaceSwapGenerationNotifierProviderElement
    extends
        AutoDisposeNotifierProviderElement<
          FaceSwapGenerationNotifier,
          AsyncValue<FaceSwapTask>
        >
    with FaceSwapGenerationNotifierRef {
  _FaceSwapGenerationNotifierProviderElement(super.provider);

  @override
  String get taskKey => (origin as FaceSwapGenerationNotifierProvider).taskKey;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
