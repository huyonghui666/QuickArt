import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_generation_task.freezed.dart';
part 'image_generation_task.g.dart';

@freezed
class ImageGenerationTask with _$ImageGenerationTask {
  const factory ImageGenerationTask.success({
    required String taskId,
    required String imageUrl,
  }) = _Success;

  const factory ImageGenerationTask.failed({
    required String taskId,
    required String error,
  }) = _Failed;

  factory ImageGenerationTask.fromJson(Map<String, dynamic> json) =>
      _$ImageGenerationTaskFromJson(json);
}
