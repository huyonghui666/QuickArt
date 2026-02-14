import 'package:equatable/equatable.dart';

/// 图片生成任务实体
class ImageGenerationTask extends Equatable {

  /// 构造函数
  const ImageGenerationTask({required this.taskId});

  /// 任务ID
  final String taskId;

  @override
  List<Object?> get props => [taskId];
}
