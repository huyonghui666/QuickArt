// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'websocket_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$webSocketNotifierHash() => r'876543d59d8dea9a3b026ac0fa2d7be660c9c24d';

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
