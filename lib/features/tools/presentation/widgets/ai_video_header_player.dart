import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quick_art/features/tools/presentation/notifilers/video_player_controller_provider.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

/// 顶部视频UI
class AiVideoHeaderPlayer extends ConsumerStatefulWidget {
  /// 构造
  const AiVideoHeaderPlayer({required this.videoUrl, super.key});
  /// 视频url
  final String videoUrl;

  @override
  ConsumerState<AiVideoHeaderPlayer> createState() =>
      _AiVideoHeaderPlayerState();
}

class _AiVideoHeaderPlayerState extends ConsumerState<AiVideoHeaderPlayer> {
  bool _shouldPlay = true;

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key('header_video_${widget.videoUrl}'),
      onVisibilityChanged: (info) {
        final visibleFraction = info.visibleFraction;
        // 如果可见比例小于 0.1（几乎滑出屏幕），停止播放
        if (visibleFraction < 0.1 && _shouldPlay) {
          if (mounted) {
            setState(() {
              _shouldPlay = false;
            });
          }
        } else if (visibleFraction > 0.1 && !_shouldPlay) {
          // 如果重新可见，恢复播放
          if (mounted) {
            setState(() {
              _shouldPlay = true;
            });
          }
        }
      },
      child: _shouldPlay
          ? _HeaderVideoPlayer(videoUrl: widget.videoUrl)
          : Container(color: Colors.black), // 占位符
    );
  }
}

class _HeaderVideoPlayer extends ConsumerWidget {

  const _HeaderVideoPlayer({required this.videoUrl});
  final String videoUrl;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Using a fixed index -1 for header to avoid conflict with grid items
    final params = VideoParams(videoUrl, -1);
    final videoAsync = ref.watch(videoControllerProvider(params));

    return videoAsync.when(
      data: (controller) {
        if (!controller.value.isPlaying) {
          controller.play();
        }
        return FittedBox(
          fit: BoxFit.cover,
          child: SizedBox(
            width: controller.value.size.width,
            height: controller.value.size.height,
            child: VideoPlayer(controller),
          ),
        );
      },
      // Show black background or loading indicator while loading
      loading: () => Container(color: Colors.black),
      error: (_, _) => Container(color: Colors.black),
    );
  }
}
