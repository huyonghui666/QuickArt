// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_template_page_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VideoTemplatePageModel _$VideoTemplatePageModelFromJson(
  Map<String, dynamic> json,
) => _VideoTemplatePageModel(
  content: (json['content'] as List<dynamic>)
      .map((e) => VideoTemplateModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  totalPages: (json['totalPages'] as num).toInt(),
  totalElements: (json['totalElements'] as num).toInt(),
  last: json['last'] as bool,
  size: (json['size'] as num).toInt(),
  number: (json['number'] as num).toInt(),
);

Map<String, dynamic> _$VideoTemplatePageModelToJson(
  _VideoTemplatePageModel instance,
) => <String, dynamic>{
  'content': instance.content,
  'totalPages': instance.totalPages,
  'totalElements': instance.totalElements,
  'last': instance.last,
  'size': instance.size,
  'number': instance.number,
};
