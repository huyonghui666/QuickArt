// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_generation_task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ImageGenerationTaskModelImpl _$$ImageGenerationTaskModelImplFromJson(
  Map<String, dynamic> json,
) => _$ImageGenerationTaskModelImpl(
  taskId: json['taskId'] as String,
  imageUrl: json['imageUrl'] as String?,
  error: json['error'] as String?,
);

Map<String, dynamic> _$$ImageGenerationTaskModelImplToJson(
  _$ImageGenerationTaskModelImpl instance,
) => <String, dynamic>{
  'taskId': instance.taskId,
  'imageUrl': instance.imageUrl,
  'error': instance.error,
};
