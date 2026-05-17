// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'art_style_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ArtStyleModel _$ArtStyleModelFromJson(Map<String, dynamic> json) =>
    _ArtStyleModel(
      id: json['id'] as String,
      name: json['name'] as String,
      url: json['url'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
      md5: json['md5'] as String,
      isNew: json['isNew'] as bool? ?? false,
      promptTemplate: json['promptTemplate'] as String?,
    );

Map<String, dynamic> _$ArtStyleModelToJson(_ArtStyleModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'url': instance.url,
      'thumbnailUrl': instance.thumbnailUrl,
      'md5': instance.md5,
      'isNew': instance.isNew,
      'promptTemplate': instance.promptTemplate,
    };
