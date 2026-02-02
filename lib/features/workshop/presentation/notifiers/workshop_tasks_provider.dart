import 'package:quick_art/core/di/injection_container.dart';
import 'package:quick_art/core/models/generate_task_type.dart';
import 'package:quick_art/core/models/generation_result_model.dart';
import 'package:quick_art/core/websocket/websocket_provider.dart';
import 'package:quick_art/features/workshop/domain/entities/workshop_task.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'workshop_tasks_provider.g.dart';

@riverpod
class WorkshopTasksNotifier extends _$WorkshopTasksNotifier {
  @override
  Future<List<WorkshopTask>> build() async {
    // 监听 WebSocket 全局事件流，实现实时响应
    ref.listen(generationEventProvider, (previous, next) {
      next.whenData((event) {
        _handleGenerationEvent(event);
      });
    });

    return _fetchTasks();
  }

  Future<List<WorkshopTask>> _fetchTasks() async {
    final useCase = ref.watch(getWorkshopTasksUseCaseProvider);
    return await useCase.execute();
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _fetchTasks());
  }

  /// 处理 WebSocket 推送的任务结果事件
  /// 采用“增量更新”策略，避免全量刷新导致的分页数据丢失或页面闪烁
  void _handleGenerationEvent(GenerationResultModel event) {
    // 如果当前状态不是 data (例如正在加载或报错)，则不处理，直接刷新可能更稳妥
    // 但为了体验，通常我们只在数据已加载时更新
    if (!state.hasValue) return;

    final currentList = state.value!;
    final index = currentList.indexWhere((task) => task.id == event.taskId);

    if (index != -1) {
      // 1. 任务已存在：更新状态
      final oldTask = currentList[index];
      final newTask = WorkshopTask(
        id: oldTask.id,
        type: oldTask.type, // 类型不变
        status: event.event == 'success'
            ? WorkshopTaskStatus.success
            : event.event == 'failed'
            ? WorkshopTaskStatus.failed
            : WorkshopTaskStatus.processing, // 支持 processing 状态更新
        url: event.url ?? oldTask.url,
        thumbnailUrl: event.thumbnailUrl ?? oldTask.thumbnailUrl,
        errorMessage: event.error,
        createdAt: oldTask.createdAt,
      );

      // 创建新列表以触发 State 更新
      final newList = List<WorkshopTask>.from(currentList);
      newList[index] = newTask;
      state = AsyncValue.data(newList);
    } else {
      // 2. 任务不存在：如果是 processing 事件，直接插入头部
      if (event.event == 'processing' && event.type != null) {
        try {
          final taskType = GenerateTaskType.values.firstWhere(
            (e) => e.name == event.type,
          );
          final newTask = WorkshopTask(
            id: event.taskId,
            type: taskType,
            status: WorkshopTaskStatus.processing,
            createdAt: DateTime.now().millisecondsSinceEpoch,
          );

          final newList = [newTask, ...currentList];
          state = AsyncValue.data(newList);
        } catch (_) {
          refresh();
        }
      } else {
        // 其他情况（如直接收到 success 但本地没有任务），刷新列表
        refresh();
      }
    }
  }
}
