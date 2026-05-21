import 'package:dio/dio.dart';
import 'package:quick_art/core/error/exception.dart';
import 'package:quick_art/features/setting/data/models/user_profile_model.dart';

/// 用户资料远程数据源抽象
abstract interface class IUserProfileRemoteDataSource {
  /// 获取当前用户资料
  Future<UserProfileModel> getUserProfile({required String token});
}

/// 用户资料远程数据源实现
class UserProfileRemoteDataSource implements IUserProfileRemoteDataSource {
  /// 构造
  UserProfileRemoteDataSource(this._dio);

  final Dio _dio;

  @override
  Future<UserProfileModel> getUserProfile({required String token}) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/users/me',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      if (response.statusCode != 200) {
        throw NetworkException('Get user profile failed: ${response.data}');
      }

      final data = response.data;
      if (data == null) {
        throw DataException('User profile response is null');
      }

      return UserProfileModel.fromJson(data);
    } on DioException catch (e) {
      throw NetworkException.fromDioError(e);
    } catch (e) {
      throw UnknownException(e.toString());
    }
  }
}
