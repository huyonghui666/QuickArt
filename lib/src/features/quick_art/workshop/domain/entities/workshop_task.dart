enum WorkshopTaskType { image, video }

enum WorkshopTaskStatus { processing, success, failed }

class WorkshopTask {
  final String id;
  final WorkshopTaskType type;
  final WorkshopTaskStatus status;
  final String? url;
  final String? thumbnailUrl;
  final String? errorMessage;

  const WorkshopTask({
    required this.id,
    required this.type,
    required this.status,
    this.url,
    this.thumbnailUrl,
    this.errorMessage,
  });
}
