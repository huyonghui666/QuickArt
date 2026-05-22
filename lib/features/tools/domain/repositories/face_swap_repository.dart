import 'package:quick_art/features/tools/domain/entities/face_detect_result.dart';
import 'package:quick_art/features/tools/domain/entities/face_swap_task.dart';

/// 换脸仓库接口
abstract class IFaceSwapRepository {
  /// 上传目标图片，返回人脸检测结果
  Future<FaceDetectResult> detectFaces(String imagePath);

  /// 提交换脸任务，返回任务实体
  Future<FaceSwapTask> swapFaces({
    required String targetOssUrl,
    required List<String> originalFacePaths,
    required List<String> faceImageUrls,
  });
}
