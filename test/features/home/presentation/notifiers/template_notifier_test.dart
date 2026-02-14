import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quick_art/core/di/injection_container.dart';
import 'package:quick_art/core/error/exception.dart';
import 'package:quick_art/features/home/domain/entities/image_template.dart';
import 'package:quick_art/features/home/domain/entities/image_template_page.dart';
import 'package:quick_art/features/home/domain/usecases/get_templates_usecase.dart';
import 'package:quick_art/features/home/presentation/notifiers/template_notifier.dart';

class MockGetTemplatesUseCase extends Mock implements GetTemplatesUseCase {}

void main() {
  late ProviderContainer container;
  late MockGetTemplatesUseCase mockUseCase;

  setUp(() {
    mockUseCase = MockGetTemplatesUseCase();
    container = ProviderContainer(
      overrides: [getTemplatesUseCaseProvider.overrideWithValue(mockUseCase)],
    );
  });

  tearDown(() {
    container.dispose();
  });

  const tImageTemplatePage = ImageTemplatePage(
    items: [],
    currentPage: 0,
    totalPages: 1,
    hasMore: false,
  );

  const tImageTemplatePageWithMore = ImageTemplatePage(
    items: [
      ImageTemplate(id: '1', imageUrl: 'url', name: {'en': 'name'}),
    ],
    currentPage: 0,
    totalPages: 2,
    hasMore: true,
  );

  const tImageTemplatePageNext = ImageTemplatePage(
    items: [
      ImageTemplate(id: '2', imageUrl: 'url2', name: {'en': 'name2'}),
    ],
    currentPage: 1,
    totalPages: 2,
    hasMore: false,
  );

  test('should fetch templates initially', () async {
    // Arrange
    when(
      () => mockUseCase(category: any(named: 'category'), page: 0, size: 20),
    ).thenAnswer((_) async => tImageTemplatePage);

    // Act
    final sub = container.listen(templatesProvider(category: null), (_, __) {});

    // Wait for async build to complete
    await Future.delayed(Duration.zero);

    // Assert
    expect(sub.read(), AsyncData(tImageTemplatePage));
    verify(() => mockUseCase(category: '', page: 0, size: 20)).called(1);
  });

  test('should handle initial fetch error', () async {
    // Arrange
    final exception = NetworkException('Error');
    when(
      () => mockUseCase(category: any(named: 'category'), page: 0, size: 20),
    ).thenThrow(exception);

    // Act
    final sub = container.listen(templatesProvider(category: null), (_, __) {});

    // Wait for async build to complete
    await Future.delayed(Duration.zero);

    // Assert
    expect(sub.read(), isA<AsyncError>());
    verify(() => mockUseCase(category: '', page: 0, size: 20)).called(1);
  });

  test('should load more templates', () async {
    // Arrange
    when(
      () => mockUseCase(category: '', page: 0, size: 20),
    ).thenAnswer((_) async => tImageTemplatePageWithMore);

    when(
      () => mockUseCase(category: '', page: 1, size: 20),
    ).thenAnswer((_) async => tImageTemplatePageNext);

    // Initialize
    final sub = container.listen(templatesProvider(category: null), (_, __) {});
    await Future.delayed(Duration.zero);

    // Act
    await container.read(templatesProvider(category: null).notifier).loadMore();

    // Assert
    final state = sub.read();
    expect(
      state.value!.items.length,
      2,
    ); // 1 from first page + 1 from second page
    expect(state.value!.currentPage, 1);
    expect(state.value!.hasMore, false);

    verify(() => mockUseCase(category: '', page: 0, size: 20)).called(1);
    verify(() => mockUseCase(category: '', page: 1, size: 20)).called(1);
  });

  test('should refresh templates', () async {
    // Arrange
    when(
      () => mockUseCase(category: '', page: 0, size: 20),
    ).thenAnswer((_) async => tImageTemplatePage);

    // Initialize
    final sub = container.listen(templatesProvider(category: null), (_, __) {});
    await Future.delayed(Duration.zero);

    // Act
    await container.read(templatesProvider(category: null).notifier).refresh();

    // Assert
    expect(sub.read(), AsyncData(tImageTemplatePage));
    // Called twice: once for initial load, once for refresh
    verify(() => mockUseCase(category: '', page: 0, size: 20)).called(2);
  });
}
