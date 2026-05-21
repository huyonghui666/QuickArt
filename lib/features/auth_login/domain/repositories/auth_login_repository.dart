import 'package:quick_art/features/auth_login/domain/entities/auth_login_url.dart';

/// 认证登录仓库抽象
abstract interface class IAuthLoginRepository {
  /// 获取第三方登录跳转信息
  Future<AuthLoginUrl> getLoginUrl({required String type});

  /// 保存 JWT
  Future<void> saveJwtToken(String token);

  /// 读取 JWT
  Future<String?> getJwtToken();

  /// 清除 JWT
  Future<void> clearJwtToken();
}
