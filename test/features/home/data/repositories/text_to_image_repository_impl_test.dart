import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quick_art/core/error/exception.dart';
import 'package:quick_art/features/home/data/datasources/text_to_image_remote_data_source.dart';
import 'package:quick_art/features/home/data/models/image_generation_task_model.dart';
import 'package:quick_art/features/home/data/repositories/text_to_image_repository_impl.dart';

class MockTextToImageRemoteDataSource extends Mock
    implements ITextToImageRemoteDataSource {}

void main() {
  late TextToImageRepositoryImpl repository;
  late MockTextToImageRemoteDataSource mockRemoteDataSource;

  setUp(() {
    mockRemoteDataSource = MockTextToImageRemoteDataSource();
    repository = TextToImageRepositoryImpl(mockRemoteDataSource);
  });

  const tPrompt = 'test prompt';
  const tImageGenerationTaskModel = ImageGenerationTaskModel(taskId: '123');
  final tImageGenerationTask = tImageGenerationTaskModel.toEntity();

  test(
    'should return ImageGenerationTask when remote data source call is '
    'successful',
    () async {
      // Arrange
      when(
        () => mockRemoteDataSource.submitTask(any()),
      ).thenAnswer((_) async => tImageGenerationTaskModel);

      // Act
      final result = await repository.submitTask(tPrompt);

      // Assert
      expect(result, tImageGenerationTask);
      verify(() => mockRemoteDataSource.submitTask(tPrompt)).called(1);
    },
  );

  test('should rethrow exception when remote data source call fails', () async {
    // Arrange
    final exception = NetworkException('Error');
    when(() => mockRemoteDataSource.submitTask(any())).thenThrow(exception);

    // Act & Assert
    expect(
      () => repository.submitTask(tPrompt),
      throwsA(isA<NetworkException>()),
    );
    verify(() => mockRemoteDataSource.submitTask(tPrompt)).called(1);
  });
}
