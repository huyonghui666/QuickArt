import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quick_art/features/home/domain/entities/image_generation_task.dart';
import 'package:quick_art/features/home/domain/repositories/text_to_image_repository.dart';
import 'package:quick_art/features/home/domain/usecases/text_to_generate_image_usecase.dart';

class MockTextToImageRepository extends Mock implements TextToImageRepository {}

void main() {
  late TextToGenerateImageUseCase useCase;
  late MockTextToImageRepository mockRepository;

  setUp(() {
    mockRepository = MockTextToImageRepository();
    useCase = TextToGenerateImageUseCase(mockRepository);
  });

  const tPrompt = 'test prompt';
  const tImageGenerationTask = ImageGenerationTask(taskId: '123');

  test('should submit task to the repository', () async {
    // Arrange
    when(
      () => mockRepository.submitTextToImageTask(any()),
    ).thenAnswer((_) async => tImageGenerationTask);

    // Act
    final result = await useCase.execute(tPrompt);

    // Assert
    expect(result, tImageGenerationTask);
    verify(() => mockRepository.submitTextToImageTask(tPrompt)).called(1);
    verifyNoMoreInteractions(mockRepository);
  });
}
