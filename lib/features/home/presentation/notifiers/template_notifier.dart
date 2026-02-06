import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:quick_art/core/di/injection_container.dart';
import 'package:quick_art/features/home/domain/entities/image_template_page.dart';
import 'package:quick_art/features/home/domain/entities/image_template.dart';

part 'template_notifier.g.dart';

@riverpod
class Templates extends _$Templates {
  bool _isLoadingMore = false;
  static const int _pageSize = 20;

  @override
  FutureOr<ImageTemplatePage> build({String? category}) async {
    _isLoadingMore = false;
    return _fetchTemplates(page: 0);
  }

  Future<ImageTemplatePage> _fetchTemplates({required int page}) async {
    return ref
        .read(getTemplatesUseCaseProvider)
        .call(category: category, page: page, size: _pageSize);
  }

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
    } catch (e, stack) {
      state = AsyncError(e, stack);
    } finally {
      _isLoadingMore = false;
    }
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _fetchTemplates(page: 0));
  }
}
