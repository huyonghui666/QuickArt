import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quick_art/features/tools/domain/entities/face_detect_result.dart';

part 'face_detect_response_model.freezed.dart';
part 'face_detect_response_model.g.dart';

/// 单个人脸信息数据模型
@freezed
abstract class FaceInfoModel with _$FaceInfoModel {
  /// 构造
  const factory FaceInfoModel({
    /// Magic Hour 内部路径
    required String path,

    /// CDN 缩略图 URL
    required String url,
  }) = _FaceInfoModel;
  const FaceInfoModel._();

  /// 从 JSON 构造
  factory FaceInfoModel.fromJson(Map<String, dynamic> json) =>
      _$FaceInfoModelFromJson(json);

  /// 转换为领域实体
  FaceInfo toEntity() => FaceInfo(path: path, url: url);
}

/// 人脸检测响应数据模型
@freezed
abstract class FaceDetectResponseModel with _$FaceDetectResponseModel {
  /// 构造
  const factory FaceDetectResponseModel({
    /// 目标图片 OSS URL
    required String targetOssUrl,

    /// 检测到的人脸列表
    required List<FaceInfoModel> faces,
  }) = _FaceDetectResponseModel;
  const FaceDetectResponseModel._();

  /// 从 JSON 构造
  factory FaceDetectResponseModel.fromJson(Map<String, dynamic> json) =>
      _$FaceDetectResponseModelFromJson(json);

  /// 转换为领域实体
  FaceDetectResult toEntity() => FaceDetectResult(
        targetOssUrl: targetOssUrl,
        faces: faces.map((e) => e.toEntity()).toList(),
      );
}
