import 'package:quick_art/core/di/injection_container.dart';
import 'package:quick_art/core/models/generate_task_type.dart';
import 'package:quick_art/core/websocket/websocket_provider.dart';
import 'package:quick_art/features/tools/domain/entities/face_swap_task.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'face_swap_generation_notifier.g.dart';

/// 换脸任务输入参数
class FaceSwapInput {
  /// 构造
  const FaceSwapInput({
    required this.targetOssUrl,
    required this.originalFacePaths,
    required this.faceImageUrls,
  });

  /// /detect 返回的目标图片 OSS URL
  final String targetOssUrl;

  /// 目标图里要被替换的脸的 Magic Hour 内部路径，与 faceImageUrls 顺序对应
  final List<String> originalFacePaths;

  /// 用来替换的脸的 CDN URL（自拍脸），顺序与 originalFacePaths 对应
  final List<String> faceImageUrls;
}

/// 换脸输入参数持有者（keepAlive，跨页面传递）
@Riverpod(keepAlive: true)
class FaceSwapInputHolder extends _$FaceSwapInputHolder {
  @override
  FaceSwapInput? build() => null;

  /// 设置换脸参数
  void set(FaceSwapInput input) => state = input;
}

/// 换脸任务生成 Notifier
@riverpod
class FaceSwapGenerationNotifier extends _$FaceSwapGenerationNotifier {
  @override
  AsyncValue<FaceSwapTask> build(String taskKey) {
    _startGeneration();
    return const AsyncValue.loading();
  }

  Future<void> _startGeneration() async {
    state = const AsyncValue.loading();
    try {
      final input = ref.read(faceSwapInputHolderProvider);
      if (input == null) throw Exception('Face swap input not set');

      final useCase = ref.read(swapFacesUseCaseProvider);
      final task = await useCase(
        targetOssUrl: input.targetOssUrl,
        originalFacePaths: input.originalFacePaths,
        faceImageUrls: input.faceImageUrls,
      );

      ref
          .read(webSocketNotifierProvider.notifier)
          .subscribeTask(task.taskId, type: GenerateTaskType.image);

      state = AsyncValue.data(task);
    } on Exception catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  /// 重试
  void retry() => ref.invalidateSelf();
}
