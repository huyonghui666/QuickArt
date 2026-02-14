import 'package:freezed_annotation/freezed_annotation.dart';

part 'video_template.freezed.dart';

@freezed
/// 视频模板实体类
@freezed
abstract class VideoTemplate with _$VideoTemplate {
  /// 构造
  const factory VideoTemplate({
    /// 模板ID
    required String id,

    /// 模板名称（多语言支持）
    required Map<String, String> name,

    /// 封面图URL
    required String coverUrl,

    /// 视频URL
    required String videoUrl,

    /// 模板分类
    String? category,

    /// 模板描述
    String? description,
  }) = _VideoTemplate;
}
