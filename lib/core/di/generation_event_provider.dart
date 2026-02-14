import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quick_art/core/models/generation_result_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generation_event_provider.g.dart';

/// 全局任务结果事件流控制器
/// 使用 Provider 管理 Controller，确保可测试性和生命周期管理
@Riverpod(keepAlive: true)
StreamController<GenerationResultModel> generationEventController(Ref ref) {
  final controller = StreamController<GenerationResultModel>.broadcast();
  ref.onDispose(controller.close);
  return controller;
}

/// 全局任务结果事件流
/// 用于通知 UI 任务完成（成功或失败）
@Riverpod(keepAlive: true)
Stream<GenerationResultModel> generationEvent(Ref ref) {
  return ref.watch(generationEventControllerProvider).stream;
}
