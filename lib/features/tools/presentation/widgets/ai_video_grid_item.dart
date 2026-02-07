import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_art/core/localization/l10n/app_localizations.dart';
import 'package:quick_art/features/tools/domain/entities/video_template.dart';
import 'package:quick_art/features/tools/presentation/notifiers/video_player_controller_provider.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class AiVideoGridItem extends ConsumerStatefulWidget {
  final String videoUrl;
  final String? coverUrl;
  final int index;
  final String? name;
  final VideoTemplate? template;

  const AiVideoGridItem({
    super.key,
    required this.videoUrl,
    this.coverUrl,
    required this.index,
    this.name,
    this.template,
  });

  @override
  ConsumerState<AiVideoGridItem> createState() => _AiVideoGridItemState();
}

class _AiVideoGridItemState extends ConsumerState<AiVideoGridItem> {
  // 控制是否应该加载视频（懒加载策略）
  bool _shouldPlay = false;
  Timer? _debounceTimer; // 定义定时器

  @override
  void dispose() {
    _debounceTimer?.cancel(); // 页面销毁时务必取消定时器
    super.dispose();
  }

  void _handleVisibilityChanged(double visibleFraction) {
    final isVisible = visibleFraction > 0.5;

    // 关键优化：将状态更新推迟到帧结束
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // 必须检查 mounted，因为在帧结束时，该 Widget 可能已经被销毁了
      if (!mounted) return;

      if (isVisible) {
        // 策略：进入视野，延迟加载 (防抖)
        if (!_shouldPlay && _debounceTimer?.isActive != true) {
          _debounceTimer?.cancel();
          _debounceTimer = Timer(const Duration(milliseconds: 300), () {
            if (mounted) {
              setState(() {
                _shouldPlay = true;
              });
            }
          });
        }
      } else {
        // 策略：离开视野，立即停止 (资源回收)
        _debounceTimer?.cancel();
        if (_shouldPlay) {
          setState(() {
            _shouldPlay = false;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    // 使用 VisibilityDetector 检测当前 Item 是否在屏幕内
    return VisibilityDetector(
      // 必须确保全局唯一，建议加上 index
      key: Key("video_${widget.index}_${widget.videoUrl}"),
      onVisibilityChanged: (info) {
        _handleVisibilityChanged(info.visibleFraction);
      },
      child: GestureDetector(
        onTap: () {
          if (widget.template != null) {
            context.push(
              '/tools/ai-video/template-detail',
              extra: widget.template,
            );
          }
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Stack(
            fit: StackFit.expand,
            children: [
            // 1. 底层：始终显示封面图 (性能保底)
            widget.coverUrl != null && widget.coverUrl!.isNotEmpty
                ? CachedNetworkImage(
                    imageUrl: widget.coverUrl!,
                    fit: BoxFit.cover,
                    // 内存优化：限制图片解码大小
                    memCacheWidth: 300,
                    placeholder: (context, url) =>
                        Container(color: Colors.grey[900]),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error, color: Colors.white),
                    fadeInDuration: const Duration(milliseconds: 200),
                  )
                : Image.network(
                    'https://picsum.photos/seed/video_template_${widget.index}/400/600',
                    fit: BoxFit.cover,
                  ),

            // 2. 上层：如果可见，则请求 Provider 加载视频
            if (_shouldPlay)
              _VideoPlayerLayer(videoUrl: widget.videoUrl, index: widget.index),

            // Gradient Overlay
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withValues(alpha: 0.7),
                  ],
                  stops: const [0.6, 1.0],
                ),
              ),
            ),

            // 3. 装饰层：文字标签
            Positioned(
              left: 8,
              bottom: 8,
              right: 8,
              child: Text(
                widget.name ?? '',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
      )
    );
  }
}

// 抽离视频播放层，为了让 Riverpod 正确监听
class _VideoPlayerLayer extends ConsumerWidget {
  final String videoUrl;
  final int index;

  const _VideoPlayerLayer({required this.videoUrl, required this.index});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 监听 Provider
    // 传入了 index
    final params = VideoParams(videoUrl, index);
    final videoAsync = ref.watch(videoControllerProvider(params));

    return videoAsync.when(
      data: (controller) {
        // 加载完成后播放
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
      // 加载中或错误时，透明处理（透出下方的封面图）
      loading: () => const SizedBox.shrink(),
      error: (_, __) => const SizedBox.shrink(),
    );
  }
}
