import 'package:flutter_test/flutter_test.dart';
import 'package:quick_art/features/home/data/models/image_template_model.dart';
import 'package:quick_art/features/home/domain/entities/image_template.dart';

void main() {
  const tId = '1';
  const tName = {'en': 'Test Template', 'zh': '测试模板'};
  const tImageUrl = 'http://test.com/image.jpg';
  const tThumbnailUrl = 'http://test.com/thumbnail.jpg';
  const tCategory = 'test_category';
  const tDescription = {'en': 'Test Description'};

  const tImageTemplateModel = ImageTemplateModel(
    id: tId,
    name: tName,
    imageUrl: tImageUrl,
    thumbnailUrl: tThumbnailUrl,
    category: tCategory,
    description: tDescription,
  );

  const tImageTemplate = ImageTemplate(
    id: tId,
    name: tName,
    imageUrl: tImageUrl,
    thumbnailUrl: tThumbnailUrl,
    category: tCategory,
    description: tDescription,
  );

  group('ImageTemplateModel', () {
    test('should return a valid model from JSON', () {
      // Arrange
      final jsonMap = <String, dynamic>{
        'id': tId,
        'name': tName,
        'imageUrl': tImageUrl,
        'thumbnailUrl': tThumbnailUrl,
        'category': tCategory,
        'description': tDescription,
      };

      // Act
      final result = ImageTemplateModel.fromJson(jsonMap);

      // Assert
      expect(result, tImageTemplateModel);
    });

    test('should return a valid entity from model', () {
      // Act
      final result = tImageTemplateModel.toEntity();

      // Assert
      expect(result, tImageTemplate);
    });
  });
}
