import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quick_art/core/error/exception.dart';
import 'package:quick_art/features/home/data/datasources/template_remote_data_source.dart';
import 'package:quick_art/features/home/data/models/image_template_model.dart';
import 'package:quick_art/features/home/data/models/image_template_page_model.dart';
import 'package:quick_art/features/home/data/repositories/template_repository_impl.dart';

class MockTemplateRemoteDataSource extends Mock
    implements ITemplateRemoteDataSource {}

void main() {
  late TemplateRepositoryImpl repository;
  late MockTemplateRemoteDataSource mockRemoteDataSource;

  setUp(() {
    mockRemoteDataSource = MockTemplateRemoteDataSource();
    repository = TemplateRepositoryImpl(mockRemoteDataSource);
  });

  group('TemplateRepositoryImpl', () {
    const tImageTemplateModel = ImageTemplateModel(
      id: '1',
      name: {'en': 'Test Template'},
      imageUrl: 'http://test.com/image.jpg',
      category: 'test_category',
    );

    const tImageTemplatePageModel = ImageTemplatePageModel(
      content: [tImageTemplateModel],
      number: 0,
      totalPages: 1,
      last: true,
    );

    test(
      'should return ImageTemplatePage when remote data source call is successful',
      () async {
        // Arrange
        when(
          () => mockRemoteDataSource.getImageTemplates(
            category: any(named: 'category'),
            page: any(named: 'page'),
            size: any(named: 'size'),
          ),
        ).thenAnswer((_) async => tImageTemplatePageModel);

        // Act
        final result = await repository.getImageTemplates(
          category: 'test_category',
          page: 0,
          size: 20,
        );

        // Assert
        expect(result.items.length, 1);
        expect(result.items.first.id, '1');
        expect(result.currentPage, 0);
        expect(result.hasMore, false);

        verify(
          () => mockRemoteDataSource.getImageTemplates(
            category: 'test_category',
            page: 0,
            size: 20,
          ),
        ).called(1);
      },
    );

    test(
      'should rethrow exception when remote data source call fails',
      () async {
        // Arrange
        when(
          () => mockRemoteDataSource.getImageTemplates(
            category: any(named: 'category'),
            page: any(named: 'page'),
            size: any(named: 'size'),
          ),
        ).thenThrow(NetworkException('Server Error'));

        // Act & Assert
        expect(
          () => repository.getImageTemplates(
            category: 'test_category',
            page: 0,
            size: 20,
          ),
          throwsA(isA<NetworkException>()),
        );

        verify(
          () => mockRemoteDataSource.getImageTemplates(
            category: 'test_category',
            page: 0,
            size: 20,
          ),
        ).called(1);
      },
    );
  });
}
