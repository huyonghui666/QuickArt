import 'package:quick_art/features/tools/domain/entities/face_detect_result.dart';
import 'package:quick_art/features/tools/domain/repositories/face_swap_repository.dart';

/// 人脸检测用例
class DetectFacesUseCase {
  /// 构造
  DetectFacesUseCase(this._repository);

  final IFaceSwapRepository _repository;

  /// 执行用例
  Future<FaceDetectResult> call(String imagePath) =>
      _repository.detectFaces(imagePath);
}
