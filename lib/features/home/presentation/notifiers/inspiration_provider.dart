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
List<InspirationCategoryModel> inspirationCategories(Ref ref) {
  return [
    const InspirationCategoryModel(
      type: InspirationCategoryType.newest,
      cards: [],
    ),
    const InspirationCategoryModel(
      type: InspirationCategoryType.manga,
      cards: [],
    ),
    const InspirationCategoryModel(
      type: InspirationCategoryType.photography,
      cards: [],
    ),
    const InspirationCategoryModel(
      type: InspirationCategoryType.watercolor,
      cards: [],
    ),
    const InspirationCategoryModel(
      type: InspirationCategoryType.funny,
      cards: [],
    ),
    const InspirationCategoryModel(
      type: InspirationCategoryType.tattoo,
      cards: [],
    ),
    const InspirationCategoryModel(
      type: InspirationCategoryType.cyberpunk,
      cards: [],
    ),
    const InspirationCategoryModel(
      type: InspirationCategoryType.surrealism,
      cards: [],
    ),
    const InspirationCategoryModel(
      type: InspirationCategoryType.christmas,
      cards: [],
    ),
  ];
}

class InspirationCardModel {
  const InspirationCardModel({required this.imageUrl, this.prompt});

  final String imageUrl;
  final String? prompt;
}

class InspirationCategoryModel {
  const InspirationCategoryModel({required this.type, required this.cards});

  final InspirationCategoryType type;
  final List<InspirationCardModel> cards;
}
