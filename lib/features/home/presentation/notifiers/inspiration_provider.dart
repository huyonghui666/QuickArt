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
      cards: [
        InspirationCardModel(imageUrl: 'https://picsum.photos/seed/1/400/600'),
        InspirationCardModel(imageUrl: 'https://picsum.photos/seed/2/400/600'),
        InspirationCardModel(imageUrl: 'https://picsum.photos/seed/3/400/600'),
        InspirationCardModel(imageUrl: 'https://picsum.photos/seed/4/400/600'),
        InspirationCardModel(imageUrl: 'https://picsum.photos/seed/28/400/600'),
        InspirationCardModel(imageUrl: 'https://picsum.photos/seed/29/400/600'),
        InspirationCardModel(imageUrl: 'https://picsum.photos/seed/30/400/600'),
        InspirationCardModel(imageUrl: 'https://picsum.photos/seed/31/400/600'),
      ],
    ),
    const InspirationCategoryModel(
      type: InspirationCategoryType.manga,
      cards: [
        InspirationCardModel(imageUrl: 'https://picsum.photos/seed/5/400/600'),
        InspirationCardModel(imageUrl: 'https://picsum.photos/seed/6/400/600'),
      ],
    ),
    const InspirationCategoryModel(
      type: InspirationCategoryType.photography,
      cards: [
        InspirationCardModel(imageUrl: 'https://picsum.photos/seed/7/400/600'),
        InspirationCardModel(imageUrl: 'https://picsum.photos/seed/8/400/600'),
        InspirationCardModel(imageUrl: 'https://picsum.photos/seed/9/400/600'),
      ],
    ),
    const InspirationCategoryModel(
      type: InspirationCategoryType.watercolor,
      cards: [
        InspirationCardModel(imageUrl: 'https://picsum.photos/seed/10/400/600'),
        InspirationCardModel(imageUrl: 'https://picsum.photos/seed/11/400/600'),
        InspirationCardModel(imageUrl: 'https://picsum.photos/seed/12/400/600'),
        InspirationCardModel(imageUrl: 'https://picsum.photos/seed/13/400/600'),
      ],
    ),
    const InspirationCategoryModel(
      type: InspirationCategoryType.funny,
      cards: [
        InspirationCardModel(imageUrl: 'https://picsum.photos/seed/14/400/600'),
        InspirationCardModel(imageUrl: 'https://picsum.photos/seed/15/400/600'),
      ],
    ),
    const InspirationCategoryModel(
      type: InspirationCategoryType.tattoo,
      cards: [
        InspirationCardModel(imageUrl: 'https://picsum.photos/seed/16/400/600'),
        InspirationCardModel(imageUrl: 'https://picsum.photos/seed/17/400/600'),
        InspirationCardModel(imageUrl: 'https://picsum.photos/seed/18/400/600'),
      ],
    ),
    const InspirationCategoryModel(
      type: InspirationCategoryType.cyberpunk,
      cards: [
        InspirationCardModel(imageUrl: 'https://picsum.photos/seed/19/400/600'),
        InspirationCardModel(imageUrl: 'https://picsum.photos/seed/20/400/600'),
        InspirationCardModel(imageUrl: 'https://picsum.photos/seed/21/400/600'),
        InspirationCardModel(imageUrl: 'https://picsum.photos/seed/22/400/600'),
      ],
    ),
    const InspirationCategoryModel(
      type: InspirationCategoryType.surrealism,
      cards: [
        InspirationCardModel(imageUrl: 'https://picsum.photos/seed/23/400/600'),
        InspirationCardModel(imageUrl: 'https://picsum.photos/seed/24/400/600'),
      ],
    ),
    const InspirationCategoryModel(
      type: InspirationCategoryType.christmas,
      cards: [
        InspirationCardModel(imageUrl: 'https://picsum.photos/seed/25/400/600'),
        InspirationCardModel(imageUrl: 'https://picsum.photos/seed/26/400/600'),
        InspirationCardModel(imageUrl: 'https://picsum.photos/seed/27/400/600'),
      ],
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
