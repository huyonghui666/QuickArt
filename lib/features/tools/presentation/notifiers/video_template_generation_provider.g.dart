// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_template_generation_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$videoTemplateInputHash() =>
    r'ac444c2a8858e864f7dba47133ca549736953324';

/// See also [VideoTemplateInput].
@ProviderFor(VideoTemplateInput)
final videoTemplateInputProvider =
    NotifierProvider<VideoTemplateInput, VideoTemplateGenerationInput>.internal(
      VideoTemplateInput.new,
      name: r'videoTemplateInputProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$videoTemplateInputHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$VideoTemplateInput = Notifier<VideoTemplateGenerationInput>;
String _$videoTemplateGenerationNotifierHash() =>
    r'6bae0294d45dd54aecede61c373372a716846f1f';

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

abstract class _$VideoTemplateGenerationNotifier
    extends BuildlessAutoDisposeNotifier<AsyncValue<VideoGenerationTask>> {
  late final String prompt;

  AsyncValue<VideoGenerationTask> build(String prompt);
}

/// See also [VideoTemplateGenerationNotifier].
@ProviderFor(VideoTemplateGenerationNotifier)
const videoTemplateGenerationNotifierProvider =
    VideoTemplateGenerationNotifierFamily();

/// See also [VideoTemplateGenerationNotifier].
class VideoTemplateGenerationNotifierFamily
    extends Family<AsyncValue<VideoGenerationTask>> {
  /// See also [VideoTemplateGenerationNotifier].
  const VideoTemplateGenerationNotifierFamily();

  /// See also [VideoTemplateGenerationNotifier].
  VideoTemplateGenerationNotifierProvider call(String prompt) {
    return VideoTemplateGenerationNotifierProvider(prompt);
  }

  @override
  VideoTemplateGenerationNotifierProvider getProviderOverride(
    covariant VideoTemplateGenerationNotifierProvider provider,
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
  String? get name => r'videoTemplateGenerationNotifierProvider';
}

/// See also [VideoTemplateGenerationNotifier].
class VideoTemplateGenerationNotifierProvider
    extends
        AutoDisposeNotifierProviderImpl<
          VideoTemplateGenerationNotifier,
          AsyncValue<VideoGenerationTask>
        > {
  /// See also [VideoTemplateGenerationNotifier].
  VideoTemplateGenerationNotifierProvider(String prompt)
    : this._internal(
        () => VideoTemplateGenerationNotifier()..prompt = prompt,
        from: videoTemplateGenerationNotifierProvider,
        name: r'videoTemplateGenerationNotifierProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$videoTemplateGenerationNotifierHash,
        dependencies: VideoTemplateGenerationNotifierFamily._dependencies,
        allTransitiveDependencies:
            VideoTemplateGenerationNotifierFamily._allTransitiveDependencies,
        prompt: prompt,
      );

  VideoTemplateGenerationNotifierProvider._internal(
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
    covariant VideoTemplateGenerationNotifier notifier,
  ) {
    return notifier.build(prompt);
  }

  @override
  Override overrideWith(VideoTemplateGenerationNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: VideoTemplateGenerationNotifierProvider._internal(
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
    VideoTemplateGenerationNotifier,
    AsyncValue<VideoGenerationTask>
  >
  createElement() {
    return _VideoTemplateGenerationNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is VideoTemplateGenerationNotifierProvider &&
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
mixin VideoTemplateGenerationNotifierRef
    on AutoDisposeNotifierProviderRef<AsyncValue<VideoGenerationTask>> {
  /// The parameter `prompt` of this .
  String get prompt;
}

class _VideoTemplateGenerationNotifierProviderElement
    extends
        AutoDisposeNotifierProviderElement<
          VideoTemplateGenerationNotifier,
          AsyncValue<VideoGenerationTask>
        >
    with VideoTemplateGenerationNotifierRef {
  _VideoTemplateGenerationNotifierProviderElement(super.provider);

  @override
  String get prompt =>
      (origin as VideoTemplateGenerationNotifierProvider).prompt;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
