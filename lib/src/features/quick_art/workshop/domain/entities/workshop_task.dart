import 'package:quick_art/src/shared/models/generate_task_type.dart';

enum WorkshopTaskStatus { processing, success, failed }

class WorkshopTask {
  final String id;
  final GenerateTaskType type;
  final WorkshopTaskStatus status;
  final String? url;
  final String? thumbnailUrl;
  final String? errorMessage;
  final int createdAt;

  const WorkshopTask({
    required this.id,
    required this.type,
    required this.status,
    this.url,
    this.thumbnailUrl,
    this.errorMessage,
    required this.createdAt,
  });

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

  factory WorkshopTask.fromMap(Map<String, dynamic> map) {
    return WorkshopTask(
      id: map['id'],
      type: GenerateTaskType.values.firstWhere((e) => e.name == map['type']),
      status: WorkshopTaskStatus.values.firstWhere(
        (e) => e.name == map['status'],
      ),
      url: map['url'],
      thumbnailUrl: map['thumbnail_url'],
      errorMessage: map['error_message'],
      createdAt: map['created_at'] ?? DateTime.now().millisecondsSinceEpoch,
    );
  }
}
