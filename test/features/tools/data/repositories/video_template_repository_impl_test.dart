import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quick_art/core/error/exception.dart';
import 'package:quick_art/features/tools/data/datasources/video_template_remote_data_source.dart';
import 'package:quick_art/features/tools/data/models/video_template_model.dart';
import 'package:quick_art/features/tools/data/models/video_template_page_model.dart';
import 'package:quick_art/features/tools/data/repositories/video_template_repository_impl.dart';

// Create a Mock class using Mocktail
class MockVideoTemplateRemoteDataSource extends Mock
    implements IVideoTemplateRemoteDataSource {}

void main() {
  late VideoTemplateRepositoryImpl repository;
  late MockVideoTemplateRemoteDataSource mockRemoteDataSource;

  setUp(() {
    mockRemoteDataSource = MockVideoTemplateRemoteDataSource();
    repository = VideoTemplateRepositoryImpl(mockRemoteDataSource);
  });

  group('VideoTemplateRepositoryImpl', () {
    const tVideoTemplateModel = VideoTemplateModel(
      id: '1',
      name: {'en': 'Test Template', 'zh': '测试模板'},
      description: 'Test Description',
      coverUrl: 'http://test.com/image.jpg',
      videoUrl: 'http://test.com/video.mp4',
      category: 'test_category',
    );

    const tVideoTemplatePageModel = VideoTemplatePageModel(
      content: [tVideoTemplateModel],
      totalPages: 1,
      totalElements: 1,
      last: true,
      size: 20,
      number: 0,
    );

    test(
      'should return VideoTemplatePage when remote data source call is successful',
      () async {
        // Arrange 1. 设置模拟行为：当调用getVideoTemplates时，返回预设的页面模型
        when(
          () => mockRemoteDataSource.getVideoTemplates(
            category: any(named: 'category'),
            page: any(named: 'page'),
            size: any(named: 'size'),
          ),
        ).thenAnswer((_) async => tVideoTemplatePageModel);

        // Act 2. 执行被测方法：调用repository的真实逻辑，其中有一段逻辑将模拟tVideoTemplatePageModel转换为Entity
        final result = await repository.getVideoTemplates(page: 0, size: 20);

        // repository内部会调用 mockRemoteDataSource.getVideoTemplates(page: 0, size: 20)
        // 由于我们用了any匹配器，任何参数都会返回预设数据
        // Assert 3. 验证返回结果
        expect(result.items.length, 1);
        expect(result.items.first.id, '1');
        expect(result.currentPage, 0);
        expect(result.hasMore, false);

        // 4. 验证依赖调用：确认remoteDataSource被正确调用
        verify(
          () => mockRemoteDataSource.getVideoTemplates(page: 0, size: 20),
        ).called(1);
      },
    );

    test(
      'should throw NetworkException when remote data source call fails',
      () async {
        // Arrange
        when(
          () => mockRemoteDataSource.getVideoTemplates(
            category: any(named: 'category'),
            page: any(named: 'page'),
            size: any(named: 'size'),
          ),
        ).thenThrow(NetworkException('Server Error', code: '500'));

        // Act & Assert
        expect(
          () => repository.getVideoTemplates(page: 0, size: 20),
          throwsA(isA<NetworkException>()),
        );

        verify(
          () => mockRemoteDataSource.getVideoTemplates(page: 0, size: 20),
        ).called(1);
      },
    );
  });
}
