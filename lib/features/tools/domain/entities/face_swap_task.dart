/// 换脸生成任务实体
class FaceSwapTask {
  /// 构造
  const FaceSwapTask({required this.taskId, this.error});

  /// 任务 ID
  final String taskId;

  /// 错误信息
  final String? error;
}
