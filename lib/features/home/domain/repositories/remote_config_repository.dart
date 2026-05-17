import 'package:quick_art/features/home/domain/entities/remote_art_style_config.dart';

/// 艺术风格配置仓库接口
abstract class RemoteArtStyleConfigRepository {
  /// 使用条件请求（If-None-Match）从后端获取艺术风格配置
  /// 版本未变时后端返回 304，此时返回 null
  Future<RemoteArtStyleConfig?> fetchArtStyleConfig({String? currentVersion});

  /// 从本地缓存加载配置
  Future<RemoteArtStyleConfig?> loadFromArtStyleCache();

  /// 保存配置到本地缓存
  Future<void> saveArtStyleConfig(RemoteArtStyleConfig config);
}
