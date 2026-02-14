import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quick_art/features/home/domain/entities/image_generation_task.dart';

part 'image_generation_task_model.freezed.dart';
part 'image_generation_task_model.g.dart';

///图片生成DTO
@freezed
abstract class ImageGenerationTaskModel with _$ImageGenerationTaskModel {
  /// 构造函数
  const factory ImageGenerationTaskModel({required String taskId}) =
      _ImageGenerationTaskModel;
  const ImageGenerationTaskModel._();

  /// 从 JSON 创建实例
  factory ImageGenerationTaskModel.fromJson(Map<String, dynamic> json) =>
      _$ImageGenerationTaskModelFromJson(json);

  /// 转换为实体
  ImageGenerationTask toEntity() {
    return ImageGenerationTask(taskId: taskId);
  }
}
