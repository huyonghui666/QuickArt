import 'package:quick_art/features/workshop/domain/entities/workshop_task.dart';

abstract class WorkshopRepository {
  Future<List<WorkshopTask>> getTasks();
  Future<WorkshopTask?> getTaskById(String id);
  Future<void> insertTask(WorkshopTask task);
  Future<void> updateTask(WorkshopTask task);
  Future<void> updateTaskStatus(
    String id,
    WorkshopTaskStatus status, {
    String? url,
    String? thumbnailUrl,
    String? errorMessage,
  });
}
