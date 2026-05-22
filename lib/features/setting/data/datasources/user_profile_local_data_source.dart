import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

/// 用户资料本地缓存数据源抽象
abstract interface class IUserProfileLocalDataSource {
  /// 读取缓存的用户资料 JSON，无缓存返回 null
  Future<Map<String, dynamic>?> getCachedProfile();

  /// 写入用户资料缓存
  Future<void> cacheProfile(Map<String, dynamic> json);

  /// 清除用户资料缓存（登录时调用）
  Future<void> clearCache();
}

/// 用户资料本地缓存数据源实现
class UserProfileLocalDataSource implements IUserProfileLocalDataSource {
  static const String _key = 'user_profile_cache';

  @override
  Future<Map<String, dynamic>?> getCachedProfile() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_key);
    if (raw == null) return null;
    return jsonDecode(raw) as Map<String, dynamic>;
  }

  @override
  Future<void> cacheProfile(Map<String, dynamic> json) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, jsonEncode(json));
  }

  @override
  Future<void> clearCache() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }
}
