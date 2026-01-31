// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'generation_result_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

GenerationResultModel _$GenerationResultModelFromJson(
  Map<String, dynamic> json,
) {
  return _GenerationResultModel.fromJson(json);
}

/// @nodoc
mixin _$GenerationResultModel {
  String get taskId => throw _privateConstructorUsedError;
  String get event =>
      throw _privateConstructorUsedError; // success, failed, processing
  String? get type => throw _privateConstructorUsedError; // IMAGE, VIDEO
  String? get url =>
      throw _privateConstructorUsedError; // 统一存储 imageUrl 或 videoUrl
  String? get thumbnailUrl => throw _privateConstructorUsedError; // 视频尾帧图或其他缩略图
  String? get error => throw _privateConstructorUsedError;

  /// Serializes this GenerationResultModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GenerationResultModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GenerationResultModelCopyWith<GenerationResultModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenerationResultModelCopyWith<$Res> {
  factory $GenerationResultModelCopyWith(
    GenerationResultModel value,
    $Res Function(GenerationResultModel) then,
  ) = _$GenerationResultModelCopyWithImpl<$Res, GenerationResultModel>;
  @useResult
  $Res call({
    String taskId,
    String event,
    String? type,
    String? url,
    String? thumbnailUrl,
    String? error,
  });
}

/// @nodoc
class _$GenerationResultModelCopyWithImpl<
  $Res,
  $Val extends GenerationResultModel
>
    implements $GenerationResultModelCopyWith<$Res> {
  _$GenerationResultModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GenerationResultModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taskId = null,
    Object? event = null,
    Object? type = freezed,
    Object? url = freezed,
    Object? thumbnailUrl = freezed,
    Object? error = freezed,
  }) {
    return _then(
      _value.copyWith(
            taskId: null == taskId
                ? _value.taskId
                : taskId // ignore: cast_nullable_to_non_nullable
                      as String,
            event: null == event
                ? _value.event
                : event // ignore: cast_nullable_to_non_nullable
                      as String,
            type: freezed == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String?,
            url: freezed == url
                ? _value.url
                : url // ignore: cast_nullable_to_non_nullable
                      as String?,
            thumbnailUrl: freezed == thumbnailUrl
                ? _value.thumbnailUrl
                : thumbnailUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            error: freezed == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$GenerationResultModelImplCopyWith<$Res>
    implements $GenerationResultModelCopyWith<$Res> {
  factory _$$GenerationResultModelImplCopyWith(
    _$GenerationResultModelImpl value,
    $Res Function(_$GenerationResultModelImpl) then,
  ) = __$$GenerationResultModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String taskId,
    String event,
    String? type,
    String? url,
    String? thumbnailUrl,
    String? error,
  });
}

/// @nodoc
class __$$GenerationResultModelImplCopyWithImpl<$Res>
    extends
        _$GenerationResultModelCopyWithImpl<$Res, _$GenerationResultModelImpl>
    implements _$$GenerationResultModelImplCopyWith<$Res> {
  __$$GenerationResultModelImplCopyWithImpl(
    _$GenerationResultModelImpl _value,
    $Res Function(_$GenerationResultModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GenerationResultModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taskId = null,
    Object? event = null,
    Object? type = freezed,
    Object? url = freezed,
    Object? thumbnailUrl = freezed,
    Object? error = freezed,
  }) {
    return _then(
      _$GenerationResultModelImpl(
        taskId: null == taskId
            ? _value.taskId
            : taskId // ignore: cast_nullable_to_non_nullable
                  as String,
        event: null == event
            ? _value.event
            : event // ignore: cast_nullable_to_non_nullable
                  as String,
        type: freezed == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String?,
        url: freezed == url
            ? _value.url
            : url // ignore: cast_nullable_to_non_nullable
                  as String?,
        thumbnailUrl: freezed == thumbnailUrl
            ? _value.thumbnailUrl
            : thumbnailUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        error: freezed == error
            ? _value.error
            : error // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$GenerationResultModelImpl implements _GenerationResultModel {
  const _$GenerationResultModelImpl({
    required this.taskId,
    required this.event,
    this.type,
    this.url,
    this.thumbnailUrl,
    this.error,
  });

  factory _$GenerationResultModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GenerationResultModelImplFromJson(json);

  @override
  final String taskId;
  @override
  final String event;
  // success, failed, processing
  @override
  final String? type;
  // IMAGE, VIDEO
  @override
  final String? url;
  // 统一存储 imageUrl 或 videoUrl
  @override
  final String? thumbnailUrl;
  // 视频尾帧图或其他缩略图
  @override
  final String? error;

  @override
  String toString() {
    return 'GenerationResultModel(taskId: $taskId, event: $event, type: $type, url: $url, thumbnailUrl: $thumbnailUrl, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenerationResultModelImpl &&
            (identical(other.taskId, taskId) || other.taskId == taskId) &&
            (identical(other.event, event) || other.event == event) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.thumbnailUrl, thumbnailUrl) ||
                other.thumbnailUrl == thumbnailUrl) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, taskId, event, type, url, thumbnailUrl, error);

  /// Create a copy of GenerationResultModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GenerationResultModelImplCopyWith<_$GenerationResultModelImpl>
  get copyWith =>
      __$$GenerationResultModelImplCopyWithImpl<_$GenerationResultModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$GenerationResultModelImplToJson(this);
  }
}

abstract class _GenerationResultModel implements GenerationResultModel {
  const factory _GenerationResultModel({
    required final String taskId,
    required final String event,
    final String? type,
    final String? url,
    final String? thumbnailUrl,
    final String? error,
  }) = _$GenerationResultModelImpl;

  factory _GenerationResultModel.fromJson(Map<String, dynamic> json) =
      _$GenerationResultModelImpl.fromJson;

  @override
  String get taskId;
  @override
  String get event; // success, failed, processing
  @override
  String? get type; // IMAGE, VIDEO
  @override
  String? get url; // 统一存储 imageUrl 或 videoUrl
  @override
  String? get thumbnailUrl; // 视频尾帧图或其他缩略图
  @override
  String? get error;

  /// Create a copy of GenerationResultModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GenerationResultModelImplCopyWith<_$GenerationResultModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}
