import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quick_art/features/home/domain/entities/image_template.dart';

part 'image_template_page.freezed.dart';

/// @param  content 图片模板的详情包含id、name（多语言标题）、imageUrl（大图签名url）、
/// thumbnailUrl（缩略图签名url）、category（模板分类）、description（多语言生成词描述）
/// @param currentPage 目前页码 (0-indexed)
/// @param totalPages 总共页数
/// @param hasMore 判断是否有下一页
@freezed
abstract class ImageTemplatePage with _$ImageTemplatePage {

  ///构造
  const factory ImageTemplatePage({
    required List<ImageTemplate> items,
    required int currentPage,
    required int totalPages,
    required bool hasMore,
  }) = _ImageTemplatePage;
  const ImageTemplatePage._();

  /// 是否为空
  bool get isEmpty => items.isEmpty;

  /// 是否为第一页
  bool get isFirstPage => currentPage == 0;

  /// 计算下一页页码
  int get nextPage => currentPage + 1;
}
