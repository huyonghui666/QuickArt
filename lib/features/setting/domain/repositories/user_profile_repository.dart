import 'package:quick_art/features/setting/domain/entities/user_profile.dart';

/// 用户资料仓库抽象
abstract interface class IUserProfileRepository {
  /// 获取当前登录用户的资料（优先读本地缓存）
  Future<UserProfile> getUserProfile();

  /// 清除本地缓存（登录时调用，确保下次重新拉取）
  Future<void> clearCache();
}
