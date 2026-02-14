// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_generation_task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VideoGenerationTaskModel _$VideoGenerationTaskModelFromJson(
  Map<String, dynamic> json,
) => _VideoGenerationTaskModel(
  taskId: json['taskId'] as String,
  videoUrl: json['videoUrl'] as String?,
  error: json['error'] as String?,
);

Map<String, dynamic> _$VideoGenerationTaskModelToJson(
  _VideoGenerationTaskModel instance,
) => <String, dynamic>{
  'taskId': instance.taskId,
  'videoUrl': instance.videoUrl,
  'error': instance.error,
};
