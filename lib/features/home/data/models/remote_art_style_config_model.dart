import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quick_art/features/home/data/models/art_style_model.dart';

part 'remote_art_style_config_model.freezed.dart';
part 'remote_art_style_config_model.g.dart';

/// 艺术风格配置响应 Model（数据层）
/// 字段名与后端 ArtStyleConfigResponse 完全一致
@freezed
abstract class RemoteArtStyleConfigModel with _$RemoteArtStyleConfigModel {
  /// 构造
  const factory RemoteArtStyleConfigModel({
    /// 全局配置版本号，单调递增整数字符串，用于 ETag 比较
    required String artStyleConfigVersion,
    required List<ArtStyleModel> styles,
  }) = _RemoteArtStyleConfigModel;

  /// 从 JSON 创建实例
  factory RemoteArtStyleConfigModel.fromJson(Map<String, dynamic> json) =>
      _$RemoteArtStyleConfigModelFromJson(json);
}
