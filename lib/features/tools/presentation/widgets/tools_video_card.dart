import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_art/features/tools/presentation/notifilers/video_player_controller_provider.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

// 创建可复用的视频卡片 Widget
class VideoCard extends ConsumerWidget {
  final String videoPath;
  final String title;
  final VoidCallback? onTap;

  const VideoCard({
    super.key,
    required this.videoPath,
    this.title = '',
    this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 实时获取当前路径 (GoRouter 监听机制)
    // GoRouterState.of(context) 会在路由变化时重建 widget
    final currentLocation = GoRouterState.of(context).uri.toString();

    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: Stack(
          fit: StackFit.expand,
          children: [
            VisibilityDetector(
              key: ValueKey(videoPath),
              onVisibilityChanged: (VisibilityInfo info) {
                final isVisible = info.visibleFraction > 0.5;
                // 只在 Tools 根页面（'/tools'）播放视频
                final isToolsRoot = currentLocation == '/tools';

                final controller = ref
                    .read(videoPlayerControllerProvider(videoPath))
                    .valueOrNull;

                if (controller != null) {
                  if (isVisible && isToolsRoot) {
                    if (!controller.value.isPlaying) controller.play();
                  } else {
                    if (controller.value.isPlaying) controller.pause();
                  }
                }
              },
              child: Consumer(
                builder: (context, ref, child) {
                  // 监听异步 Provider 状态
                  final asyncController = ref.watch(
                    videoPlayerControllerProvider(videoPath),
                  );

                  return asyncController.when(
                    data: (controller) => AspectRatio(
                      aspectRatio: controller.value.aspectRatio,
                      child: VideoPlayer(controller),
                    ),
                    loading: () => const Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 2.0,
                        color: Colors.white,
                      ),
                    ),
                    error: (err, stack) => const Center(
                      child: Icon(Icons.error, color: Colors.white),
                    ),
                  );
                },
              ),
            ),

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

            if (title.isNotEmpty)
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
