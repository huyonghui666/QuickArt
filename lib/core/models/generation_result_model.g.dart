// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generation_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GenerationResultModelImpl _$$GenerationResultModelImplFromJson(
  Map<String, dynamic> json,
) => _$GenerationResultModelImpl(
  taskId: json['taskId'] as String,
  event: json['event'] as String,
  type: json['type'] as String?,
  url: json['url'] as String?,
  thumbnailUrl: json['thumbnailUrl'] as String?,
  error: json['error'] as String?,
);

Map<String, dynamic> _$$GenerationResultModelImplToJson(
  _$GenerationResultModelImpl instance,
) => <String, dynamic>{
  'taskId': instance.taskId,
  'event': instance.event,
  'type': instance.type,
  'url': instance.url,
  'thumbnailUrl': instance.thumbnailUrl,
  'error': instance.error,
};
