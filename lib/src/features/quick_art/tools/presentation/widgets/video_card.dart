import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quick_art/src/features/quick_art/tools/presentation/notifilers/video_player_controller_provider.dart';
import 'package:video_player/video_player.dart';

// 创建可复用的视频卡片 Widget
// 优化：将 ConsumerWidget 改为 StatelessWidget，因为只有部分 UI 需要随 Provider 更新。
class VideoCard extends StatelessWidget {
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
  Widget build(BuildContext context) {
    // 整个外部结构现在是静态的，只构建一次。
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // 优化：使用 RepaintBoundary 将高频重绘的视频区域隔离。
            // 这会创建一个独立的绘制层，避免视频的每一帧都触发整个卡片的重绘。
            RepaintBoundary(
              // 优化：使用 Consumer 将重建范围缩小到仅依赖 Provider 的部分。
              // 现在只有这个 Consumer 的 builder 会在视频控制器更新时重建。
              child: Consumer(
                builder: (context, ref, child) {
                  // 监听 Provider 以获取特定视频路径的控制器
                  final controller = ref.watch(
                    videoPlayerControllerProvider(videoAssetPath),
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
