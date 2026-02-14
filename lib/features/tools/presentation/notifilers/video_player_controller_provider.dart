import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player/video_player.dart';

/// 定义一个参数模型，确保唯一性
@immutable
class VideoParams {
  // 加上索引或者唯一ID
  /// 构造
  const VideoParams(this.url, this.index);

  /// 视频url
  final String url;

  /// 索引确保唯一
  final int index;

  // Riverpod 需要通过 == 和 hashCode 来判断参数是否相同
  @override
  bool operator ==(Object other) =>
      other is VideoParams && other.url == url && other.index == index;

  @override
  int get hashCode => Object.hash(url, index);
}

/// 视频控制器 Provider
// 定义一个 Provider Family，通过视频 URL 获取控制器
// 使用 autoDispose：当没有任何 Widget 监听这个 Provider 时（即划出屏幕），自动 dispose controller
final AutoDisposeFutureProviderFamily<VideoPlayerController, VideoParams>
videoControllerProvider = FutureProvider.autoDispose
    .family<VideoPlayerController, VideoParams>((ref, params) async {
      VideoPlayerController controller;

      if (params.url.startsWith('http') || params.url.startsWith('https')) {
        controller = VideoPlayerController.networkUrl(
          Uri.parse(params.url),
          videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
        );
      } else if (params.url.startsWith('assets/')) {
        controller = VideoPlayerController.asset(
          params.url,
          videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
        );
      } else {
        controller = VideoPlayerController.file(
          File(params.url),
          videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
        );
      }

      // 1. 初始化
      await controller.initialize();

      // 2. 性能优化设置
      controller
        ..setVolume(0) // 静音播放，节省音频解码资源
        ..setLooping(true); // 循环播放

      // 3. 注册销毁回调
      ref.onDispose(() {
        controller.dispose(); // 关键：确保内存释放
      });

      return controller;
    });
