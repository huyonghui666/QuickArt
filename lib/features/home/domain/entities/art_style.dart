import 'package:freezed_annotation/freezed_annotation.dart';

part 'art_style.freezed.dart';

/// 艺术风格个体
/// url 签名后的 URL (大图，WebP)
/// thumbnailUrl 签名后的缩略图 URL (小图，WebP)
/// isNew 是否是新风格
@freezed
abstract class ArtStyle with _$ArtStyle {
  /// 构造
  const factory ArtStyle({
    required String id,
    required String name,
    required String url,
    required String thumbnailUrl,
    required String md5,
    @Default(false) bool isNew,
    String? promptTemplate,
  }) = _ArtStyle;

  /// 无风格占位符，id 为空字符串，UI 层用 [isNoStyle] 判断
  static const ArtStyle noStyle = ArtStyle(
    id: '',
    name: '',
    url: '',
    thumbnailUrl: '',
    md5: '',
  );
}

/// [ArtStyle] 扩展方法
extension ArtStyleX on ArtStyle {
  /// 是否为"无风格"状态
  bool get isNoStyle => id.isEmpty;
}
