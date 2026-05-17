import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:quick_art/core/error/exception.dart';
import 'package:quick_art/features/home/data/models/remote_art_style_config_model.dart';

/// 艺术风格远程数据源接口
abstract class IArtStylesRemoteDataSource {
  /// 获取艺术风格配置。
  /// 传入 [currentVersion] 时，请求头携带 If-None-Match，
  /// 后端版本未变则返回 304，此时返回 null（客户端继续使用缓存）。
  Future<RemoteArtStyleConfigModel?> fetchArtStyleConfig({
    String? currentVersion,
  });
}

/// 艺术风格远程数据源实现
class ArtStylesRemoteDataSource implements IArtStylesRemoteDataSource {
  /// 构造函数
  ArtStylesRemoteDataSource(this._dio);

  final Dio _dio;
  final _logger = Logger();

  @override
  Future<RemoteArtStyleConfigModel?> fetchArtStyleConfig(
      {String? currentVersion}) async {
    try {
      final options = Options(
        headers: currentVersion != null
            ? {'If-None-Match': currentVersion}
            : null,
        // 200 和 304 都视为正常响应，不抛 DioException
        validateStatus: (status) =>
            status != null && (status == 200 || status == 304),
      );

      final response = await _dio.get<Map<String, dynamic>>(
        '/art-styles',
        options: options,
      );

      // 304：版本未变，客户端继续使用缓存
      if (response.statusCode == 304) {
        return null;
      }

      final data = response.data;
      if (data == null) {
        throw DataException('No content');
      }

      return RemoteArtStyleConfigModel.fromJson(data);
    } on Exception catch (e) {
      _logger.e('获取远程艺术风格配置失败', error: e);
    }
    return null;
  }
}
