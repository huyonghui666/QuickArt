import 'package:shared_preferences/shared_preferences.dart';

/// 认证登录本地数据源抽象
abstract interface class IAuthLoginLocalDataSource {
  /// 保存 JWT
  Future<void> saveJwtToken(String token);

  /// 读取 JWT
  Future<String?> getJwtToken();

  /// 清除 JWT
  Future<void> clearJwtToken();
}

/// 认证登录本地数据源实现
class AuthLoginLocalDataSource implements IAuthLoginLocalDataSource {
  static const String _jwtTokenKey = 'auth_jwt_token';

  @override
  Future<void> saveJwtToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_jwtTokenKey, token);
  }

  @override
  Future<String?> getJwtToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_jwtTokenKey);
  }

  @override
  Future<void> clearJwtToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_jwtTokenKey);
  }
}
