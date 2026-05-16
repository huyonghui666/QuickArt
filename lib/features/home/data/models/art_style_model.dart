import 'package:freezed_annotation/freezed_annotation.dart';

part 'art_style_model.freezed.dart';
part 'art_style_model.g.dart';

@freezed
abstract class ArtStyleModel with _$ArtStyleModel {
  const factory ArtStyleModel({
    required String id,
    required String name,
    required String url, // Background image
    required String thumbnailUrl,
    required String md5,
    @Default(false) bool isNew,
    String? promptTemplate,
  }) = _ArtStyleModel;

  factory ArtStyleModel.fromJson(Map<String, dynamic> json) =>
      _$ArtStyleModelFromJson(json);
}
