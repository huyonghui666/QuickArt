/// 用户资料实体
class UserProfile {
  /// 构造
  const UserProfile({
    required this.userId,
    required this.nickname,
    required this.loginType,
    required this.createdAt,
    this.avatarUrl,
  });

  /// 用户 ID
  final String userId;

  /// 昵称
  final String nickname;

  /// 头像 URL（OSS 签名 URL 或 null）
  final String? avatarUrl;

  /// 登录类型
  final String loginType;

  /// 注册时间
  final String createdAt;
}
