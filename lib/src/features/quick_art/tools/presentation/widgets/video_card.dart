import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quick_art/src/features/quick_art/tools/presentation/notifilers/video_player_controller_provider.dart';
import 'package:video_player/video_player.dart';

// 创建可复用的视频卡片 Widget
class VideoCard extends StatelessWidget {
  final String videoPath;
  final String title;
  final VoidCallback? onTap;

  const VideoCard({
    super.key,
    required this.videoPath,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: Stack(
          fit: StackFit.expand,
          children: [
            RepaintBoundary(
              child: Consumer(
                builder: (context, ref, child) {
                  // 监听 Provider 以获取特定视频路径的控制器
                  final controller = ref.watch(
                    videoPlayerControllerProvider(videoPath),
                  );

                  return controller.value.isInitialized
                      ? AspectRatio(
                          aspectRatio: controller.value.aspectRatio,
                          child: VideoPlayer(controller),
                        )
                      : const Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 2.0,
                            color: Colors.white,
                          ),
                        );
                },
              ),
            ),

            // 静态部分：这个渐变层不会在视频播放时重建或重绘。
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

            // 静态部分：这个标题也不会在视频播放时重建或重绘。
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
