import 'package:dio/dio.dart';
import 'package:quick_art/core/error/exception.dart';
import 'package:quick_art/features/home/data/models/remote_config_model.dart';

/// 艺术风格远程数据源接口
abstract class IArtStylesRemoteDataSource {
  /// 获取艺术风格，传入当前版本号，Header 带上 If-None-Match: "v1.0.0"，如果configVersion版本没变，
  /// 后端直接返回 304（不返回 Body）。App 收到 304 后，直接停止后续逻辑，连解析 JSON 的 CPU 消耗都省了
  Future<RemoteConfigModel?> fetchArtStyles({String? currentVersion});
}

/// 艺术风格远程数据源实现
class ArtStylesRemoteDataSource implements IArtStylesRemoteDataSource {
  /// 构造函数
  ArtStylesRemoteDataSource(this._dio);

  final Dio _dio;

  @override
  Future<RemoteConfigModel?> fetchArtStyles({String? currentVersion}) async {
    try {
      final options = Options(
        headers: currentVersion != null
            ? {'If-None-Match': currentVersion}
            : null,
        validateStatus: (status) {
          return status != null && (status == 200 || status == 304);
        },
      );

      final response = await _dio.get<Map<String, dynamic>>(
        '/art-styles',
        options: options,
      );

      if (response.statusCode == 304) {
        return null;
      }

      final data = response.data;
      //
      if (data == null ) {
        throw DataException('No content');
      }

      if (response.statusCode == 200) {
        return RemoteConfigModel.fromJson(data);
      }
    } catch (e) {
      print('Error fetching remote config: $e');
    }
    return null;
  }
}
