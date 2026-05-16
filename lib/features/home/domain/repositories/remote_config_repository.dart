import 'package:quick_art/features/home/domain/entities/remote_config.dart';

abstract class RemoteConfigRepository {
  /// Fetch config from backend with conditional request (If-None-Match)
  Future<RemoteConfig?> fetchConfig({String? currentVersion});

  /// Load config from local storage
  Future<RemoteConfig?> loadFromCache();

  /// Save config to local storage
  Future<void> saveConfig(RemoteConfig config);

  /// Get last check timestamp
  Future<DateTime?> getLastCheckTime();

  /// Save last check timestamp
  Future<void> saveLastCheckTime(DateTime time);
}
