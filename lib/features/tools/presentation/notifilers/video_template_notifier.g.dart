// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_template_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$videoTemplatesHash() => r'0f52374892aa43df8f172854918f270ca5421ac3';

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

abstract class _$VideoTemplates
    extends BuildlessAutoDisposeAsyncNotifier<VideoTemplatePage> {
  late final String category;

  FutureOr<VideoTemplatePage> build({required String category});
}

/// 视频模板状态管理 Notifier
///
/// Copied from [VideoTemplates].
@ProviderFor(VideoTemplates)
const videoTemplatesProvider = VideoTemplatesFamily();

/// 视频模板状态管理 Notifier
///
/// Copied from [VideoTemplates].
class VideoTemplatesFamily extends Family<AsyncValue<VideoTemplatePage>> {
  /// 视频模板状态管理 Notifier
  ///
  /// Copied from [VideoTemplates].
  const VideoTemplatesFamily();

  /// 视频模板状态管理 Notifier
  ///
  /// Copied from [VideoTemplates].
  VideoTemplatesProvider call({required String category}) {
    return VideoTemplatesProvider(category: category);
  }

  @override
  VideoTemplatesProvider getProviderOverride(
    covariant VideoTemplatesProvider provider,
  ) {
    return call(category: provider.category);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'videoTemplatesProvider';
}

/// 视频模板状态管理 Notifier
///
/// Copied from [VideoTemplates].
class VideoTemplatesProvider
    extends
        AutoDisposeAsyncNotifierProviderImpl<
          VideoTemplates,
          VideoTemplatePage
        > {
  /// 视频模板状态管理 Notifier
  ///
  /// Copied from [VideoTemplates].
  VideoTemplatesProvider({required String category})
    : this._internal(
        () => VideoTemplates()..category = category,
        from: videoTemplatesProvider,
        name: r'videoTemplatesProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$videoTemplatesHash,
        dependencies: VideoTemplatesFamily._dependencies,
        allTransitiveDependencies:
            VideoTemplatesFamily._allTransitiveDependencies,
        category: category,
      );

  VideoTemplatesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.category,
  }) : super.internal();

  final String category;

  @override
  FutureOr<VideoTemplatePage> runNotifierBuild(
    covariant VideoTemplates notifier,
  ) {
    return notifier.build(category: category);
  }

  @override
  Override overrideWith(VideoTemplates Function() create) {
    return ProviderOverride(
      origin: this,
      override: VideoTemplatesProvider._internal(
        () => create()..category = category,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        category: category,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<VideoTemplates, VideoTemplatePage>
  createElement() {
    return _VideoTemplatesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is VideoTemplatesProvider && other.category == category;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, category.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin VideoTemplatesRef
    on AutoDisposeAsyncNotifierProviderRef<VideoTemplatePage> {
  /// The parameter `category` of this provider.
  String get category;
}

class _VideoTemplatesProviderElement
    extends
        AutoDisposeAsyncNotifierProviderElement<
          VideoTemplates,
          VideoTemplatePage
        >
    with VideoTemplatesRef {
  _VideoTemplatesProviderElement(super.provider);

  @override
  String get category => (origin as VideoTemplatesProvider).category;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
