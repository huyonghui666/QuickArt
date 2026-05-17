import 'package:quick_art/features/home/data/datasources/Remote_data_source/art_styles_remote_data_source.dart';
import 'package:quick_art/features/home/data/datasources/local_data_source/art_styles_local_data_source.dart';
import 'package:quick_art/features/home/data/models/art_style_model.dart';
import 'package:quick_art/features/home/data/models/remote_art_style_config_model.dart';
import 'package:quick_art/features/home/domain/entities/art_style.dart';
import 'package:quick_art/features/home/domain/entities/remote_art_style_config.dart';
import 'package:quick_art/features/home/domain/repositories/remote_config_repository.dart';

/// 艺术风格配置仓库实现
class RemoteArtStyleConfigRepositoryImpl
    implements RemoteArtStyleConfigRepository {
  /// 构造
  RemoteArtStyleConfigRepositoryImpl(
    this._localDataSource,
    this._remoteDataSource,
  );
  final IArtStylesLocalDataSource _localDataSource;
  final IArtStylesRemoteDataSource _remoteDataSource;

  @override
  Future<RemoteArtStyleConfig?> fetchArtStyleConfig({
    String? currentVersion,
  }) async {
    final remoteModel = await _remoteDataSource.fetchArtStyleConfig(
      currentVersion: currentVersion,
    );
    if (remoteModel != null) {
      return _mapToEntity(remoteModel);
    }
    return null;
  }

  @override
  Future<RemoteArtStyleConfig?> loadFromArtStyleCache() async {
    final localModel = await _localDataSource.loadFromArtStyleCache();
    if (localModel != null) {
      return _mapToEntity(localModel);
    }
    return null;
  }

  @override
  Future<void> saveArtStyleConfig(RemoteArtStyleConfig config) async {
    await _localDataSource.saveArtStyleConfig(_mapToModel(config));
  }

  RemoteArtStyleConfig _mapToEntity(RemoteArtStyleConfigModel model) {
    return RemoteArtStyleConfig(
      artStyleConfigVersion: model.artStyleConfigVersion,
      styles: model.styles
          .map(
            (e) => ArtStyle(
              id: e.id,
              name: e.name,
              url: e.url,
              thumbnailUrl: e.thumbnailUrl,
              md5: e.md5,
              isNew: e.isNew,
              promptTemplate: e.promptTemplate,
            ),
          )
          .toList(),
    );
  }

  RemoteArtStyleConfigModel _mapToModel(RemoteArtStyleConfig entity) {
    return RemoteArtStyleConfigModel(
      artStyleConfigVersion: entity.artStyleConfigVersion,
      styles: entity.styles
          .map(
            (e) => ArtStyleModel(
              id: e.id,
              name: e.name,
              url: e.url,
              thumbnailUrl: e.thumbnailUrl,
              md5: e.md5,
              isNew: e.isNew,
              promptTemplate: e.promptTemplate,
            ),
          )
          .toList(),
    );
  }
}
