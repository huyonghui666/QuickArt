import 'package:quick_art/features/auth_login/data/datasources/auth_login_local_data_source.dart';
import 'package:quick_art/features/setting/data/datasources/user_profile_remote_data_source.dart';
import 'package:quick_art/features/setting/domain/entities/user_profile.dart';
import 'package:quick_art/features/setting/domain/repositories/user_profile_repository.dart';

/// 用户资料仓库实现
class UserProfileRepositoryImpl implements IUserProfileRepository {
  /// 构造
  UserProfileRepositoryImpl(this._remoteDataSource, this._localDataSource);

  final IUserProfileRemoteDataSource _remoteDataSource;
  final IAuthLoginLocalDataSource _localDataSource;

  @override
  Future<UserProfile> getUserProfile() async {
    final token = await _localDataSource.getJwtToken();
    if (token == null || token.isEmpty) {
      throw Exception('未登录，无法获取用户资料');
    }
    final model = await _remoteDataSource.getUserProfile(token: token);
    return model.toEntity();
  }
}
