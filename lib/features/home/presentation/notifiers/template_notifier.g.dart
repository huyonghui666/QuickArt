// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'template_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$templatesHash() => r'c1acb06d03cf29f5d466ede5318be641e26eee51';

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

abstract class _$Templates
    extends BuildlessAutoDisposeAsyncNotifier<ImageTemplatePage> {
  late final String? category;

  FutureOr<ImageTemplatePage> build({String? category});
}

/// See also [Templates].
@ProviderFor(Templates)
const templatesProvider = TemplatesFamily();

/// See also [Templates].
class TemplatesFamily extends Family<AsyncValue<ImageTemplatePage>> {
  /// See also [Templates].
  const TemplatesFamily();

  /// See also [Templates].
  TemplatesProvider call({String? category}) {
    return TemplatesProvider(category: category);
  }

  @override
  TemplatesProvider getProviderOverride(covariant TemplatesProvider provider) {
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
  String? get name => r'templatesProvider';
}

/// See also [Templates].
class TemplatesProvider
    extends AutoDisposeAsyncNotifierProviderImpl<Templates, ImageTemplatePage> {
  /// See also [Templates].
  TemplatesProvider({String? category})
    : this._internal(
        () => Templates()..category = category,
        from: templatesProvider,
        name: r'templatesProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$templatesHash,
        dependencies: TemplatesFamily._dependencies,
        allTransitiveDependencies: TemplatesFamily._allTransitiveDependencies,
        category: category,
      );

  TemplatesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.category,
  }) : super.internal();

  final String? category;

  @override
  FutureOr<ImageTemplatePage> runNotifierBuild(covariant Templates notifier) {
    return notifier.build(category: category);
  }

  @override
  Override overrideWith(Templates Function() create) {
    return ProviderOverride(
      origin: this,
      override: TemplatesProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<Templates, ImageTemplatePage>
  createElement() {
    return _TemplatesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TemplatesProvider && other.category == category;
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
mixin TemplatesRef on AutoDisposeAsyncNotifierProviderRef<ImageTemplatePage> {
  /// The parameter `category` of this provider.
  String? get category;
}

class _TemplatesProviderElement
    extends
        AutoDisposeAsyncNotifierProviderElement<Templates, ImageTemplatePage>
    with TemplatesRef {
  _TemplatesProviderElement(super.provider);

  @override
  String? get category => (origin as TemplatesProvider).category;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
