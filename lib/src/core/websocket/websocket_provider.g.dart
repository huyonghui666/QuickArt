// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'websocket_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$generationResultNotifierHash() =>
    r'139078e9b29ce196880c3ebf1afbb41472964a9a';

/// 全局任务结果状态管理
/// 存储 taskId -> url 的映射
///
/// Copied from [GenerationResultNotifier].
@ProviderFor(GenerationResultNotifier)
final generationResultNotifierProvider =
    NotifierProvider<GenerationResultNotifier, Map<String, String>>.internal(
      GenerationResultNotifier.new,
      name: r'generationResultNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$generationResultNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$GenerationResultNotifier = Notifier<Map<String, String>>;
String _$webSocketNotifierHash() => r'215d7fc665c379bd912a147e27b02c1b3b387696';

/// WebSocket 连接管理
/// 负责维护连接、心跳、重连以及分发消息
/// 包含任务持久化和断线重连后的自动重新订阅功能
///
/// Copied from [WebSocketNotifier].
@ProviderFor(WebSocketNotifier)
final webSocketNotifierProvider =
    NotifierProvider<WebSocketNotifier, WebSocketChannel?>.internal(
      WebSocketNotifier.new,
      name: r'webSocketNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$webSocketNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$WebSocketNotifier = Notifier<WebSocketChannel?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
