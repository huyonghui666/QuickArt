// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_player_controller_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$videoPlayerControllerHash() =>
    r'686e976aceaa0afc8ae1a20d054a7e1c88cbb879';

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

/// See also [videoPlayerController].
@ProviderFor(videoPlayerController)
const videoPlayerControllerProvider = VideoPlayerControllerFamily();

/// See also [videoPlayerController].
class VideoPlayerControllerFamily
    extends Family<AsyncValue<VideoPlayerController>> {
  /// See also [videoPlayerController].
  const VideoPlayerControllerFamily();

  /// See also [videoPlayerController].
  VideoPlayerControllerProvider call(String videoPath) {
    return VideoPlayerControllerProvider(videoPath);
  }

  @override
  VideoPlayerControllerProvider getProviderOverride(
    covariant VideoPlayerControllerProvider provider,
  ) {
    return call(provider.videoPath);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'videoPlayerControllerProvider';
}

/// See also [videoPlayerController].
class VideoPlayerControllerProvider
    extends AutoDisposeFutureProvider<VideoPlayerController> {
  /// See also [videoPlayerController].
  VideoPlayerControllerProvider(String videoPath)
    : this._internal(
        (ref) =>
            videoPlayerController(ref as VideoPlayerControllerRef, videoPath),
        from: videoPlayerControllerProvider,
        name: r'videoPlayerControllerProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$videoPlayerControllerHash,
        dependencies: VideoPlayerControllerFamily._dependencies,
        allTransitiveDependencies:
            VideoPlayerControllerFamily._allTransitiveDependencies,
        videoPath: videoPath,
      );

  VideoPlayerControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.videoPath,
  }) : super.internal();

  final String videoPath;

  @override
  Override overrideWith(
    FutureOr<VideoPlayerController> Function(VideoPlayerControllerRef provider)
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: VideoPlayerControllerProvider._internal(
        (ref) => create(ref as VideoPlayerControllerRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        videoPath: videoPath,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<VideoPlayerController> createElement() {
    return _VideoPlayerControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is VideoPlayerControllerProvider &&
        other.videoPath == videoPath;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, videoPath.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin VideoPlayerControllerRef
    on AutoDisposeFutureProviderRef<VideoPlayerController> {
  /// The parameter `videoPath` of this provider.
  String get videoPath;
}

class _VideoPlayerControllerProviderElement
    extends AutoDisposeFutureProviderElement<VideoPlayerController>
    with VideoPlayerControllerRef {
  _VideoPlayerControllerProviderElement(super.provider);

  @override
  String get videoPath => (origin as VideoPlayerControllerProvider).videoPath;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
