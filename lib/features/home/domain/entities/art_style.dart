import 'package:freezed_annotation/freezed_annotation.dart';

part 'art_style.freezed.dart';

@freezed
abstract class ArtStyle with _$ArtStyle {
  /// 构造
  const factory ArtStyle({
    required String id,
    required String name,
    required String url, // Background image
    required String thumbnailUrl,
    required String md5,
    @Default(false) bool isNew,
    String? promptTemplate,
  }) = _ArtStyle;
}
