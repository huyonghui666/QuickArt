import 'dart:async';

import 'package:quick_art/core/di/injection_container.dart';
import 'package:quick_art/features/home/domain/entities/image_template_page.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'template_notifier.g.dart';

@riverpod
/// 模板数据 Notifier
class Templates extends _$Templates {
  bool _isLoadingMore = false;

  @override
  AsyncValue<ImageTemplatePage> build({String? category}) {
    _isLoadingMore = false;
    // 忽略未等待的 Future，因为这是初始化时的副作用
    unawaited(
      _fetchTemplates(page: 0)
          .then((value) {
            state = AsyncData(value);
          })
          .catchError((Object error, StackTrace stackTrace) {
            state = AsyncError(error, stackTrace);
          }),
    );
    return const AsyncLoading();
  }

  /// 获取图片模板数据
  Future<ImageTemplatePage> _fetchTemplates({required int page}) async {
    return ref
        .read(getTemplatesUseCaseProvider)
        .call(category: category ?? '', page: page);
  }

  /// 加载下一页数据
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
      final nextPage = currentState.nextPage;
      final newPage = await _fetchTemplates(page: nextPage);

      state = AsyncData(
        ImageTemplatePage(
          items: [...currentState.items, ...newPage.items],
          currentPage: newPage.currentPage,
          totalPages: newPage.totalPages,
          hasMore: newPage.hasMore,
        ),
      );
    } on Exception catch (e, stack) {
      state = AsyncError(e, stack);
    } finally {
      _isLoadingMore = false;
    }
  }

  /// 刷新（暂时没有）
  Future<void> refresh() async {
    state = const AsyncLoading();
    try {
      final result = await _fetchTemplates(page: 0);
      state = AsyncData(result);
    } on Exception catch (e, stack) {
      state = AsyncError(e, stack);
    }
  }
}
