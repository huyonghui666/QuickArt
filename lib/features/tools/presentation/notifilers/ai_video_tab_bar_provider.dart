import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ai_video_tab_bar_provider.g.dart';

/// 视频模板的tab
@riverpod
List<String> aiVideoTabs(Ref ref) {
  return [
    'Hug',
    'kiss',
    'hug',
    'ai_effects',
    'style_transfer',
    'rich_life',
    'cross_dimension',
    'animal_effects',
    'romantic_day',
    'movie_life',
    'cross_dressing',
    'dance',
    'micro_world',
  ];
}
