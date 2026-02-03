import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quick_art/features/home/domain/entities/image_generation_task.dart';

part 'image_generation_task_model.freezed.dart';
part 'image_generation_task_model.g.dart';

@freezed
class ImageGenerationTaskModel with _$ImageGenerationTaskModel {
  const ImageGenerationTaskModel._();

  const factory ImageGenerationTaskModel({required String taskId}) =
      _ImageGenerationTaskModel;

  factory ImageGenerationTaskModel.fromJson(Map<String, dynamic> json) =>
      _$ImageGenerationTaskModelFromJson(json);

  ImageGenerationTask toEntity() {
    return ImageGenerationTask(taskId: taskId);
  }
}
