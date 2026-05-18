// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_art_style_config_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$remoteArtStyleConfigNotifierHash() =>
    r'85562a51065b54bcf51e36dab78764eddcddee42';

/// 艺术风格配置 Provider
///
/// build() 只在冷启动（provider 首次创建）时执行一次，天然满足"只在冷启动检查版本"的需求。
/// 热启动（App 从后台切回）不会重新执行 build()，无需额外节流逻辑。
///
/// Copied from [RemoteArtStyleConfigNotifier].
@ProviderFor(RemoteArtStyleConfigNotifier)
final remoteArtStyleConfigNotifierProvider =
    AutoDisposeAsyncNotifierProvider<
      RemoteArtStyleConfigNotifier,
      RemoteArtStyleConfig?
    >.internal(
      RemoteArtStyleConfigNotifier.new,
      name: r'remoteArtStyleConfigNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$remoteArtStyleConfigNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$RemoteArtStyleConfigNotifier =
    AutoDisposeAsyncNotifier<RemoteArtStyleConfig?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
