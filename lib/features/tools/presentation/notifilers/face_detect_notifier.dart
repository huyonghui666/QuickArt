import 'package:quick_art/core/di/injection_container.dart';
import 'package:quick_art/features/tools/domain/entities/face_detect_result.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'face_detect_notifier.g.dart';

/// 人脸检测状态管理
@riverpod
class FaceDetect extends _$FaceDetect {
  @override
  FutureOr<FaceDetectResult?> build() => null;

  /// 上传图片并执行人脸检测
  Future<void> detect(String imagePath) async {
    state = const AsyncValue<FaceDetectResult?>.loading();
    state = await AsyncValue.guard(
      () => ref.read(detectFacesUseCaseProvider).call(imagePath),
    );
  }
}
