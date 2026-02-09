import 'package:flutter_test/flutter_test.dart';
import 'package:quick_art/features/home/data/models/image_generation_task_model.dart';
import 'package:quick_art/features/home/domain/entities/image_generation_task.dart';

void main() {
  const tTaskId = '123';
  const tImageGenerationTaskModel = ImageGenerationTaskModel(taskId: tTaskId);
  const tImageGenerationTask = ImageGenerationTask(taskId: tTaskId);

  group('ImageGenerationTaskModel', () {
    test('should return a valid model from JSON', () {
      // Arrange
      final Map<String, dynamic> jsonMap = {'taskId': tTaskId};

      // Act
      final result = ImageGenerationTaskModel.fromJson(jsonMap);

      // Assert
      expect(result, tImageGenerationTaskModel);
    });

    test('should return a valid entity from model', () {
      // Act
      final result = tImageGenerationTaskModel.toEntity();

      // Assert
      expect(result, tImageGenerationTask);
    });
  });
}
