import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quick_art/core/error/exception.dart';
import 'package:quick_art/features/auth_login/data/datasources/auth_login_local_data_source.dart';
import 'package:quick_art/features/home/data/datasources/Remote_data_source/text_to_image_remote_data_source.dart';
import 'package:quick_art/features/home/data/models/image_generation_task_model.dart';
import 'package:quick_art/features/home/data/repositories/text_to_image_repository_impl.dart';

class MockTextToImageRemoteDataSource extends Mock
    implements ITextToImageRemoteDataSource {}

class MockAuthLoginLocalDataSource extends Mock
    implements IAuthLoginLocalDataSource {}

void main() {
  late TextToImageRepositoryImpl repository;
  late MockTextToImageRemoteDataSource mockRemoteDataSource;
  late MockAuthLoginLocalDataSource mockLocalDataSource;

  setUp(() {
    mockRemoteDataSource = MockTextToImageRemoteDataSource();
    mockLocalDataSource = MockAuthLoginLocalDataSource();
    repository = TextToImageRepositoryImpl(
      mockRemoteDataSource,
      mockLocalDataSource,
    );
  });

  const tPrompt = 'test prompt';
  const tToken = 'test-token';
  const tImageGenerationTaskModel = ImageGenerationTaskModel(taskId: '123');
  final tImageGenerationTask = tImageGenerationTaskModel.toEntity();

  test(
    'should return ImageGenerationTask when remote data source call is '
    'successful',
    () async {
      when(
        () => mockLocalDataSource.getJwtToken(),
      ).thenAnswer((_) async => tToken);
      when(
        () => mockRemoteDataSource.submitTextToImageTask(
          prompt: any(named: 'prompt'),
          token: any(named: 'token'),
        ),
      ).thenAnswer((_) async => tImageGenerationTaskModel);

      final result = await repository.submitTextToImageTask(tPrompt);

      expect(result, tImageGenerationTask);
      verify(() => mockLocalDataSource.getJwtToken()).called(1);
      verify(
        () => mockRemoteDataSource.submitTextToImageTask(
          prompt: tPrompt,
          token: tToken,
        ),
      ).called(1);
    },
  );

  test('should rethrow exception when remote data source call fails', () async {
    final exception = NetworkException('Error');
    when(
      () => mockLocalDataSource.getJwtToken(),
    ).thenAnswer((_) async => tToken);
      when(
        () => mockRemoteDataSource.submitTextToImageTask(
          prompt: any(named: 'prompt'),
          token: any(named: 'token'),
        ),
      ).thenThrow(exception);

    expect(
      () => repository.submitTextToImageTask(tPrompt),
      throwsA(isA<NetworkException>()),
    );
    verify(() => mockLocalDataSource.getJwtToken()).called(1);
    verify(
      () => mockRemoteDataSource.submitTextToImageTask(
        prompt: tPrompt,
        token: tToken,
      ),
    ).called(1);
  });
}
