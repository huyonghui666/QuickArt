// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_config_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RemoteConfigModel _$RemoteConfigModelFromJson(Map<String, dynamic> json) =>
    _RemoteConfigModel(
      configVersion: json['configVersion'] as String,
      styles: (json['styles'] as List<dynamic>)
          .map((e) => ArtStyleModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RemoteConfigModelToJson(_RemoteConfigModel instance) =>
    <String, dynamic>{
      'configVersion': instance.configVersion,
      'styles': instance.styles,
    };
