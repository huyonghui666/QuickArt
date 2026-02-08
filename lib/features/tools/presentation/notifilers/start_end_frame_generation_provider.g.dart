// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'start_end_frame_generation_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$startEndFrameGenerationNotifierHash() =>
    r'40361bb7c664ae99973eafc8e7f34dea5bcccece';

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

abstract class _$StartEndFrameGenerationNotifier
    extends BuildlessAutoDisposeNotifier<AsyncValue<VideoGenerationTask>> {
  late final String prompt;

  AsyncValue<VideoGenerationTask> build(String prompt);
}

/// See also [StartEndFrameGenerationNotifier].
@ProviderFor(StartEndFrameGenerationNotifier)
const startEndFrameGenerationNotifierProvider =
    StartEndFrameGenerationNotifierFamily();

/// See also [StartEndFrameGenerationNotifier].
class StartEndFrameGenerationNotifierFamily
    extends Family<AsyncValue<VideoGenerationTask>> {
  /// See also [StartEndFrameGenerationNotifier].
  const StartEndFrameGenerationNotifierFamily();

  /// See also [StartEndFrameGenerationNotifier].
  StartEndFrameGenerationNotifierProvider call(String prompt) {
    return StartEndFrameGenerationNotifierProvider(prompt);
  }

  @override
  StartEndFrameGenerationNotifierProvider getProviderOverride(
    covariant StartEndFrameGenerationNotifierProvider provider,
  ) {
    return call(provider.prompt);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'startEndFrameGenerationNotifierProvider';
}

/// See also [StartEndFrameGenerationNotifier].
class StartEndFrameGenerationNotifierProvider
    extends
        AutoDisposeNotifierProviderImpl<
          StartEndFrameGenerationNotifier,
          AsyncValue<VideoGenerationTask>
        > {
  /// See also [StartEndFrameGenerationNotifier].
  StartEndFrameGenerationNotifierProvider(String prompt)
    : this._internal(
        () => StartEndFrameGenerationNotifier()..prompt = prompt,
        from: startEndFrameGenerationNotifierProvider,
        name: r'startEndFrameGenerationNotifierProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$startEndFrameGenerationNotifierHash,
        dependencies: StartEndFrameGenerationNotifierFamily._dependencies,
        allTransitiveDependencies:
            StartEndFrameGenerationNotifierFamily._allTransitiveDependencies,
        prompt: prompt,
      );

  StartEndFrameGenerationNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.prompt,
  }) : super.internal();

  final String prompt;

  @override
  AsyncValue<VideoGenerationTask> runNotifierBuild(
    covariant StartEndFrameGenerationNotifier notifier,
  ) {
    return notifier.build(prompt);
  }

  @override
  Override overrideWith(StartEndFrameGenerationNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: StartEndFrameGenerationNotifierProvider._internal(
        () => create()..prompt = prompt,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        prompt: prompt,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<
    StartEndFrameGenerationNotifier,
    AsyncValue<VideoGenerationTask>
  >
  createElement() {
    return _StartEndFrameGenerationNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is StartEndFrameGenerationNotifierProvider &&
        other.prompt == prompt;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, prompt.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin StartEndFrameGenerationNotifierRef
    on AutoDisposeNotifierProviderRef<AsyncValue<VideoGenerationTask>> {
  /// The parameter `prompt` of this .
  String get prompt;
}

class _StartEndFrameGenerationNotifierProviderElement
    extends
        AutoDisposeNotifierProviderElement<
          StartEndFrameGenerationNotifier,
          AsyncValue<VideoGenerationTask>
        >
    with StartEndFrameGenerationNotifierRef {
  _StartEndFrameGenerationNotifierProviderElement(super.provider);

  @override
  String get prompt =>
      (origin as StartEndFrameGenerationNotifierProvider).prompt;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
