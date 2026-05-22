/// 登录跳转信息实体
class AuthLoginUrl {
  /// 构造
  const AuthLoginUrl({required this.url, required this.state});

  /// 登录跳转链接
  final String url;

  /// 防重放状态值
  final String state;
}
