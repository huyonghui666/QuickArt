import 'package:freezed_annotation/freezed_annotation.dart';

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
