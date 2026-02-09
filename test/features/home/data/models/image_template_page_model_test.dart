import 'package:flutter_test/flutter_test.dart';
import 'package:quick_art/features/home/data/models/image_template_model.dart';
import 'package:quick_art/features/home/data/models/image_template_page_model.dart';
import 'package:quick_art/features/home/domain/entities/image_template.dart';
import 'package:quick_art/features/home/domain/entities/image_template_page.dart';

void main() {
  const tId = '1';
  const tName = {'en': 'Test Template'};
  const tImageUrl = 'http://test.com/image.jpg';
  
  const tImageTemplateModel = ImageTemplateModel(
    id: tId,
    name: tName,
    imageUrl: tImageUrl,
  );

  const tImageTemplate = ImageTemplate(
    id: tId,
    name: tName,
    imageUrl: tImageUrl,
  );

  const tImageTemplatePageModel = ImageTemplatePageModel(
    content: [tImageTemplateModel],
    number: 0,
    totalPages: 1,
    last: true,
  );

  const tImageTemplatePage = ImageTemplatePage(
    items: [tImageTemplate],
    currentPage: 0,
    totalPages: 1,
    hasMore: false,
  );

  group('ImageTemplatePageModel', () {
    test('should return a valid model from JSON', () {
      // Arrange
      final Map<String, dynamic> jsonMap = {
        'content': [
          {
            'id': tId,
            'name': tName,
            'imageUrl': tImageUrl,
          }
        ],
        'number': 0,
        'totalPages': 1,
        'last': true,
      };

      // Act
      final result = ImageTemplatePageModel.fromJson(jsonMap);

      // Assert
      expect(result, tImageTemplatePageModel);
    });

    test('should return a valid entity from model', () {
      // Act
      final result = tImageTemplatePageModel.toEntity();

      // Assert
      expect(result.items.length, tImageTemplatePage.items.length);
      expect(result.items.first.id, tImageTemplatePage.items.first.id);
      expect(result.currentPage, tImageTemplatePage.currentPage);
      expect(result.totalPages, tImageTemplatePage.totalPages);
      expect(result.hasMore, tImageTemplatePage.hasMore);
    });
  });
}
