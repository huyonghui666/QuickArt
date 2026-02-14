import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quick_art/features/tools/domain/entities/video_generation_task.dart';

part 'video_generation_task_model.freezed.dart';
part 'video_generation_task_model.g.dart';

/// 视频生成任务模型
@freezed
abstract class VideoGenerationTaskModel with _$VideoGenerationTaskModel {
  /// 构造
  const factory VideoGenerationTaskModel({
    required String taskId,
    String? videoUrl,
    String? error,
  }) = _VideoGenerationTaskModel;
  const VideoGenerationTaskModel._();

  /// 转换
  factory VideoGenerationTaskModel.fromJson(Map<String, dynamic> json) =>
      _$VideoGenerationTaskModelFromJson(json);
  /// 转换为实体
  VideoGenerationTask toEntity() {
    return VideoGenerationTask(
      taskId: taskId,
      videoUrl: videoUrl,
      error: error,
    );
  }
}
