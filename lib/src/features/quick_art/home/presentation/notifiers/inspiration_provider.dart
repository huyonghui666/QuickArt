import 'package:flutter_riverpod/flutter_riverpod.dart';

final inspirationCategoriesProvider = Provider<List<InspirationCategoryModel>>((ref) {
  return [
    const InspirationCategoryModel(
      label: '新',
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
      label: '漫画',
      cards: [
        InspirationCardModel(imageUrl: 'https://picsum.photos/seed/5/400/600'),
        InspirationCardModel(imageUrl: 'https://picsum.photos/seed/6/400/600'),
      ],
    ),
    const InspirationCategoryModel(
      label: '摄影',
      cards: [
        InspirationCardModel(imageUrl: 'https://picsum.photos/seed/7/400/600'),
        InspirationCardModel(imageUrl: 'https://picsum.photos/seed/8/400/600'),
        InspirationCardModel(imageUrl: 'https://picsum.photos/seed/9/400/600'),
      ],
    ),
    const InspirationCategoryModel(
      label: '水彩',
      cards: [
        InspirationCardModel(imageUrl: 'https://picsum.photos/seed/10/400/600'),
        InspirationCardModel(imageUrl: 'https://picsum.photos/seed/11/400/600'),
        InspirationCardModel(imageUrl: 'https://picsum.photos/seed/12/400/600'),
        InspirationCardModel(imageUrl: 'https://picsum.photos/seed/13/400/600'),
      ],
    ),
    const InspirationCategoryModel(
      label: '有趣',
      cards: [
        InspirationCardModel(imageUrl: 'https://picsum.photos/seed/14/400/600'),
        InspirationCardModel(imageUrl: 'https://picsum.photos/seed/15/400/600'),
      ],
    ),
    const InspirationCategoryModel(
      label: '纹身',
      cards: [
        InspirationCardModel(imageUrl: 'https://picsum.photos/seed/16/400/600'),
        InspirationCardModel(imageUrl: 'https://picsum.photos/seed/17/400/600'),
        InspirationCardModel(imageUrl: 'https://picsum.photos/seed/18/400/600'),
      ],
    ),
    const InspirationCategoryModel(
      label: '赛博朋克',
      cards: [
        InspirationCardModel(imageUrl: 'https://picsum.photos/seed/19/400/600'),
        InspirationCardModel(imageUrl: 'https://picsum.photos/seed/20/400/600'),
        InspirationCardModel(imageUrl: 'https://picsum.photos/seed/21/400/600'),
        InspirationCardModel(imageUrl: 'https://picsum.photos/seed/22/400/600'),
      ],
    ),
    const InspirationCategoryModel(
      label: '超现实主义',
      cards: [
        InspirationCardModel(imageUrl: 'https://picsum.photos/seed/23/400/600'),
        InspirationCardModel(imageUrl: 'https://picsum.photos/seed/24/400/600'),
      ],
    ),
    const InspirationCategoryModel(
      label: '圣诞',
      cards: [
        InspirationCardModel(imageUrl: 'https://picsum.photos/seed/25/400/600'),
        InspirationCardModel(imageUrl: 'https://picsum.photos/seed/26/400/600'),
        InspirationCardModel(imageUrl: 'https://picsum.photos/seed/27/400/600'),
      ],
    ),
  ];
});

//分类0对应‘新’分类，其他依次
final selectedInspirationTabIndexProvider = StateProvider<int>((ref) => 0);

//目前灵感选择的卡片状态
final currentInspirationCardsProvider = Provider<List<InspirationCardModel>>((ref) {
  final categories = ref.watch(inspirationCategoriesProvider);
  final selectedIndex = ref.watch(selectedInspirationTabIndexProvider);
  return categories[selectedIndex].cards;
});


class InspirationCardModel {
  const InspirationCardModel({
    required this.imageUrl,
    this.prompt,
  });

  final String imageUrl;
  final String? prompt;
}

class InspirationCategoryModel {
  const InspirationCategoryModel({
    required this.label,
    required this.cards,
  });

  final String label;
  final List<InspirationCardModel> cards;
}
