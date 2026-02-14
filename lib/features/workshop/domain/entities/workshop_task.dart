import 'package:quick_art/core/models/generate_task_type.dart';

/// 任务状态枚举
enum WorkshopTaskStatus {
  /// 处理中
  processing,

  /// 成功
  success,

  /// 失败
  failed,
}

/// 工作坊任务实体
class WorkshopTask {
  /// 构造
  const WorkshopTask({
    required this.id,
    required this.type,
    required this.status,
    required this.createdAt,
    this.url,
    this.thumbnailUrl,
    this.errorMessage,
  });

  /// 转换
  factory WorkshopTask.fromMap(Map<String, dynamic> map) {
    return WorkshopTask(
      id: map['id'] as String,
      type: GenerateTaskType.values.firstWhere(
        (e) => e.name == map['type'] as String,
      ),
      status: WorkshopTaskStatus.values.firstWhere(
        (e) => e.name == map['status'] as String,
      ),
      url: map['url'] as String?,
      thumbnailUrl: map['thumbnail_url'] as String?,
      errorMessage: map['error_message'] as String?,
      createdAt:
          map['created_at'] as int? ?? DateTime.now().millisecondsSinceEpoch,
    );
  }

  /// 任务ID
  final String id;

  /// 任务类型
  final GenerateTaskType type;

  /// 任务状态
  final WorkshopTaskStatus status;

  /// 结果链接
  final String? url;

  /// 缩略图链接
  final String? thumbnailUrl;

  /// 错误信息
  final String? errorMessage;

  /// 创建时间
  final int createdAt;

  /// 转为Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'type': type.name,
      'status': status.name,
      'url': url,
      'thumbnail_url': thumbnailUrl,
      'error_message': errorMessage,
      'created_at': createdAt,
    };
  }
}
