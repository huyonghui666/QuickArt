import 'package:quick_art/features/home/data/datasources/local_data_source/art_styles_local_data_source.dart';
import 'package:quick_art/features/home/data/datasources/Remote_data_source/art_styles_remote_data_source.dart';
import 'package:quick_art/features/home/data/models/art_style_model.dart';
import 'package:quick_art/features/home/data/models/remote_config_model.dart';
import 'package:quick_art/features/home/domain/entities/art_style.dart';
import 'package:quick_art/features/home/domain/entities/remote_config.dart';
import 'package:quick_art/features/home/domain/repositories/remote_config_repository.dart';

class RemoteConfigRepositoryImpl implements RemoteConfigRepository {
  final IArtStylesLocalDataSource _localDataSource;
  final IArtStylesRemoteDataSource _remoteDataSource;

  RemoteConfigRepositoryImpl(this._localDataSource, this._remoteDataSource);

  @override
  Future<RemoteConfig?> fetchConfig({String? currentVersion}) async {
    final remoteModel = await _remoteDataSource.fetchArtStyles(
      currentVersion: currentVersion,
    );
    if (remoteModel != null) {
      return _mapToEntity(remoteModel);
    }
    return null;
  }

  @override
  Future<RemoteConfig?> loadFromCache() async {
    final localModel = await _localDataSource.loadFromCache();
    if (localModel != null) {
      return _mapToEntity(localModel);
    }
    return null;
  }

  @override
  Future<void> saveConfig(RemoteConfig config) async {
    await _localDataSource.saveConfig(_mapToModel(config));
  }

  @override
  Future<DateTime?> getLastCheckTime() async {
    return _localDataSource.getLastCheckTime();
  }

  @override
  Future<void> saveLastCheckTime(DateTime time) async {
    return _localDataSource.saveLastCheckTime(time);
  }

  RemoteConfig _mapToEntity(RemoteConfigModel model) {
    return RemoteConfig(
      configVersion: model.configVersion,
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

  RemoteConfigModel _mapToModel(RemoteConfig entity) {
    return RemoteConfigModel(
      configVersion: entity.configVersion,
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
