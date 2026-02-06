import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quick_art/features/home/domain/entities/image_template.dart';

part 'image_template_model.freezed.dart';
part 'image_template_model.g.dart';

@freezed
class ImageTemplateModel with _$ImageTemplateModel {
  const ImageTemplateModel._();

  const factory ImageTemplateModel({
    required String id,
    required Map<String, String> name,
    required String imageUrl,
    String? thumbnailUrl,
    String? category,
    Map<String, String>? description,
  }) = _ImageTemplateModel;

  factory ImageTemplateModel.fromJson(Map<String, dynamic> json) =>
      _$ImageTemplateModelFromJson(json);

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
