import 'dart:async';

import 'package:quick_art/core/di/injection_container.dart';
import 'package:quick_art/features/setting/domain/entities/user_profile.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_profile_notifier.g.dart';

/// 用户资料状态管理
@riverpod
class UserProfileNotifier extends _$UserProfileNotifier {
  @override
  AsyncValue<UserProfile> build() {
    unawaited(
      ref
          .read(getUserProfileUseCaseProvider)
          .call()
          .then((value) {
            state = AsyncData(value);
          })
          .catchError((Object error, StackTrace stackTrace) {
            state = AsyncError(error, stackTrace);
          }),
    );
    return const AsyncLoading();
  }

  /// 刷新用户资料
  Future<void> refresh() async {
    state = const AsyncLoading();
    try {
      final profile = await ref.read(getUserProfileUseCaseProvider).call();
      state = AsyncData(profile);
    } on Exception catch (e, stack) {
      state = AsyncError(e, stack);
    }
  }
}
