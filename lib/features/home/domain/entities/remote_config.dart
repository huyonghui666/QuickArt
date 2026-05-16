import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quick_art/features/home/domain/entities/art_style.dart';

part 'remote_config.freezed.dart';

@freezed
abstract class RemoteConfig with _$RemoteConfig {
  const factory RemoteConfig({
    required String configVersion,
    required List<ArtStyle> styles,
  }) = _RemoteConfig;
}
