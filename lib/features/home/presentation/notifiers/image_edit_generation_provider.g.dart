// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_edit_generation_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$imageEditGenerationNotifierHash() =>
    r'5dedf3b0fdce6209699e6c876d69ca735c32e2aa';

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

abstract class _$ImageEditGenerationNotifier
    extends BuildlessAutoDisposeNotifier<AsyncValue<ImageGenerationTask>> {
  late final String prompt;
  late final String imagePath;

  AsyncValue<ImageGenerationTask> build(String prompt, String imagePath);
}

/// 图生图 Notifier
///
/// Copied from [ImageEditGenerationNotifier].
@ProviderFor(ImageEditGenerationNotifier)
const imageEditGenerationNotifierProvider = ImageEditGenerationNotifierFamily();

/// 图生图 Notifier
///
/// Copied from [ImageEditGenerationNotifier].
class ImageEditGenerationNotifierFamily
    extends Family<AsyncValue<ImageGenerationTask>> {
  /// 图生图 Notifier
  ///
  /// Copied from [ImageEditGenerationNotifier].
  const ImageEditGenerationNotifierFamily();

  /// 图生图 Notifier
  ///
  /// Copied from [ImageEditGenerationNotifier].
  ImageEditGenerationNotifierProvider call(String prompt, String imagePath) {
    return ImageEditGenerationNotifierProvider(prompt, imagePath);
  }

  @override
  ImageEditGenerationNotifierProvider getProviderOverride(
    covariant ImageEditGenerationNotifierProvider provider,
  ) {
    return call(provider.prompt, provider.imagePath);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'imageEditGenerationNotifierProvider';
}

/// 图生图 Notifier
///
/// Copied from [ImageEditGenerationNotifier].
class ImageEditGenerationNotifierProvider
    extends
        AutoDisposeNotifierProviderImpl<
          ImageEditGenerationNotifier,
          AsyncValue<ImageGenerationTask>
        > {
  /// 图生图 Notifier
  ///
  /// Copied from [ImageEditGenerationNotifier].
  ImageEditGenerationNotifierProvider(String prompt, String imagePath)
    : this._internal(
        () => ImageEditGenerationNotifier()
          ..prompt = prompt
          ..imagePath = imagePath,
        from: imageEditGenerationNotifierProvider,
        name: r'imageEditGenerationNotifierProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$imageEditGenerationNotifierHash,
        dependencies: ImageEditGenerationNotifierFamily._dependencies,
        allTransitiveDependencies:
            ImageEditGenerationNotifierFamily._allTransitiveDependencies,
        prompt: prompt,
        imagePath: imagePath,
      );

  ImageEditGenerationNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.prompt,
    required this.imagePath,
  }) : super.internal();

  final String prompt;
  final String imagePath;

  @override
  AsyncValue<ImageGenerationTask> runNotifierBuild(
    covariant ImageEditGenerationNotifier notifier,
  ) {
    return notifier.build(prompt, imagePath);
  }

  @override
  Override overrideWith(ImageEditGenerationNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: ImageEditGenerationNotifierProvider._internal(
        () => create()
          ..prompt = prompt
          ..imagePath = imagePath,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        prompt: prompt,
        imagePath: imagePath,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<
    ImageEditGenerationNotifier,
    AsyncValue<ImageGenerationTask>
  >
  createElement() {
    return _ImageEditGenerationNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ImageEditGenerationNotifierProvider &&
        other.prompt == prompt &&
        other.imagePath == imagePath;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, prompt.hashCode);
    hash = _SystemHash.combine(hash, imagePath.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ImageEditGenerationNotifierRef
    on AutoDisposeNotifierProviderRef<AsyncValue<ImageGenerationTask>> {
  /// The parameter `prompt` of this provider.
  String get prompt;

  /// The parameter `imagePath` of this provider.
  String get imagePath;
}

class _ImageEditGenerationNotifierProviderElement
    extends
        AutoDisposeNotifierProviderElement<
          ImageEditGenerationNotifier,
          AsyncValue<ImageGenerationTask>
        >
    with ImageEditGenerationNotifierRef {
  _ImageEditGenerationNotifierProviderElement(super.provider);

  @override
  String get prompt => (origin as ImageEditGenerationNotifierProvider).prompt;
  @override
  String get imagePath =>
      (origin as ImageEditGenerationNotifierProvider).imagePath;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
