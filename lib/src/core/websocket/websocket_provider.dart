import 'dart:async';
import 'dart:convert';
import 'package:quick_art/src/core/constants/app_constants.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:quick_art/src/core/websocket/model/generation_result_model.dart';

part 'websocket_provider.g.dart';

final _logger = Logger();
const _pendingTasksKey = 'pending_tasks';

/// 全局任务结果状态管理
/// 存储 taskId -> GenerationResultModel 的映射
@Riverpod(keepAlive: true)
class GenerationResultNotifier extends _$GenerationResultNotifier {
  @override
  Map<String, GenerationResultModel> build() => {};

  void setResult(GenerationResultModel result) {
    state = {...state, result.taskId: result};
    _logger.i('Task completed: ${result.taskId} -> ${result.url}');
  }

  void clear(String taskId) {
    final newState = {...state};
    newState.remove(taskId);
    state = newState;
  }
}

/// WebSocket 连接管理
/// 负责维护连接、心跳、重连以及分发消息
/// 包含任务持久化和断线重连后的自动重新订阅功能
@Riverpod(keepAlive: true)
class WebSocketNotifier extends _$WebSocketNotifier {
  static const String wsUrl =
      '${AppConstants.webSocketBaseUrl}${AppConstants.webSocketPath}'; // 支持认证的 URL
  static const Duration reconnectDelay = Duration(seconds: 5); // 重连延迟

  Timer? _heartbeatTimer;

  @override
  WebSocketChannel? build() {
    /**
     * - 需要 。虽然我们在 Provider 上加了 @Riverpod(keepAlive: true) ，这意味着这个 Provider 在整个 App 生命周期内通常不会被销毁 。
        - 但是 ，在某些极端情况下（例如手动调用 ref.invalidate(webSocketNotifierProvider) 重置状态，或者用户注销登录时手动销毁），Provider 确实会被 dispose。
        - 如果没有这个 onDispose ，当 Provider 被销毁时，底层的 WebSocket 连接可能仍然悬挂在内存中（Leak），甚至还在尝试发心跳。
     */
    ref.onDispose(() {
      _disconnect();
    });
    return null;
  }

  Future<void> connect() async {
    if (state != null) return; // 已连接

    try {
      // 拼接完整的 WebSocket URL
      final wsUri = Uri.parse(wsUrl);
      _logger.i('Connecting to WebSocket: $wsUri');

      final channel = WebSocketChannel.connect(wsUri);
      state = channel;

      // 启动心跳
      _startHeartbeat();

      // 监听消息
      channel.stream.listen(
        (message) {
          _handleMessage(message);
        },
        onError: (error) {
          _logger.e('WebSocket error: $error');
          _handleError(error);
        },
        onDone: () {
          _handleDisconnect();
        },
      );

      _logger.i('WebSocket connected');
      // 连接成功后，恢复挂起的订阅
      await _restorePendingSubscriptions();
    } catch (e) {
      _logger.e('WebSocket connect failed: $e');
      _reconnect();
    }
  }

  void _handleMessage(dynamic message) {
    try {
      final payload = jsonDecode(message as String);
      _logger.d('WebSocket message received: $payload');

      final event = payload['event'];

      if (event == 'success' || event == 'failed') {
        try {
          // 由于后端返回的数据结构比较扁平，我们手动构建 GenerationResult
          // 或者如果 GenerationResult.fromJson 能够处理扁平化结构，直接使用它
          // 但考虑到我们已经在 GenerationResult 中定义了 url 字段，而 payload 中可能是 imageUrl 或 videoUrl
          // 所以最好手动映射一下

          final taskId = payload['taskId'];
          if (taskId == null) return;

          final type = payload['type'];
          final error = payload['error'];
          final url = payload['imageUrl'] ?? payload['videoUrl'];

          final result = GenerationResultModel(
            taskId: taskId,
            event: event,
            type: type,
            url: url,
            error: error,
          );

          ref.read(generationResultNotifierProvider.notifier).setResult(result);

          // 任务结束（无论成功失败），移除本地挂起记录
          _removePendingTask(taskId);
        } catch (e) {
          _logger.e('Error creating GenerationResult: $e');
        }
      }
    } catch (e) {
      _logger.e('Error parsing message: $e');
    }
  }

  void _handleError(dynamic error) {
    _logger.e('WebSocket error: $error');
    _disconnect();
    _reconnect();
  }

  void _handleDisconnect() {
    _logger.i('WebSocket disconnected');
    _disconnect();
    _reconnect();
  }

  Future<void> subscribeTask(String taskId) async {
    if (state == null) {
      await connect();
    }
    _sendSubscribe(taskId);
    await _savePendingTask(taskId); // 持久化
  }

  void _sendSubscribe(String taskId) {
    try {
      state?.sink.add(jsonEncode({'event': 'subscribe', 'taskId': taskId}));
      _logger.i('Subscribed to task: $taskId');
    } catch (e) {
      _logger.e('Failed to subscribe task $taskId: $e');
    }
  }

  void _startHeartbeat() {
    _heartbeatTimer?.cancel();
    _heartbeatTimer = Timer.periodic(const Duration(seconds: 30), (_) {
      if (state != null) {
        try {
          state?.sink.add(jsonEncode({'event': 'ping'}));
        } catch (e) {
          _logger.w('Heartbeat failed: $e');
        }
      }
    });
  }

  void _disconnect() {
    _heartbeatTimer?.cancel();
    state?.sink.close();
    state = null;
    _logger.i('WebSocket disconnected');
  }

  void _reconnect() {
    _disconnect();
    // 简单的重连策略：延迟5秒后重试
    Future.delayed(const Duration(seconds: 5), () {
      _logger.i('Attempting to reconnect...');
      connect();
    });
  }

  // --- 持久化逻辑 ---

  /// 保存未完成的任务ID
  Future<void> _savePendingTask(String taskId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final pending = prefs.getStringList(_pendingTasksKey) ?? [];
      if (!pending.contains(taskId)) {
        pending.add(taskId);
        await prefs.setStringList(_pendingTasksKey, pending);
        _logger.i('Task saved pending: $taskId');
      }
    } catch (e) {
      _logger.e('Failed to save pending task: $e');
    }
  }

  /// 移除已完成的任务ID
  Future<void> _removePendingTask(String taskId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final pending = prefs.getStringList(_pendingTasksKey) ?? [];
      if (pending.remove(taskId)) {
        await prefs.setStringList(_pendingTasksKey, pending);
        _logger.i('Task removed from pending: $taskId');
      }
    } catch (e) {
      _logger.e('Failed to remove pending task: $e');
    }
  }

  /// 恢复所有挂起的订阅
  Future<void> _restorePendingSubscriptions() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final pending = prefs.getStringList(_pendingTasksKey) ?? [];
      if (pending.isNotEmpty) {
        _logger.i('Restoring ${pending.length} pending subscriptions...');
        for (var taskId in pending) {
          subscribeTask(taskId);
        }
      }
    } catch (e) {
      _logger.e('Failed to restore pending subscriptions: $e');
    }
  }
}
