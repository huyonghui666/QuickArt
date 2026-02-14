import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quick_art/features/tools/domain/entities/video_template.dart';

part 'video_template_model.freezed.dart';
part 'video_template_model.g.dart';

@freezed
/// 视频模板数据模型（对应后端 API 响应）
@freezed
abstract class VideoTemplateModel with _$VideoTemplateModel {
  /// 构造
  const factory VideoTemplateModel({
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
  }) = _VideoTemplateModel;
  const VideoTemplateModel._();

  /// 转换
  factory VideoTemplateModel.fromJson(Map<String, dynamic> json) =>
      _$VideoTemplateModelFromJson(json);

  /// 转换为领域实体
  VideoTemplate toEntity() {
    return VideoTemplate(
      id: id,
      name: name,
      coverUrl: coverUrl,
      videoUrl: videoUrl,
      category: category,
      description: description,
    );
  }
}
