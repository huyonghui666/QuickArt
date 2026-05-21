import 'package:quick_art/features/auth_login/domain/repositories/auth_login_repository.dart';

/// 获取认证 JWT 用例
class GetAuthJwtTokenUseCase {
  /// 构造
  const GetAuthJwtTokenUseCase(this._repository);

  final IAuthLoginRepository _repository;

  /// 执行
  Future<String?> call() {
    return _repository.getJwtToken();
  }
}
