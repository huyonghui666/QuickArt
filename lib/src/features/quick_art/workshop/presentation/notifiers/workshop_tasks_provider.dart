import 'package:quick_art/src/core/database/database_helper.dart';
import 'package:quick_art/src/core/websocket/websocket_provider.dart';
import 'package:quick_art/src/features/quick_art/workshop/domain/entities/workshop_task.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'workshop_tasks_provider.g.dart';

@riverpod
class WorkshopTasksNotifier extends _$WorkshopTasksNotifier {
  @override
  Future<List<WorkshopTask>> build() async {
    // 监听 WebSocket 结果事件，如果有任务完成，重新加载列表
    ref.listen(generationEventProvider, (previous, next) {
      next.whenData((_) {
        // 只要收到新的任务结果事件，就重新从数据库拉取
        ref.invalidateSelf();
      });
    });

    return _loadTasks();
  }

  Future<List<WorkshopTask>> _loadTasks() async {
    return await DatabaseHelper().getTasks();
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _loadTasks());
  }
}
