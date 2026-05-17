import 'package:freezed_annotation/freezed_annotation.dart';

part 'art_style_model.freezed.dart';
part 'art_style_model.g.dart';

/// 艺术风格数据模型（数据层）
@freezed
abstract class ArtStyleModel with _$ArtStyleModel {
  /// 构造
  const factory ArtStyleModel({
    required String id,
    required String name,

    /// 背景大图 URL
    required String url,
    required String thumbnailUrl,
    required String md5,
    @Default(false) bool isNew,
    String? promptTemplate,
  }) = _ArtStyleModel;

  /// 从 JSON 构造
  factory ArtStyleModel.fromJson(Map<String, dynamic> json) =>
      _$ArtStyleModelFromJson(json);
}
