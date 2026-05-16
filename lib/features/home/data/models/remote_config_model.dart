import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quick_art/features/home/data/models/art_style_model.dart';

part 'remote_config_model.freezed.dart';
part 'remote_config_model.g.dart';

@freezed
abstract class RemoteConfigModel with _$RemoteConfigModel {
  const factory RemoteConfigModel({
    required String configVersion,
    required List<ArtStyleModel> styles,
  }) = _RemoteConfigModel;

  factory RemoteConfigModel.fromJson(Map<String, dynamic> json) =>
      _$RemoteConfigModelFromJson(json);
}
