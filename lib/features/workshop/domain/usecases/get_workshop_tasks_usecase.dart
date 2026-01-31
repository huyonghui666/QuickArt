import 'package:quick_art/features/workshop/domain/entities/workshop_task.dart';
import 'package:quick_art/features/workshop/domain/repositories/workshop_repository.dart';

class GetWorkshopTasksUseCase {
  final WorkshopRepository _repository;

  GetWorkshopTasksUseCase(this._repository);

  Future<List<WorkshopTask>> execute() {
    return _repository.getTasks();
  }
}
