import 'package:quick_art/features/setting/domain/entities/user_profile.dart';

/// 用户资料数据模型
class UserProfileModel {
  /// 构造
  const UserProfileModel({
    required this.userId,
    required this.nickname,
    required this.loginType,
    required this.createdAt,
    required this.pointsBalance,
    this.avatarUrl,
  });

  /// 从 JSON 解析
  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      userId: json['userId'] as String? ?? '',
      nickname: json['nickname'] as String? ?? '',
      avatarUrl: json['avatarUrl'] as String?,
      loginType: json['loginType'] as String? ?? '',
      createdAt: json['createdAt'] as String? ?? '',
      pointsBalance: json['pointsBalance'] as int? ?? 0,
    );
  }

  /// 用户 ID
  final String userId;

  /// 昵称
  final String nickname;

  /// 头像 URL
  final String? avatarUrl;

  /// 登录类型
  final String loginType;

  /// 注册时间
  final String createdAt;

  /// 积分余额
  final int pointsBalance;

  /// 转为领域实体
  UserProfile toEntity() {
    return UserProfile(
      userId: userId,
      nickname: nickname,
      avatarUrl: avatarUrl,
      loginType: loginType,
      createdAt: createdAt,
      pointsBalance: pointsBalance,
    );
  }
}
