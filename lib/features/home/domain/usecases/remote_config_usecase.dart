import 'package:quick_art/features/home/domain/entities/remote_art_style_config.dart';
import 'package:quick_art/features/home/domain/repositories/remote_config_repository.dart';

/// 艺术风格远程配置聚合用例
///
/// 将读取缓存、远程拉取、持久化收敛到一个用例中。
class RemoteArtStyleConfigUseCase {
  /// 构造函数
  RemoteArtStyleConfigUseCase(this._repository);

  final RemoteArtStyleConfigRepository _repository;

  /// 读取艺术风格本地缓存
  Future<RemoteArtStyleConfig?> loadFromArtStyleCache() {
    return _repository.loadFromArtStyleCache();
  }

  /// 拉取艺术风格远程配置（带 If-None-Match，304 时返回 null）
  Future<RemoteArtStyleConfig?> fetchArtStyleConfig({String? currentVersion}) {
    return _repository.fetchArtStyleConfig(currentVersion: currentVersion);
  }

  /// 保存艺术风格配置到本地
  Future<void> saveArtStyleConfig(RemoteArtStyleConfig config) {
    return _repository.saveArtStyleConfig(config);
  }
}
