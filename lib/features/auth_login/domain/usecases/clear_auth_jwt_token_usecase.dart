import 'package:quick_art/features/auth_login/domain/repositories/auth_login_repository.dart';

/// 清除认证 JWT 用例
class ClearAuthJwtTokenUseCase {
  /// 构造
  const ClearAuthJwtTokenUseCase(this._repository);

  final IAuthLoginRepository _repository;

  /// 执行
  Future<void> call() {
    return _repository.clearJwtToken();
  }
}
