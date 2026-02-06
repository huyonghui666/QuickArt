import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:quick_art/core/di/injection_container.dart';
import 'package:quick_art/features/home/domain/entities/image_template.dart';

part 'template_notifier.g.dart';

@riverpod
class Templates extends _$Templates {
  int _page = 0;
  bool _hasMore = true;
  bool _isLoadingMore = false;
  static const int _pageSize = 20;

  @override
  FutureOr<List<ImageTemplate>> build({String? category}) async {
    _page = 0;
    _hasMore = true;
    _isLoadingMore = false;
    return _fetchTemplates(page: 0);
  }

  Future<List<ImageTemplate>> _fetchTemplates({required int page}) async {
    final templates = await ref
        .read(getTemplatesUseCaseProvider)
        .call(category: category, page: page, size: _pageSize);
    if (templates.length < _pageSize) {
      _hasMore = false;
    }
    return templates;
  }

  Future<void> loadMore() async {
    if (state.isLoading || !_hasMore || _isLoadingMore) return;

    _isLoadingMore = true;

    try {
      final newTemplates = await _fetchTemplates(page: _page + 1);
      if (newTemplates.isNotEmpty) {
        _page++;
        final currentList = state.value ?? [];
        state = AsyncData([...currentList, ...newTemplates]);
      }
    } catch (e, stack) {
      // Quietly fail or handle error
      // state = AsyncError(e, stack); // Uncomment if we want to show error state
    } finally {
      _isLoadingMore = false;
    }
  }
}
