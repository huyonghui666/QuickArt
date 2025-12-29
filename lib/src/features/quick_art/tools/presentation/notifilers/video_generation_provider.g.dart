// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_generation_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$videoGenerationNotifierHash() =>
    r'cf23d95ffbfae89baebf2a14816e9af9314e9321';

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

abstract class _$VideoGenerationNotifier
    extends BuildlessAutoDisposeNotifier<AsyncValue<VideoGenerationTask>> {
  late final String prompt;

  AsyncValue<VideoGenerationTask> build(String prompt);
}

/// See also [VideoGenerationNotifier].
@ProviderFor(VideoGenerationNotifier)
const videoGenerationNotifierProvider = VideoGenerationNotifierFamily();

/// See also [VideoGenerationNotifier].
class VideoGenerationNotifierFamily
    extends Family<AsyncValue<VideoGenerationTask>> {
  /// See also [VideoGenerationNotifier].
  const VideoGenerationNotifierFamily();

  /// See also [VideoGenerationNotifier].
  VideoGenerationNotifierProvider call(String prompt) {
    return VideoGenerationNotifierProvider(prompt);
  }

  @override
  VideoGenerationNotifierProvider getProviderOverride(
    covariant VideoGenerationNotifierProvider provider,
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
  String? get name => r'videoGenerationNotifierProvider';
}

/// See also [VideoGenerationNotifier].
class VideoGenerationNotifierProvider
    extends
        AutoDisposeNotifierProviderImpl<
          VideoGenerationNotifier,
          AsyncValue<VideoGenerationTask>
        > {
  /// See also [VideoGenerationNotifier].
  VideoGenerationNotifierProvider(String prompt)
    : this._internal(
        () => VideoGenerationNotifier()..prompt = prompt,
        from: videoGenerationNotifierProvider,
        name: r'videoGenerationNotifierProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$videoGenerationNotifierHash,
        dependencies: VideoGenerationNotifierFamily._dependencies,
        allTransitiveDependencies:
            VideoGenerationNotifierFamily._allTransitiveDependencies,
        prompt: prompt,
      );

  VideoGenerationNotifierProvider._internal(
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
    covariant VideoGenerationNotifier notifier,
  ) {
    return notifier.build(prompt);
  }

  @override
  Override overrideWith(VideoGenerationNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: VideoGenerationNotifierProvider._internal(
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
    VideoGenerationNotifier,
    AsyncValue<VideoGenerationTask>
  >
  createElement() {
    return _VideoGenerationNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is VideoGenerationNotifierProvider && other.prompt == prompt;
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
mixin VideoGenerationNotifierRef
    on AutoDisposeNotifierProviderRef<AsyncValue<VideoGenerationTask>> {
  /// The parameter `prompt` of this provider.
  String get prompt;
}

class _VideoGenerationNotifierProviderElement
    extends
        AutoDisposeNotifierProviderElement<
          VideoGenerationNotifier,
          AsyncValue<VideoGenerationTask>
        >
    with VideoGenerationNotifierRef {
  _VideoGenerationNotifierProviderElement(super.provider);

  @override
  String get prompt => (origin as VideoGenerationNotifierProvider).prompt;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
