import 'dart:convert';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:quick_art/features/home/data/models/art_style_model.dart';
import 'package:quick_art/features/home/data/models/remote_config_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class IArtStylesLocalDataSource {
  Future<RemoteConfigModel?> loadFromCache();
  Future<void> saveConfig(RemoteConfigModel config);

  // 热启动节流相关
  Future<DateTime?> getLastCheckTime();
  Future<void> saveLastCheckTime(DateTime time);
}

/// 使用 Hive 存储 styles，SharedPreferences 存储 version 和 last_check_time
class ArtStylesLocalDataSource implements IArtStylesLocalDataSource {
  static const String _prefsKeyVersion = 'config_version';
  static const String _prefsKeyLastCheck = 'last_check_time';
  static const String _hiveBoxName = 'art_styles_box';
  static const String _hiveKeyStyles = 'styles_json';

  @override
  Future<RemoteConfigModel?> loadFromCache() async {
    final prefs = await SharedPreferences.getInstance();
    final configVersion = prefs.getString(_prefsKeyVersion);

    if (configVersion == null) {
      return null;
    }

    try {
      // Lazy open box
      final box = await Hive.openBox(_hiveBoxName);
      final stylesJsonString = box.get(_hiveKeyStyles);

      if (stylesJsonString != null) {
        final List<dynamic> stylesList = jsonDecode(stylesJsonString);
        final styles = stylesList
            .map((e) => ArtStyleModel.fromJson(e as Map<String, dynamic>))
            .toList();

        return RemoteConfigModel(
          configVersion: configVersion,
          styles: styles,
        );
      }
    } catch (e) {
      print('Error parsing cached config from Hive: $e');
    }
    return null;
  }

  @override
  Future<void> saveConfig(RemoteConfigModel config) async {
    // 1. Save version to SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_prefsKeyVersion, config.configVersion);

    // 2. Save styles to Hive
    final box = await Hive.openBox(_hiveBoxName);
    // 序列化 styles 列表为 JSON 字符串存储
    // 虽然 Hive 支持 List，但直接存 JSON String 对于复杂对象有时更稳健且易于迁移
    // 或者可以直接存 List<Map>，这里选择存 JSON String 以保持与之前逻辑的一致性
    final stylesJsonString = jsonEncode(
      config.styles.map((e) => e.toJson()).toList(),
    );
    await box.put(_hiveKeyStyles, stylesJsonString);
  }

  @override
  Future<DateTime?> getLastCheckTime() async {
    final prefs = await SharedPreferences.getInstance();
    final timestamp = prefs.getInt(_prefsKeyLastCheck);
    if (timestamp != null) {
      return DateTime.fromMillisecondsSinceEpoch(timestamp);
    }
    return null;
  }

  @override
  Future<void> saveLastCheckTime(DateTime time) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_prefsKeyLastCheck, time.millisecondsSinceEpoch);
  }
}
