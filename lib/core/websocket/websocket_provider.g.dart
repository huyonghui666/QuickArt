// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'websocket_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$generationEventHash() => r'47fbf1e1c7f9985fdd80e41944dfc691067bfaaf';

/// See also [generationEvent].
@ProviderFor(generationEvent)
final generationEventProvider = StreamProvider<GenerationResultModel>.internal(
  generationEvent,
  name: r'generationEventProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$generationEventHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GenerationEventRef = StreamProviderRef<GenerationResultModel>;
String _$webSocketNotifierHash() => r'c135cd4d6e0f13b80582b6e504b31b2d5d8ecb98';

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
