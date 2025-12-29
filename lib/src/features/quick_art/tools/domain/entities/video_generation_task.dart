import 'package:freezed_annotation/freezed_annotation.dart';

part 'video_generation_task.freezed.dart';
part 'video_generation_task.g.dart';

@freezed
class VideoGenerationTask with _$VideoGenerationTask {
  const factory VideoGenerationTask.submitting({required String prompt}) =
      _Submitting;

  const factory VideoGenerationTask.waiting({required String taskId}) =
      _Waiting;

  const factory VideoGenerationTask.success({
    required String taskId,
    required String videoUrl,
  }) = _Success;

  const factory VideoGenerationTask.failed({
    required String taskId,
    required String error,
  }) = _Failed;

  factory VideoGenerationTask.fromJson(Map<String, dynamic> json) =>
      _$VideoGenerationTaskFromJson(json);
}
