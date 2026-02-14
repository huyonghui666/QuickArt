import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quick_art/features/tools/domain/entities/video_template.dart';

part 'video_template_page.freezed.dart';

@freezed
/// 视频模板分页实体类@freezed
abstract class VideoTemplatePage with _$VideoTemplatePage {
  /// 构造
  const factory VideoTemplatePage({
    /// 模板列表
    required List<VideoTemplate> items,

    /// 当前页码
    required int currentPage,

    /// 总页数
    required int totalPages,

    /// 是否有下一页数据
    required bool hasMore,
  }) = _VideoTemplatePage;
}
