// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_template_page_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ImageTemplatePageModel _$ImageTemplatePageModelFromJson(
  Map<String, dynamic> json,
) => _ImageTemplatePageModel(
  content: (json['content'] as List<dynamic>)
      .map((e) => ImageTemplateModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  number: (json['number'] as num).toInt(),
  totalPages: (json['totalPages'] as num).toInt(),
  last: json['last'] as bool,
);

Map<String, dynamic> _$ImageTemplatePageModelToJson(
  _ImageTemplatePageModel instance,
) => <String, dynamic>{
  'content': instance.content,
  'number': instance.number,
  'totalPages': instance.totalPages,
  'last': instance.last,
};
