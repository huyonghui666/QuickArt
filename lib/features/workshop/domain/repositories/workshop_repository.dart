import 'package:quick_art/features/workshop/domain/entities/workshop_task.dart';

/// 工作室仓库抽象
abstract class WorkshopRepository {
  /// 获取工作室生成的所有任务
  Future<List<WorkshopTask>> getTasks();
  /// 通过id获取
  Future<WorkshopTask?> getTaskById(String id);
  /// 插入
  Future<void> insertTask(WorkshopTask task);
  /// 更新
  Future<void> updateTask(WorkshopTask task);
  /// 更新某个数据状态
  Future<void> updateTaskStatus(
    String id,
    WorkshopTaskStatus status, {
    String? url,
    String? thumbnailUrl,
    String? errorMessage,
  });
}
