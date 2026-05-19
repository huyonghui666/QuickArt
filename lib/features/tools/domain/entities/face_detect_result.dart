import 'package:freezed_annotation/freezed_annotation.dart';

part 'face_detect_result.freezed.dart';

/// 单个人脸信息实体
@freezed
abstract class FaceInfo with _$FaceInfo {
  /// 构造
  const factory FaceInfo({
    /// Magic Hour 内部路径
    required String path,

    /// CDN 缩略图 URL
    required String url,
  }) = _FaceInfo;
}

/// 人脸检测结果实体
@freezed
abstract class FaceDetectResult with _$FaceDetectResult {
  /// 构造
  const factory FaceDetectResult({
    /// 目标图片 OSS URL
    required String targetOssUrl,

    /// 检测到的人脸列表
    required List<FaceInfo> faces,
  }) = _FaceDetectResult;
}
