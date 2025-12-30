// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_generation_task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SuccessImpl _$$SuccessImplFromJson(Map<String, dynamic> json) =>
    _$SuccessImpl(
      taskId: json['taskId'] as String,
      imageUrl: json['imageUrl'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$SuccessImplToJson(_$SuccessImpl instance) =>
    <String, dynamic>{
      'taskId': instance.taskId,
      'imageUrl': instance.imageUrl,
      'runtimeType': instance.$type,
    };

_$FailedImpl _$$FailedImplFromJson(Map<String, dynamic> json) => _$FailedImpl(
  taskId: json['taskId'] as String,
  error: json['error'] as String,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$$FailedImplToJson(_$FailedImpl instance) =>
    <String, dynamic>{
      'taskId': instance.taskId,
      'error': instance.error,
      'runtimeType': instance.$type,
    };
