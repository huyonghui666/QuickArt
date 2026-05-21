// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userProfileNotifierHash() =>
    r'12bd0839a0b185e3112ba97681038d31032469be';

/// 用户资料状态管理
///
/// Copied from [UserProfileNotifier].
@ProviderFor(UserProfileNotifier)
final userProfileNotifierProvider =
    AutoDisposeNotifierProvider<
      UserProfileNotifier,
      AsyncValue<UserProfile>
    >.internal(
      UserProfileNotifier.new,
      name: r'userProfileNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$userProfileNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$UserProfileNotifier = AutoDisposeNotifier<AsyncValue<UserProfile>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
