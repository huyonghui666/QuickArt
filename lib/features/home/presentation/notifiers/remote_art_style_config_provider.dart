import 'dart:async';

import 'package:quick_art/core/di/injection_container.dart';
import 'package:quick_art/features/home/domain/entities/remote_art_style_config.dart';
import 'package:quick_art/features/home/domain/usecases/remote_config_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'remote_art_style_config_provider.g.dart';

/// 艺术风格配置 Provider
///
/// build() 只在冷启动（provider 首次创建）时执行一次，天然满足"只在冷启动检查版本"的需求。
/// 热启动（App 从后台切回）不会重新执行 build()，无需额外节流逻辑。
@riverpod
class RemoteArtStyleConfigNotifier extends _$RemoteArtStyleConfigNotifier {
  RemoteArtStyleConfigUseCase get _useCase =>
      ref.read(remoteArtStyleConfigUseCaseProvider);

  @override
  Future<RemoteArtStyleConfig?> build() async {
    // 1. 先加载本地缓存，立即展示旧数据
    final cachedConfig = await _useCase.loadFromArtStyleCache();

    // 2. 后台发起条件请求（带 If-None-Match）
    //    304 → 继续用缓存；200 → fetchAndActivate 内部更新状态
    unawaited(
      Future<void>.delayed(Duration.zero, fetchAndActivate),
    );

    return cachedConfig;
  }

  /// 发起条件请求，版本有更新时刷新状态。
  Future<void> fetchAndActivate() async {
    try {
      final currentVersion = state.value?.artStyleConfigVersion;

      final remoteConfig = await _useCase.fetchArtStyleConfig(
        currentVersion: currentVersion,
      );

      // 304 Not Modified：版本未变，无需更新状态
      if (remoteConfig == null) return;

      // 200：服务端返回了完整配置（含签名 URL），无论版本号是否相同都更新。
      // 避免签名 URL 过期后仍使用旧缓存导致缩略图/背景图加载失败。
      await _useCase.saveArtStyleConfig(remoteConfig);
      state = AsyncData(remoteConfig);
    } on Exception catch (e, st) {
      // 出错时保持现有缓存，仅在无缓存时才展示错误状态
      if (state.value == null) {
        state = AsyncError(e, st);
      }
    }
  }
}
