import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quick_art/features/home/domain/entities/remote_config.dart';
import 'package:quick_art/core/di/injection_container.dart';
import 'package:quick_art/features/home/domain/repositories/remote_config_repository.dart';

final remoteConfigProvider =
    StateNotifierProvider<RemoteConfigNotifier, AsyncValue<RemoteConfig?>>((
      ref,
    ) {
      final repository = ref.read(remoteConfigRepositoryProvider);
      return RemoteConfigNotifier(repository);
    });

class RemoteConfigNotifier extends StateNotifier<AsyncValue<RemoteConfig?>> {
  final RemoteConfigRepository _repository;

  // 内存中的最后检查时间（用于热启动节流）
  // 也可以从 repository 加载持久化的时间，这里为了更严格的节流选择双重保障：
  // 1. 内存：快速判断
  // 2. 持久化：跨冷启动的判断（如果需要）
  // 根据用户需求：
  // "热启动 (Hot Start) ：App 从后台切回前台... if (当前时间 - 上次检查时间 > 1小时) { 发起请求 }"
  // 这个 "上次检查时间" 最好是持久化的，这样即使 App 被杀掉重启，如果还在1小时内，也可以避免不必要的请求（虽然冷启动通常建议强制检查一次以确保最新）。
  // 但既然用户明确区分了冷启动和热启动，我们遵循：
  // 冷启动：强制检查（带If-None-Match）
  // 热启动：节流检查
  DateTime? _lastCheckTime;

  RemoteConfigNotifier(this._repository) : super(const AsyncValue.loading()) {
    _init();
  }

  Future<void> _init() async {
    // 1. Cold Start: Load from cache immediately
    final cachedConfig = await _repository.loadFromCache();
    if (cachedConfig != null) {
      state = AsyncValue.data(cachedConfig);
    } else {
      state = const AsyncValue.data(null);
    }

    // Load persisted last check time
    _lastCheckTime = await _repository.getLastCheckTime();

    // 2. Fetch from remote in background (force check on startup)
    // Pass current version for conditional request
    checkUpdate(force: true);
  }

  /// Check for updates with throttling
  Future<void> checkUpdate({bool force = false}) async {
    final now = DateTime.now();

    if (!force && _lastCheckTime != null) {
      final difference = now.difference(_lastCheckTime!);
      if (difference.inHours < 1) {
        return; // Throttled
      }
    }

    _lastCheckTime = now;
    // Persist check time
    await _repository.saveLastCheckTime(now);

    await fetchAndActivate();
  }

  Future<void> fetchAndActivate() async {
    try {
      final currentConfig = state.value;
      final currentVersion = currentConfig?.configVersion;

      // 3. Conditional Request (If-None-Match)
      // If backend returns 304, remoteConfig will be null (repo handles it)
      final remoteConfig = await _repository.fetchConfig(
        currentVersion: currentVersion,
      );

      if (remoteConfig == null) {
        // 304 Not Modified or Error: Stop here
        // No parsing, no state update, minimal CPU usage
        return;
      }

      // 4. Version Changed (Status 200)
      if (currentVersion == null ||
          currentConfig?.configVersion != remoteConfig.configVersion) {
        // Update local storage
        await _repository.saveConfig(remoteConfig);
        // Update State (triggers UI refresh)
        state = AsyncValue.data(remoteConfig);
      }
    } catch (e, st) {
      // Don't change state on error, keep using cache
      if (state.value == null) {
        state = AsyncValue.error(e, st);
      }
    }
  }
}
