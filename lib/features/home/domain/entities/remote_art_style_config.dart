import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quick_art/features/home/domain/entities/art_style.dart';

part 'remote_art_style_config.freezed.dart';

/// 艺术风格配置实体（领域层）
@freezed
abstract class RemoteArtStyleConfig with _$RemoteArtStyleConfig {
  /// 构造
  const factory RemoteArtStyleConfig({
    /// 全局配置版本号，单调递增整数字符串，用于 ETag 比较
    required String artStyleConfigVersion,
    required List<ArtStyle> styles,
  }) = _RemoteArtStyleConfig;
}
