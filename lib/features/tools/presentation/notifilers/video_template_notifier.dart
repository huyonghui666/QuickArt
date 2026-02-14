import 'package:quick_art/core/di/injection_container.dart';
import 'package:quick_art/features/tools/domain/entities/video_template_page.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'video_template_notifier.g.dart';

@riverpod
/// 视频模板状态管理 Notifier
class VideoTemplates extends _$VideoTemplates {
  bool _isLoadingMore = false;

  @override
  FutureOr<VideoTemplatePage> build({required String category}) async {
    return _fetch(page: 0);
  }

  /// 获取数据
  Future<VideoTemplatePage> _fetch({required int page}) async {
    return ref
        .read(getVideoTemplatesUseCaseProvider)
        .call(category: category, page: page);
  }

  /// 加载更多
  Future<void> loadMore() async {
    final currentState = state.value;
    if (state.isLoading ||
        currentState == null ||
        !currentState.hasMore ||
        _isLoadingMore) {
      return;
    }

    _isLoadingMore = true;

    try {
      final nextPage = currentState.currentPage + 1;
      final newPage = await _fetch(page: nextPage);

      state = AsyncData(
        VideoTemplatePage(
          items: [...currentState.items, ...newPage.items],
          currentPage: newPage.currentPage,
          totalPages: newPage.totalPages,
          hasMore: newPage.hasMore,
        ),
      );
    } on Exception catch (e, stack) {
      // 保持现有数据，但设置错误状态
      state = AsyncError(e, stack);
    } finally {
      _isLoadingMore = false;
    }
  }

  /// 刷新数据
  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _fetch(page: 0));
  }
}
