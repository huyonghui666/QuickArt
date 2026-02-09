// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_template_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VideoTemplateModelImpl _$$VideoTemplateModelImplFromJson(
  Map<String, dynamic> json,
) => _$VideoTemplateModelImpl(
  id: json['id'] as String,
  name: Map<String, String>.from(json['name'] as Map),
  coverUrl: json['coverUrl'] as String,
  videoUrl: json['videoUrl'] as String,
  category: json['category'] as String?,
  description: json['description'] as String?,
);

Map<String, dynamic> _$$VideoTemplateModelImplToJson(
  _$VideoTemplateModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'coverUrl': instance.coverUrl,
  'videoUrl': instance.videoUrl,
  'category': instance.category,
  'description': instance.description,
};
