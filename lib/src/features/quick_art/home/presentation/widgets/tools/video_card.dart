import 'package:flutter/material.dart';
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

// 2. 创建可复用的视频卡片 Widget
class VideoCard extends ConsumerWidget {
  final String videoAssetPath;
  final String title;
  final VoidCallback? onTap;

  const VideoCard({
    super.key,
    required this.videoAssetPath,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 监听 Provider 以获取特定视频路径的控制器
    final controller = ref.watch(videoPlayerControllerProvider(videoAssetPath));

    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // 视频播放器
            controller.value.isInitialized
                ? AspectRatio(
                    aspectRatio: controller.value.aspectRatio,
                    child: VideoPlayer(controller),
                  )
                : const Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 2.0,
                      color: Colors.white,
                    ),
                  ),

            // 底部渐变，让文字更突出
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withValues(alpha: 0.1),
                    Colors.black.withValues(alpha: 0.7),
                  ],
                  stops: const [0.5, 0.7, 1.0],
                ),
              ),
            ),

            // 标题
            Positioned(
              left: 16,
              bottom: 16,
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      blurRadius: 8.0,
                      color: Colors.black54,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}