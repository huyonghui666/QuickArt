import 'package:quick_art/features/workshop/domain/entities/workshop_task.dart';
import 'package:quick_art/features/workshop/domain/repositories/workshop_repository.dart';

/// 获取工作室数据任务用例
class GetWorkshopTasksUseCase {
  /// 构造
  GetWorkshopTasksUseCase(this._repository);
  final WorkshopRepository _repository;
  /// 执行
  Future<List<WorkshopTask>> execute() {
    return _repository.getTasks();
  }
}
