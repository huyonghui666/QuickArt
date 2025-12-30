import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:video_player/video_player.dart';

part 'video_player_controller_provider.g.dart';

// 使用 Riverpod Generator 创建 Provider 来管理 VideoPlayerController
// 这会自动处理 autoDispose 和 family
@riverpod
Future<VideoPlayerController> videoPlayerController(
  Ref ref,
  String videoPath,
) async {
  late final VideoPlayerController controller;

  // 根据路径判断是本地资源还是网络 URL
  if (videoPath.startsWith('assets/')) {
    controller = VideoPlayerController.asset(
      videoPath,
      videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
    );
  } else {
    controller = VideoPlayerController.networkUrl(
      Uri.parse(videoPath),
      videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
    );
  }

  // 当 Provider 销毁时，也销毁控制器以释放资源
  ref.onDispose(() {
    controller.dispose();
  });

  // 等待初始化完成
  await controller.initialize();

  // 设置播放参数
  controller.setLooping(true);
  controller.setVolume(0.0); // 静音播放
  controller.play();

  return controller;
}
