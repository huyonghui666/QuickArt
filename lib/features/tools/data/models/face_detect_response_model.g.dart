// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'face_detect_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FaceInfoModel _$FaceInfoModelFromJson(Map<String, dynamic> json) =>
    _FaceInfoModel(path: json['path'] as String, url: json['url'] as String);

Map<String, dynamic> _$FaceInfoModelToJson(_FaceInfoModel instance) =>
    <String, dynamic>{'path': instance.path, 'url': instance.url};

_FaceDetectResponseModel _$FaceDetectResponseModelFromJson(
  Map<String, dynamic> json,
) => _FaceDetectResponseModel(
  targetOssUrl: json['targetOssUrl'] as String,
  faces: (json['faces'] as List<dynamic>)
      .map((e) => FaceInfoModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$FaceDetectResponseModelToJson(
  _FaceDetectResponseModel instance,
) => <String, dynamic>{
  'targetOssUrl': instance.targetOssUrl,
  'faces': instance.faces,
};
