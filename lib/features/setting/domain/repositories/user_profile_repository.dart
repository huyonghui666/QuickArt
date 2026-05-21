import 'package:quick_art/features/setting/domain/entities/user_profile.dart';

/// 用户资料仓库抽象
abstract interface class IUserProfileRepository {
  /// 获取当前登录用户的资料
  Future<UserProfile> getUserProfile();
}
