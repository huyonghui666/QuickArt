import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quick_art/src/features/quick_art/tools/domain/entities/video_generation_task.dart';

part 'video_generation_task_model.freezed.dart';
part 'video_generation_task_model.g.dart';

@freezed
class VideoGenerationTaskModel with _$VideoGenerationTaskModel {
  const factory VideoGenerationTaskModel({
    required String taskId,
    String? videoUrl,
    String? error,
  }) = _VideoGenerationTaskModel;

  factory VideoGenerationTaskModel.fromJson(Map<String, dynamic> json) =>
      _$VideoGenerationTaskModelFromJson(json);
}

// 扩展转换（严格分层，只在这里做 Model → Entity）
extension VideoGenerationTaskModelX on VideoGenerationTaskModel {
  VideoGenerationTask toEntity() {
    if (error != null) {
      return VideoGenerationTask.failed(taskId: taskId, error: error!);
    }
    // else if (videoUrl != null) {
    //   return VideoGenerationTask.success(taskId: taskId, videoUrl: videoUrl!);
    // }
    else {
      return VideoGenerationTask.success(taskId: taskId, videoUrl: videoUrl!);
      //return VideoGenerationTask.waiting(taskId: taskId);
    }
  }
}
