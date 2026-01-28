// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prompt_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$promptHash() => r'c73a2dc4a0224c3e7ac2683609e6efca46ae5eee';

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

abstract class _$Prompt extends BuildlessAutoDisposeNotifier<PromptState> {
  late final String id;

  PromptState build(String id);
}

/// See also [Prompt].
@ProviderFor(Prompt)
const promptProvider = PromptFamily();

/// See also [Prompt].
class PromptFamily extends Family<PromptState> {
  /// See also [Prompt].
  const PromptFamily();

  /// See also [Prompt].
  PromptProvider call(String id) {
    return PromptProvider(id);
  }

  @override
  PromptProvider getProviderOverride(covariant PromptProvider provider) {
    return call(provider.id);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'promptProvider';
}

/// See also [Prompt].
class PromptProvider
    extends AutoDisposeNotifierProviderImpl<Prompt, PromptState> {
  /// See also [Prompt].
  PromptProvider(String id)
    : this._internal(
        () => Prompt()..id = id,
        from: promptProvider,
        name: r'promptProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$promptHash,
        dependencies: PromptFamily._dependencies,
        allTransitiveDependencies: PromptFamily._allTransitiveDependencies,
        id: id,
      );

  PromptProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  PromptState runNotifierBuild(covariant Prompt notifier) {
    return notifier.build(id);
  }

  @override
  Override overrideWith(Prompt Function() create) {
    return ProviderOverride(
      origin: this,
      override: PromptProvider._internal(
        () => create()..id = id,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<Prompt, PromptState> createElement() {
    return _PromptProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PromptProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin PromptRef on AutoDisposeNotifierProviderRef<PromptState> {
  /// The parameter `id` of this provider.
  String get id;
}

class _PromptProviderElement
    extends AutoDisposeNotifierProviderElement<Prompt, PromptState>
    with PromptRef {
  _PromptProviderElement(super.provider);

  @override
  String get id => (origin as PromptProvider).id;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
