import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_art/features/tools/presentation/notifilers/video_player_controller_provider.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

/// 创建可复用的视频卡片 Widget
class VideoCard extends ConsumerStatefulWidget {
  /// 构造
  const VideoCard({
    required this.videoPath,
    super.key,
    this.title = '',
    this.onTap,
    this.checkRouteMatch = true,
  });

  /// 视频assets本地路径
  final String videoPath;

  /// 标题
  final String title;

  /// 点击回调
  final VoidCallback? onTap;

  /// 检查路由匹配
  final bool checkRouteMatch;

  @override
  ConsumerState<VideoCard> createState() => _VideoCardState();
}

class _VideoCardState extends ConsumerState<VideoCard> {
  @override
  Widget build(BuildContext context) {
    // 实时获取当前路径 (GoRouter 监听机制)
    // GoRouterState.of(context) 会在路由变化时重建 widget
    var currentLocation = '';
    try {
      currentLocation = GoRouterState.of(context).uri.toString();
      // GoRouterState.of throws an Error (not Exception) when not found.
      // ignore: avoid_catches_without_on_clauses
    } catch (_) {
      // 兼容在非 GoRouter 上下文中使用（如 BottomSheet）
      currentLocation = '';
    }

    // 监听视频控制器状态，一旦加载完成且允许自动播放，则立即播放
    // 这对于 BottomSheet 等场景很重要，因为 VisibilityDetector 可能在数据加载前就触发了
    ref.listen(videoControllerProvider(VideoParams(widget.videoPath, 0)), (
      previous,
      next,
    ) {
      final controller = next.valueOrNull;
      if (controller != null &&
          !widget.checkRouteMatch &&
          !controller.value.isPlaying) {
        controller.play();
      }
    });

    return GestureDetector(
      onTap: widget.onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          fit: StackFit.expand,
          children: [
            VisibilityDetector(
              key: ValueKey(widget.videoPath),
              onVisibilityChanged: (VisibilityInfo info) {
                if (!mounted) return; // 防止组件销毁后调用 ref

                final isVisible = info.visibleFraction > 0.5;
                // 只在 Tools 根页面（'/tools'）播放视频
                final isToolsRoot = currentLocation == '/tools';

                final shouldPlay =
                    isVisible && (!widget.checkRouteMatch || isToolsRoot);

                final controller = ref
                    .read(
                      videoControllerProvider(VideoParams(widget.videoPath, 0)),
                    )
                    .valueOrNull;

                if (controller != null) {
                  if (shouldPlay) {
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
                    videoControllerProvider(VideoParams(widget.videoPath, 0)),
                  );

                  return asyncController.when(
                    data: (controller) => AspectRatio(
                      aspectRatio: controller.value.aspectRatio,
                      child: VideoPlayer(controller),
                    ),
                    loading: () => const Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
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

            if (widget.title.isNotEmpty)
              Positioned(
                left: 16,
                bottom: 16,
                child: Text(
                  widget.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        blurRadius: 8,
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
