// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_template_page_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VideoTemplatePageModelImpl _$$VideoTemplatePageModelImplFromJson(
  Map<String, dynamic> json,
) => _$VideoTemplatePageModelImpl(
  content: (json['content'] as List<dynamic>)
      .map((e) => VideoTemplateModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  totalPages: (json['totalPages'] as num).toInt(),
  totalElements: (json['totalElements'] as num).toInt(),
  last: json['last'] as bool,
  size: (json['size'] as num).toInt(),
  number: (json['number'] as num).toInt(),
);

Map<String, dynamic> _$$VideoTemplatePageModelImplToJson(
  _$VideoTemplatePageModelImpl instance,
) => <String, dynamic>{
  'content': instance.content,
  'totalPages': instance.totalPages,
  'totalElements': instance.totalElements,
  'last': instance.last,
  'size': instance.size,
  'number': instance.number,
};
