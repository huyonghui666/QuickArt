import 'package:quick_art/features/tools/domain/entities/face_detect_result.dart';

/// 换脸仓库接口
abstract class IFaceSwapRepository {
  /// 上传目标图片，返回人脸检测结果
  Future<FaceDetectResult> detectFaces(String imagePath);
}
