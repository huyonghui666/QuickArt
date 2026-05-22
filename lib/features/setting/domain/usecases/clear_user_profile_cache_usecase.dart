import 'package:quick_art/features/setting/domain/repositories/user_profile_repository.dart';

/// 清除用户资料缓存用例（登录时调用）
class ClearUserProfileCacheUseCase {
  /// 构造
  const ClearUserProfileCacheUseCase(this._repository);

  final IUserProfileRepository _repository;

  /// 执行
  Future<void> call() => _repository.clearCache();
}
