import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quick_art/features/tools/data/models/video_template_model.dart';
import 'package:quick_art/features/tools/domain/entities/video_template_page.dart';

part 'video_template_page_model.freezed.dart';
part 'video_template_page_model.g.dart';

@freezed
/// 视频模板分页数据模型（对应后端 API 分页响应）
@freezed
abstract class VideoTemplatePageModel with _$VideoTemplatePageModel {
  /// 构造
  const factory VideoTemplatePageModel({
    /// 模板列表数据
    required List<VideoTemplateModel> content,

    /// 总页数
    required int totalPages,

    /// 总元素数量
    required int totalElements,

    /// 是否是最后一页
    required bool last,

    /// 每页大小
    required int size,

    /// 当前页码
    required int number,
  }) = _VideoTemplatePageModel;
  const VideoTemplatePageModel._();

  /// 转换
  factory VideoTemplatePageModel.fromJson(Map<String, dynamic> json) =>
      _$VideoTemplatePageModelFromJson(json);

  /// 转换为领域实体
  VideoTemplatePage toEntity() {
    return VideoTemplatePage(
      items: content.map((e) => e.toEntity()).toList(),
      currentPage: number,
      totalPages: totalPages,
      hasMore: !last,
    );
  }
}
