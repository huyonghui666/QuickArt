/// 视频生成任务实体
class VideoGenerationTask {
  /// 构造
  const VideoGenerationTask({required this.taskId, this.videoUrl, this.error});
  /// 任务id
  final String taskId;
  /// 视频url
  final String? videoUrl;
  /// 错误信息
  final String? error;
}
