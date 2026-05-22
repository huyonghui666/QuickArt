import 'package:quick_art/features/auth_login/data/datasources/auth_login_local_data_source.dart';
import 'package:quick_art/features/auth_login/data/datasources/auth_login_remote_data_source.dart';
import 'package:quick_art/features/auth_login/domain/entities/auth_login_url.dart';
import 'package:quick_art/features/auth_login/domain/repositories/auth_login_repository.dart';

/// 认证登录仓库实现
class AuthLoginRepositoryImpl implements IAuthLoginRepository {
  /// 构造
  AuthLoginRepositoryImpl(this._remoteDataSource, this._localDataSource);

  final IAuthLoginRemoteDataSource _remoteDataSource;
  final IAuthLoginLocalDataSource _localDataSource;

  @override
  Future<AuthLoginUrl> getLoginUrl({required String type}) async {
    final model = await _remoteDataSource.getLoginUrl(type: type);
    return model.toEntity();
  }

  @override
  Future<void> saveJwtToken(String token) {
    return _localDataSource.saveJwtToken(token);
  }

  @override
  Future<String?> getJwtToken() {
    return _localDataSource.getJwtToken();
  }

  @override
  Future<void> clearJwtToken() {
    return _localDataSource.clearJwtToken();
  }
}
