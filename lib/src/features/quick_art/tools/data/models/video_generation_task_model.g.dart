// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_generation_task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VideoGenerationTaskModelImpl _$$VideoGenerationTaskModelImplFromJson(
  Map<String, dynamic> json,
) => _$VideoGenerationTaskModelImpl(
  taskId: json['taskId'] as String,
  videoUrl: json['videoUrl'] as String?,
  error: json['error'] as String?,
);

Map<String, dynamic> _$$VideoGenerationTaskModelImplToJson(
  _$VideoGenerationTaskModelImpl instance,
) => <String, dynamic>{
  'taskId': instance.taskId,
  'videoUrl': instance.videoUrl,
  'error': instance.error,
};
