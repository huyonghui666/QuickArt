import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quick_art/features/home/presentation/notifiers/inspiration_provider.dart';

void main() {
  late ProviderContainer container;

  setUp(() {
    container = ProviderContainer();
  });

  tearDown(() {
    container.dispose();
  });

  test('should return all inspiration category types', () {
    final categories = container.read(inspirationCategoriesProvider);
    expect(categories, InspirationCategoryType.values);
    expect(categories.length, InspirationCategoryType.values.length);
  });
}
