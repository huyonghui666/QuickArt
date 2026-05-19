import 'package:quick_art/features/tools/data/datasources/face_swap_remote_data_source.dart';
import 'package:quick_art/features/tools/domain/entities/face_detect_result.dart';
import 'package:quick_art/features/tools/domain/repositories/face_swap_repository.dart';

/// 换脸仓库实现
class FaceSwapRepositoryImpl implements IFaceSwapRepository {
  /// 构造
  FaceSwapRepositoryImpl(this._dataSource);

  final IFaceSwapRemoteDataSource _dataSource;

  @override
  Future<FaceDetectResult> detectFaces(String imagePath) async {
    final model = await _dataSource.detectFaces(imagePath);
    return model.toEntity();
  }
}
