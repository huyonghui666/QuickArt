import 'package:quick_art/features/tools/domain/entities/face_swap_task.dart';
import 'package:quick_art/features/tools/domain/repositories/face_swap_repository.dart';

/// 换脸任务提交用例
class SwapFacesUseCase {
  /// 构造
  SwapFacesUseCase(this._repository);

  final IFaceSwapRepository _repository;

  /// 执行用例
  Future<FaceSwapTask> call({
    required String targetOssUrl,
    required List<String> originalFacePaths,
    required List<String> faceImageUrls,
  }) => _repository.swapFaces(
        targetOssUrl: targetOssUrl,
        originalFacePaths: originalFacePaths,
        faceImageUrls: faceImageUrls,
      );
}
