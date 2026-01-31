import 'package:quick_art/core/di/injection_container.dart';
import 'package:quick_art/features/workshop/domain/entities/workshop_task.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'workshop_tasks_provider.g.dart';

@riverpod
class WorkshopTasksNotifier extends _$WorkshopTasksNotifier {
  @override
  Future<List<WorkshopTask>> build() async {
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
}
