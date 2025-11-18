import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_generation_task.freezed.dart';
part 'image_generation_task.g.dart';

@freezed
class ImageGenerationTask with _$ImageGenerationTask {
  const factory ImageGenerationTask({required String taskId}) =
      _ImageGenerationTask;

  factory ImageGenerationTask.fromJson(Map<String, dynamic> json) =>
      _$ImageGenerationTaskFromJson(json);
}
