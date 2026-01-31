import 'package:quick_art/features/workshop/data/datasources/local_data_source/database_helper.dart';
import 'package:quick_art/features/workshop/domain/entities/workshop_task.dart';
import 'package:quick_art/features/workshop/domain/repositories/workshop_repository.dart';

class WorkshopRepositoryImpl implements WorkshopRepository {
  final DatabaseHelper _databaseHelper;

  WorkshopRepositoryImpl(this._databaseHelper);

  @override
  Future<List<WorkshopTask>> getTasks() async {
    return await _databaseHelper.getTasks();
  }

  @override
  Future<WorkshopTask?> getTaskById(String id) async {
    return await _databaseHelper.getTaskById(id);
  }

  @override
  Future<void> insertTask(WorkshopTask task) async {
    await _databaseHelper.insertTask(task);
  }

  @override
  Future<void> updateTask(WorkshopTask task) async {
    await _databaseHelper.updateTask(task);
  }

  @override
  Future<void> updateTaskStatus(
    String id,
    WorkshopTaskStatus status, {
    String? url,
    String? thumbnailUrl,
    String? errorMessage,
  }) async {
    await _databaseHelper.updateTaskStatus(
      id,
      status,
      url: url,
      thumbnailUrl: thumbnailUrl,
      errorMessage: errorMessage,
    );
  }
}
