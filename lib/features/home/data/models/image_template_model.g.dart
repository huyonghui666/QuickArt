// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_template_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ImageTemplateModel _$ImageTemplateModelFromJson(Map<String, dynamic> json) =>
    _ImageTemplateModel(
      id: json['id'] as String,
      name: Map<String, String>.from(json['name'] as Map),
      imageUrl: json['imageUrl'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String?,
      category: json['category'] as String?,
      description: (json['description'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
    );

Map<String, dynamic> _$ImageTemplateModelToJson(_ImageTemplateModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'thumbnailUrl': instance.thumbnailUrl,
      'category': instance.category,
      'description': instance.description,
    };
