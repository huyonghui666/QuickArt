import 'package:freezed_annotation/freezed_annotation.dart';

part 'generation_result_model.freezed.dart';
part 'generation_result_model.g.dart';

/// 统一的 WebSocket 消息通知 DTO
///
/// @property event 事件类型 (success, failed, processing)
/// @property taskId 任务ID
/// @property type 任务类型 (IMAGE, VIDEO)
/// @property error 错误信息 (如果失败)
@freezed
class GenerationResultModel with _$GenerationResultModel {
  const factory GenerationResultModel({
    required String taskId,
    required String event, // success, failed, processing
    String? type, // IMAGE, VIDEO
    String? url, // 统一存储 imageUrl 或 videoUrl
    String? error,
  }) = _GenerationResultModel;

  factory GenerationResultModel.fromJson(Map<String, dynamic> json) =>
      _$GenerationResultModelFromJson(json);
}
