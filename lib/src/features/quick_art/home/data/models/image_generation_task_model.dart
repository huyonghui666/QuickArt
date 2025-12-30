import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quick_art/src/features/quick_art/home/domain/entities/image_generation_task.dart';

part 'image_generation_task_model.freezed.dart';
part 'image_generation_task_model.g.dart';

@freezed
class ImageGenerationTaskModel with _$ImageGenerationTaskModel {
  const factory ImageGenerationTaskModel({
    required String taskId,
    String? imageUrl,
    String? error,
  }) = _ImageGenerationTaskModel;

  factory ImageGenerationTaskModel.fromJson(Map<String, dynamic> json) =>
      _$ImageGenerationTaskModelFromJson(json);
}

extension ImageGenerationTaskModelX on ImageGenerationTaskModel {
  ImageGenerationTask toEntity() {
    if (error != null) {
      return ImageGenerationTask.failed(taskId: taskId, error: error!);
    }
    // else if (imageUrl != null) {
    //   return ImageGenerationTask.success(taskId: taskId, imageUrl: imageUrl!);
    // }
    else {
      return ImageGenerationTask.success(taskId: taskId, imageUrl: imageUrl!);
      //return VideoGenerationTask.waiting(taskId: taskId);
    }
  }
}
