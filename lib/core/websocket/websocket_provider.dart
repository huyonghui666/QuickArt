import 'dart:async';
import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quick_art/core/models/generation_result_model.dart';
import 'package:quick_art/features/workshop/data/datasources/local_data_source/database_helper.dart';
import 'package:quick_art/core/models/generate_task_type.dart';
import 'package:quick_art/core/utils/constants/app_constants.dart';
import 'package:quick_art/features/workshop/domain/entities/workshop_task.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'websocket_provider.g.dart';

final _logger = Logger();
const _pendingTasksKey = 'pending_tasks';

/// 全局任务结果事件流
/// 用于通知 UI 任务完成（成功或失败）
final _generationEventController =
    StreamController<GenerationResultModel>.broadcast();

@Riverpod(keepAlive: true)
Stream<GenerationResultModel> generationEvent(Ref ref) {
  return _generationEventController.stream;
}

/// WebSocket 连接管理
/// 负责维护连接、心跳、重连以及分发消息
/// 包含任务持久化和断线重连后的自动重新订阅功能
@Riverpod(keepAlive: true)
class WebSocketNotifier extends _$WebSocketNotifier {
  Timer? _heartbeatTimer;

  @override
  WebSocketChannel? build() {
    ref.onDispose(() {
      _disconnect();
    });
    return null;
  }

  Future<void> connect() async {
    if (state != null) return; // 已连接

    try {
      // 拼接完整的 WebSocket URL
      final wsUri = Uri.parse(AppConstants.webSocketGeneratePath);
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

  void _handleMessage(dynamic message) async {
    try {
      final payload = jsonDecode(message as String);
      _logger.d('WebSocket message received: $payload');

      final event = payload['event'];

      if (event == 'success' || event == 'failed') {
        try {
          final taskId = payload['taskId'];
          if (taskId == null) return;

          final type = payload['type'];
          final error = payload['error'];
          final url = payload['imageUrl'] ?? payload['videoUrl'];
          final lastFrameUrl = payload['lastFrameUrl'];

          final result = GenerationResultModel(
            taskId: taskId,
            event: event,
            type: type,
            url: url,
            thumbnailUrl: lastFrameUrl,
            error: error,
          );

          // Update task in local database
          await DatabaseHelper().updateTaskStatus(
            taskId,
            event == 'success'
                ? WorkshopTaskStatus.success
                : WorkshopTaskStatus.failed,
            url: url,
            thumbnailUrl: lastFrameUrl,
            errorMessage: error,
          );

          // 发送事件通知 UI
          _generationEventController.add(result);
          _logger.i('Task completed event emitted: ${result.taskId}');

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

  Future<void> subscribeTask(
    String taskId, {
    required GenerateTaskType type,
  }) async {
    if (state == null) {
      await connect();
    }
    _sendSubscribe(taskId);
    await _savePendingTask(taskId); // 持久化

    // Insert into local database
    final task = WorkshopTask(
      id: taskId,
      type: type,
      status: WorkshopTaskStatus.processing,
      createdAt: DateTime.now().millisecondsSinceEpoch,
    );
    await DatabaseHelper().insertTask(task);

    // Emit 'processing' event so UI updates immediately
    _generationEventController.add(GenerationResultModel(
      taskId: taskId,
      event: 'processing',
      type: type.name, // Convert enum to string if model expects string, checking model definition...
      // Model defines type as String?
    ));
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
          _sendSubscribe(taskId);
        }
      }
    } catch (e) {
      _logger.e('Failed to restore pending subscriptions: $e');
    }
  }
}
