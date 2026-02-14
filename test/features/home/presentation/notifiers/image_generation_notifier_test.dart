import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quick_art/core/di/injection_container.dart';
import 'package:quick_art/core/error/exception.dart';
import 'package:quick_art/core/models/generate_task_type.dart';
import 'package:quick_art/core/websocket/websocket_provider.dart';
import 'package:quick_art/features/home/domain/entities/image_generation_task.dart';
import 'package:quick_art/features/home/domain/usecases/text_to_generate_image_usecase.dart';
import 'package:quick_art/features/home/presentation/notifiers/image_generation_provider.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class MockTextToGenerateImageUseCase extends Mock
    implements TextToGenerateImageUseCase {}

class FakeWebSocketNotifier extends WebSocketNotifier {
  final List<String> subscribedTasks = [];

  @override
  WebSocketChannel? build() {
    return null;
  }

  @override
  Future<void> subscribeTask(
    String taskId, {
    required GenerateTaskType type,
  }) async {
    subscribedTasks.add(taskId);
  }
}

void main() {
  late ProviderContainer container;
  late MockTextToGenerateImageUseCase mockUseCase;
  late FakeWebSocketNotifier fakeWebSocketNotifier;

  setUpAll(() {
    registerFallbackValue(GenerateTaskType.image);
  });

  setUp(() {
    mockUseCase = MockTextToGenerateImageUseCase();
    fakeWebSocketNotifier = FakeWebSocketNotifier();
    container = ProviderContainer(
      overrides: [
        textToGenerateImageUseCaseProvider.overrideWithValue(mockUseCase),
        webSocketNotifierProvider.overrideWith(() => fakeWebSocketNotifier),
      ],
    );
  });

  tearDown(() {
    container.dispose();
  });

  const tPrompt = 'test prompt';
  const tTask = ImageGenerationTask(taskId: '123');

  test('should generate image successfully', () async {
    // Arrange
    when(() => mockUseCase.execute(any())).thenAnswer((_) async => tTask);

    // Act
    final sub = container.listen(
      imageGenerationNotifierProvider(tPrompt),
      (_, __) {},
    );
    await Future.delayed(
      const Duration(milliseconds: 50),
    ); // Wait for async build

    // Assert
    expect(sub.read(), const AsyncData(tTask));

    verify(() => mockUseCase.execute(tPrompt)).called(1);
    expect(fakeWebSocketNotifier.subscribedTasks, contains('123'));
  });

  test('should handle generation error', () async {
    // Arrange
    final exception = NetworkException('Error');
    when(
      () => mockUseCase.execute(any()),
    ).thenAnswer((_) async => throw exception);

    // Act
    final sub = container.listen(
      imageGenerationNotifierProvider(tPrompt),
      (_, __) {},
    );
    await Future.delayed(const Duration(milliseconds: 50));

    // Assert
    expect(sub.read(), isA<AsyncError>());
    verify(() => mockUseCase.execute(tPrompt)).called(1);
    expect(fakeWebSocketNotifier.subscribedTasks, isEmpty);
  });
}
