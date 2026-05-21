import 'package:quick_art/features/auth_login/domain/entities/auth_login_url.dart';
import 'package:quick_art/features/auth_login/domain/repositories/auth_login_repository.dart';

/// 获取认证登录跳转链接用例
class GetAuthLoginUrlUseCase {
  /// 构造
  const GetAuthLoginUrlUseCase(this._repository);

  final IAuthLoginRepository _repository;

  /// 执行
  Future<AuthLoginUrl> call({required String type}) {
    return _repository.getLoginUrl(type: type);
  }
}
