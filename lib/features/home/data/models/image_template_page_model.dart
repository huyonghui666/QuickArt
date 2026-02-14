import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quick_art/features/home/data/models/image_template_model.dart';
import 'package:quick_art/features/home/domain/entities/image_template_page.dart';

part 'image_template_page_model.freezed.dart';
part 'image_template_page_model.g.dart';

/// 图片模板
/// @param  content 图片模板的详情包含id、name（多语言标题）、imageUrl（大图签名url）、
/// thumbnailUrl（缩略图签名url）、category（模板分类）、description（多语言生成词描述）
/// @param number 目前页码 (0-indexed)
/// @param totalPages 总共页数
/// @param last 是否最后一页
@freezed
abstract class ImageTemplatePageModel with _$ImageTemplatePageModel {
  /// 构造
  const factory ImageTemplatePageModel({
    required List<ImageTemplateModel> content,
    required int number,
    required int totalPages,
    required bool last,
  }) = _ImageTemplatePageModel;
  const ImageTemplatePageModel._();

  /// 从 JSON 创建实例
  factory ImageTemplatePageModel.fromJson(Map<String, dynamic> json) =>
      _$ImageTemplatePageModelFromJson(json);

  /// 转换为实体
  ImageTemplatePage toEntity() {
    return ImageTemplatePage(
      items: content.map((e) => e.toEntity()).toList(),
      currentPage: number,
      totalPages: totalPages,
      hasMore: !last,
    );
  }
}
