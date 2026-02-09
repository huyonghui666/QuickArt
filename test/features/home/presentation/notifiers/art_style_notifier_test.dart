import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quick_art/features/home/presentation/notifiers/art_style_notifier.dart';

void main() {
  late ProviderContainer container;

  setUp(() {
    container = ProviderContainer();
  });

  tearDown(() {
    container.dispose();
  });

  test('initial state should be noStyle', () {
    final state = container.read(artStyleNotifierProvider);
    expect(state, ArtStyle.noStyle);
  });

  test('setStyle should update state', () {
    final notifier = container.read(artStyleNotifierProvider.notifier);
    
    notifier.setStyle(ArtStyle.cuteCartoon);
    expect(container.read(artStyleNotifierProvider), ArtStyle.cuteCartoon);

    notifier.setStyle(ArtStyle.cyberpunk);
    expect(container.read(artStyleNotifierProvider), ArtStyle.cyberpunk);
  });
}
