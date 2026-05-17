// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_art_style_config_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RemoteArtStyleConfigModel _$RemoteArtStyleConfigModelFromJson(
  Map<String, dynamic> json,
) => _RemoteArtStyleConfigModel(
  artStyleConfigVersion: json['artStyleConfigVersion'] as String,
  styles: (json['styles'] as List<dynamic>)
      .map((e) => ArtStyleModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$RemoteArtStyleConfigModelToJson(
  _RemoteArtStyleConfigModel instance,
) => <String, dynamic>{
  'artStyleConfigVersion': instance.artStyleConfigVersion,
  'styles': instance.styles,
};
