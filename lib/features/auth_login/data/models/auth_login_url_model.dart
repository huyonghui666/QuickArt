import 'package:quick_art/features/auth_login/domain/entities/auth_login_url.dart';

/// 登录跳转信息数据模型
class AuthLoginUrlModel {
  /// 构造
  const AuthLoginUrlModel({required this.url, required this.state});

  /// 从 JSON 解析
  factory AuthLoginUrlModel.fromJson(Map<String, dynamic> json) {
    return AuthLoginUrlModel(
      url: json['url'] as String? ?? '',
      state: json['state'] as String? ?? '',
    );
  }

  /// 登录跳转链接
  final String url;

  /// 防重放状态值
  final String state;

  /// 转为领域实体
  AuthLoginUrl toEntity() {
    return AuthLoginUrl(url: url, state: state);
  }
}
