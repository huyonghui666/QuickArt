import 'package:quick_art/features/auth_login/domain/repositories/auth_login_repository.dart';

/// 保存认证 JWT 用例
class SaveAuthJwtTokenUseCase {
  /// 构造
  const SaveAuthJwtTokenUseCase(this._repository);

  final IAuthLoginRepository _repository;

  /// 执行
  Future<void> call(String token) {
    return _repository.saveJwtToken(token);
  }
}
