import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quick_art/core/localization/l10n/app_localizations.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'inspiration_provider.g.dart';

/// 灵感分类类型枚举
enum InspirationCategoryType {
  //由于使用new与关键字new冲突，所以使用newest然后转化为new即可
  /// 最新
  newest,
  /// 漫画
  manga,
  /// 摄影
  photography,
  /// 水彩
  watercolor,
  /// 有趣
  funny,
  /// 纹身
  tattoo,
  /// 赛博朋克
  cyberpunk,
  /// 超现实主义
  surrealism,
  /// 圣诞
  christmas;

  /// 获取本地化标签
  String getLabel(AppLocalizations l10n) {
    return switch (this) {
      InspirationCategoryType.newest => l10n.inspiration_new,
      InspirationCategoryType.manga => l10n.inspiration_manga,
      InspirationCategoryType.photography => l10n.inspiration_photography,
      InspirationCategoryType.watercolor => l10n.inspiration_watercolor,
      InspirationCategoryType.funny => l10n.inspiration_funny,
      InspirationCategoryType.tattoo => l10n.inspiration_tattoo,
      InspirationCategoryType.cyberpunk => l10n.inspiration_cyberpunk,
      InspirationCategoryType.surrealism => l10n.inspiration_surrealism,
      InspirationCategoryType.christmas => l10n.inspiration_christmas,
    };
  }
}

/// 灵感分类 Provider
@riverpod
List<InspirationCategoryType> inspirationCategories(Ref ref) {
  return InspirationCategoryType.values;
}
