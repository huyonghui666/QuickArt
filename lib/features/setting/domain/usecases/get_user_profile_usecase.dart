import 'package:quick_art/features/setting/domain/entities/user_profile.dart';
import 'package:quick_art/features/setting/domain/repositories/user_profile_repository.dart';

/// 获取用户资料用例
class GetUserProfileUseCase {
  /// 构造
  const GetUserProfileUseCase(this._repository);

  final IUserProfileRepository _repository;

  /// 执行
  Future<UserProfile> call() => _repository.getUserProfile();
}
