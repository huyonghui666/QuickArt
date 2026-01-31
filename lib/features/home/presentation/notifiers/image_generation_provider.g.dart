// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_generation_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$imageGenerationNotifierHash() =>
    r'72665098ea1bc9f13ee0dec55bf626b58fee3228';

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

abstract class _$ImageGenerationNotifier
    extends BuildlessAutoDisposeNotifier<AsyncValue<ImageGenerationTaskModel>> {
  late final String prompt;

  AsyncValue<ImageGenerationTaskModel> build(String prompt);
}

/// See also [ImageGenerationNotifier].
@ProviderFor(ImageGenerationNotifier)
const imageGenerationNotifierProvider = ImageGenerationNotifierFamily();

/// See also [ImageGenerationNotifier].
class ImageGenerationNotifierFamily
    extends Family<AsyncValue<ImageGenerationTaskModel>> {
  /// See also [ImageGenerationNotifier].
  const ImageGenerationNotifierFamily();

  /// See also [ImageGenerationNotifier].
  ImageGenerationNotifierProvider call(String prompt) {
    return ImageGenerationNotifierProvider(prompt);
  }

  @override
  ImageGenerationNotifierProvider getProviderOverride(
    covariant ImageGenerationNotifierProvider provider,
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
  String? get name => r'imageGenerationNotifierProvider';
}

/// See also [ImageGenerationNotifier].
class ImageGenerationNotifierProvider
    extends
        AutoDisposeNotifierProviderImpl<
          ImageGenerationNotifier,
          AsyncValue<ImageGenerationTaskModel>
        > {
  /// See also [ImageGenerationNotifier].
  ImageGenerationNotifierProvider(String prompt)
    : this._internal(
        () => ImageGenerationNotifier()..prompt = prompt,
        from: imageGenerationNotifierProvider,
        name: r'imageGenerationNotifierProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$imageGenerationNotifierHash,
        dependencies: ImageGenerationNotifierFamily._dependencies,
        allTransitiveDependencies:
            ImageGenerationNotifierFamily._allTransitiveDependencies,
        prompt: prompt,
      );

  ImageGenerationNotifierProvider._internal(
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
  AsyncValue<ImageGenerationTaskModel> runNotifierBuild(
    covariant ImageGenerationNotifier notifier,
  ) {
    return notifier.build(prompt);
  }

  @override
  Override overrideWith(ImageGenerationNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: ImageGenerationNotifierProvider._internal(
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
    ImageGenerationNotifier,
    AsyncValue<ImageGenerationTaskModel>
  >
  createElement() {
    return _ImageGenerationNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ImageGenerationNotifierProvider && other.prompt == prompt;
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
mixin ImageGenerationNotifierRef
    on AutoDisposeNotifierProviderRef<AsyncValue<ImageGenerationTaskModel>> {
  /// The parameter `prompt` of this provider.
  String get prompt;
}

class _ImageGenerationNotifierProviderElement
    extends
        AutoDisposeNotifierProviderElement<
          ImageGenerationNotifier,
          AsyncValue<ImageGenerationTaskModel>
        >
    with ImageGenerationNotifierRef {
  _ImageGenerationNotifierProviderElement(super.provider);

  @override
  String get prompt => (origin as ImageGenerationNotifierProvider).prompt;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
