import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:quick_art/core/localization/l10n/app_localizations.dart';

part 'inspiration_provider.g.dart';

enum InspirationCategoryType {
  newest,
  manga,
  photography,
  watercolor,
  funny,
  tattoo,
  cyberpunk,
  surrealism,
  christmas;

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

@riverpod
List<InspirationCategoryType> inspirationCategories(Ref ref) {
  return InspirationCategoryType.values;
}
