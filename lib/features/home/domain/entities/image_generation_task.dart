import 'package:equatable/equatable.dart';

class ImageGenerationTask extends Equatable {
  final String taskId;

  const ImageGenerationTask({required this.taskId});

  @override
  List<Object?> get props => [taskId];
}
