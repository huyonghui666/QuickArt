import 'package:dio/dio.dart';
import 'package:quick_art/core/error/exception.dart';
import 'package:quick_art/features/auth_login/data/models/auth_login_url_model.dart';

/// 认证登录远程数据源抽象
abstract interface class IAuthLoginRemoteDataSource {
  /// 获取第三方登录跳转链接
  Future<AuthLoginUrlModel> getLoginUrl({required String type});
}

/// 认证登录远程数据源实现
class AuthLoginRemoteDataSource implements IAuthLoginRemoteDataSource {
  /// 构造
  AuthLoginRemoteDataSource(this._dio);

  final Dio _dio;

  @override
  Future<AuthLoginUrlModel> getLoginUrl({required String type}) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/auth/login-url',
        queryParameters: {'type': type},
      );

      if (response.statusCode != 200) {
        throw NetworkException('Get auth login url failed: ${response.data}');
      }

      final data = response.data;
      if (data == null) {
        throw DataException('Auth login url response is null');
      }

      return AuthLoginUrlModel.fromJson(data);
    } on DioException catch (e) {
      throw NetworkException.fromDioError(e);
    } catch (e) {
      throw UnknownException(e.toString());
    }
  }
}
