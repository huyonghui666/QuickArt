import 'package:flutter_riverpod/flutter_riverpod.dart';

final aiVideoTabsProvider = Provider<List<String>>((ref) {
  return [
    '流行!',
    '接吻',
    '拥抱',
    'AI特效',
    '风格转换',
    '我的富豪人生',
    '跨次元恋爱',
    '动物特效',
    '浪漫日',
    '电影人生',
    '变装',
    '来跳舞！',
    '微构奇境',
  ];
});