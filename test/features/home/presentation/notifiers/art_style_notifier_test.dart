import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quick_art/features/home/domain/entities/art_style.dart';
import 'package:quick_art/features/home/presentation/notifiers/art_style_notifier.dart';

void main() {
  late ProviderContainer container;

  setUp(() {
    container = ProviderContainer();
  });

  tearDown(() {
    container.dispose();
  });

  const mockStyle = ArtStyle(
    id: 'style-001',
    name: 'Cute Cartoon',
    url: 'https://example.com/cute-cartoon.webp',
    thumbnailUrl: 'https://example.com/cute-cartoon-thumb.webp',
    md5: 'abc123',
  );

  test('initial state should be noStyle', () {
    final state = container.read(artStyleNotifierProvider);
    expect(state, ArtStyle.noStyle);
    expect(state.isNoStyle, isTrue);
  });

  test('setStyle should update state', () {
    container.read(artStyleNotifierProvider.notifier).setStyle(mockStyle);
    final state = container.read(artStyleNotifierProvider);
    expect(state, mockStyle);
    expect(state.isNoStyle, isFalse);
    expect(state.id, 'style-001');
  });

  test('clearStyle should reset state to noStyle', () {
    container.read(artStyleNotifierProvider.notifier).setStyle(mockStyle);
    container.read(artStyleNotifierProvider.notifier).clearStyle();
    final state = container.read(artStyleNotifierProvider);
    expect(state, ArtStyle.noStyle);
    expect(state.isNoStyle, isTrue);
  });
}
