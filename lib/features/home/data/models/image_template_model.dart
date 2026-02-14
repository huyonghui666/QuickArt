import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quick_art/features/home/domain/entities/image_template.dart';

part 'image_template_model.freezed.dart';
part 'image_template_model.g.dart';

/// 图片模板包的一个图片信息模型
@freezed
abstract class ImageTemplateModel with _$ImageTemplateModel {
  /// 构造
  const factory ImageTemplateModel({
    required String id,
    required Map<String, String> name,
    required String imageUrl,
    String? thumbnailUrl,
    String? category,
    Map<String, String>? description,
  }) = _ImageTemplateModel;
  const ImageTemplateModel._();

  /// 从 JSON 创建实例
  factory ImageTemplateModel.fromJson(Map<String, dynamic> json) =>
      _$ImageTemplateModelFromJson(json);

  /// 转换为实体
  ImageTemplate toEntity() {
    return ImageTemplate(
      id: id,
      name: name,
      imageUrl: imageUrl,
      thumbnailUrl: thumbnailUrl,
      category: category,
      description: description,
    );
  }
}
