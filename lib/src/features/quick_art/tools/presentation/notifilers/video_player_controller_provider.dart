import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player/video_player.dart';

// 1. 使用 Riverpod 创建一个 Provider 来管理 VideoPlayerController
final videoPlayerControllerProvider =
ChangeNotifierProvider.autoDispose.family<VideoPlayerController, String>(
      (ref, videoPath) {
    // 注意：这里我们使用 VideoPlayerController.asset 来加载本地视频
    final controller = VideoPlayerController.asset(videoPath,videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true));
    // final controller = VideoPlayerController.network(videoPath);

    // 初始化控制器，并在完成后开始循环播放
    controller.initialize().then((_) {
      controller.setLooping(true);
      controller.setVolume(0.0); // 静音播放
      controller.play();
    });

    // 当 Provider 销毁时，自动释放控制器资源
    ref.onDispose(() {
      controller.dispose();
    });

    return controller;
  },
);