import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quick_art/features/tools/domain/entities/video_generation_task.dart';

part 'video_generation_task_model.freezed.dart';
part 'video_generation_task_model.g.dart';

@freezed
class VideoGenerationTaskModel with _$VideoGenerationTaskModel {
  const VideoGenerationTaskModel._();

  const factory VideoGenerationTaskModel({
    required String taskId,
    String? videoUrl,
    String? error,
  }) = _VideoGenerationTaskModel;

  factory VideoGenerationTaskModel.fromJson(Map<String, dynamic> json) =>
      _$VideoGenerationTaskModelFromJson(json);

  VideoGenerationTask toEntity() {
    return VideoGenerationTask(
      taskId: taskId,
      videoUrl: videoUrl,
      error: error,
    );
  }
}
