import 'dart:convert';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:logger/logger.dart';
import 'package:quick_art/features/home/data/models/art_style_model.dart';
import 'package:quick_art/features/home/data/models/remote_art_style_config_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// 艺术风格本地数据源接口
abstract class IArtStylesLocalDataSource {
  /// 从艺术风格本地缓存加载配置
  Future<RemoteArtStyleConfigModel?> loadFromArtStyleCache();

  /// 将配置保存到本地缓存
  Future<void> saveArtStyleConfig(RemoteArtStyleConfigModel config);
}

/// 使用 Hive 存储 styles，SharedPreferences 存储版本号
class ArtStylesLocalDataSource implements IArtStylesLocalDataSource {
  static const String _prefsKeyArtStyleVersion = 'art_style_config_version';
  static const String _hiveBoxName = 'art_styles_box';
  static const String _hiveKeyStyles = 'styles_json';

  final _logger = Logger();

  @override
  Future<RemoteArtStyleConfigModel?> loadFromArtStyleCache() async {
    final prefs = await SharedPreferences.getInstance();
    final artStyleConfigVersion = prefs.getString(_prefsKeyArtStyleVersion);

    if (artStyleConfigVersion == null) {
      return null;
    }

    try {
      // 懒加载 Hive box
      final box = await Hive.openBox<dynamic>(_hiveBoxName);
      final stylesJsonString = box.get(_hiveKeyStyles) as String?;

      if (stylesJsonString != null) {
        final stylesList = jsonDecode(stylesJsonString) as List<dynamic>;
        final styles = stylesList
            .map((e) => ArtStyleModel.fromJson(e as Map<String, dynamic>))
            .toList();

        return RemoteArtStyleConfigModel(
          artStyleConfigVersion: artStyleConfigVersion,
          styles: styles,
        );
      }
    } on Exception catch (e) {
      _logger.e('读取本地艺术风格缓存失败', error: e);
    }
    return null;
  }

  @override
  Future<void> saveArtStyleConfig(RemoteArtStyleConfigModel config) async {
    // 1. 版本号存入 SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      _prefsKeyArtStyleVersion,
      config.artStyleConfigVersion,
    );

    // 2. 风格列表序列化为 JSON 字符串存入 Hive
    // 直接存 JSON String 对复杂对象更稳健，便于后续迁移
    final box = await Hive.openBox<dynamic>(_hiveBoxName);
    final stylesJsonString = jsonEncode(
      config.styles.map((e) => e.toJson()).toList(),
    );
    await box.put(_hiveKeyStyles, stylesJsonString);
  }
}
