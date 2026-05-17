// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'art_style_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$artStyleNotifierHash() => r'1d053b649c8257a7235d8a7e6669673b774cb617';

/// 当前选中的艺术风格状态管理
///
/// 方案 B：风格列表完全由服务端驱动，不再使用本地枚举。
/// 默认值为 [ArtStyle.noStyle]（id 为空字符串），表示未选中任何风格。
/// 通过 [ArtStyleX.isNoStyle] 判断是否处于无风格状态。
///
/// Copied from [ArtStyleNotifier].
@ProviderFor(ArtStyleNotifier)
final artStyleNotifierProvider =
    AutoDisposeNotifierProvider<ArtStyleNotifier, ArtStyle>.internal(
      ArtStyleNotifier.new,
      name: r'artStyleNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$artStyleNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$ArtStyleNotifier = AutoDisposeNotifier<ArtStyle>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
