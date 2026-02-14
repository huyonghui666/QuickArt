import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quick_art/features/home/domain/entities/image_template_page.dart';
import 'package:quick_art/features/home/domain/repositories/template_repository.dart';
import 'package:quick_art/features/home/domain/usecases/get_templates_usecase.dart';

class MockTemplateRepository extends Mock implements TemplateRepository {}

void main() {
  late GetTemplatesUseCase useCase;
  late MockTemplateRepository mockRepository;

  setUp(() {
    mockRepository = MockTemplateRepository();
    useCase = GetTemplatesUseCase(mockRepository);
  });

  const tImageTemplatePage = ImageTemplatePage(
    items: [],
    currentPage: 0,
    totalPages: 1,
    hasMore: false,
  );

  test('should get templates from the repository', () async {
    // Arrange
    when(
      () => mockRepository.getImageTemplates(
        category: any(named: 'category'),
        page: any(named: 'page'),
        size: any(named: 'size'),
      ),
    ).thenAnswer((_) async => tImageTemplatePage);

    // Act
    final result = await useCase(category: 'test');

    // Assert
    expect(result, tImageTemplatePage);
    verify(
      () => mockRepository.getImageTemplates(category: 'test'),
    ).called(1);
    verifyNoMoreInteractions(mockRepository);
  });
}
