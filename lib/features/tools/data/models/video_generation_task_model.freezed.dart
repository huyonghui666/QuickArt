// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'video_generation_task_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

VideoGenerationTaskModel _$VideoGenerationTaskModelFromJson(
  Map<String, dynamic> json,
) {
  return _VideoGenerationTaskModel.fromJson(json);
}

/// @nodoc
mixin _$VideoGenerationTaskModel {
  String get taskId => throw _privateConstructorUsedError;
  String? get videoUrl => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Serializes this VideoGenerationTaskModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VideoGenerationTaskModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VideoGenerationTaskModelCopyWith<VideoGenerationTaskModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VideoGenerationTaskModelCopyWith<$Res> {
  factory $VideoGenerationTaskModelCopyWith(
    VideoGenerationTaskModel value,
    $Res Function(VideoGenerationTaskModel) then,
  ) = _$VideoGenerationTaskModelCopyWithImpl<$Res, VideoGenerationTaskModel>;
  @useResult
  $Res call({String taskId, String? videoUrl, String? error});
}

/// @nodoc
class _$VideoGenerationTaskModelCopyWithImpl<
  $Res,
  $Val extends VideoGenerationTaskModel
>
    implements $VideoGenerationTaskModelCopyWith<$Res> {
  _$VideoGenerationTaskModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VideoGenerationTaskModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taskId = null,
    Object? videoUrl = freezed,
    Object? error = freezed,
  }) {
    return _then(
      _value.copyWith(
            taskId: null == taskId
                ? _value.taskId
                : taskId // ignore: cast_nullable_to_non_nullable
                      as String,
            videoUrl: freezed == videoUrl
                ? _value.videoUrl
                : videoUrl // ignore: cast_nullable_to_non_nullable
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
abstract class _$$VideoGenerationTaskModelImplCopyWith<$Res>
    implements $VideoGenerationTaskModelCopyWith<$Res> {
  factory _$$VideoGenerationTaskModelImplCopyWith(
    _$VideoGenerationTaskModelImpl value,
    $Res Function(_$VideoGenerationTaskModelImpl) then,
  ) = __$$VideoGenerationTaskModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String taskId, String? videoUrl, String? error});
}

/// @nodoc
class __$$VideoGenerationTaskModelImplCopyWithImpl<$Res>
    extends
        _$VideoGenerationTaskModelCopyWithImpl<
          $Res,
          _$VideoGenerationTaskModelImpl
        >
    implements _$$VideoGenerationTaskModelImplCopyWith<$Res> {
  __$$VideoGenerationTaskModelImplCopyWithImpl(
    _$VideoGenerationTaskModelImpl _value,
    $Res Function(_$VideoGenerationTaskModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of VideoGenerationTaskModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taskId = null,
    Object? videoUrl = freezed,
    Object? error = freezed,
  }) {
    return _then(
      _$VideoGenerationTaskModelImpl(
        taskId: null == taskId
            ? _value.taskId
            : taskId // ignore: cast_nullable_to_non_nullable
                  as String,
        videoUrl: freezed == videoUrl
            ? _value.videoUrl
            : videoUrl // ignore: cast_nullable_to_non_nullable
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
class _$VideoGenerationTaskModelImpl implements _VideoGenerationTaskModel {
  const _$VideoGenerationTaskModelImpl({
    required this.taskId,
    this.videoUrl,
    this.error,
  });

  factory _$VideoGenerationTaskModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$VideoGenerationTaskModelImplFromJson(json);

  @override
  final String taskId;
  @override
  final String? videoUrl;
  @override
  final String? error;

  @override
  String toString() {
    return 'VideoGenerationTaskModel(taskId: $taskId, videoUrl: $videoUrl, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VideoGenerationTaskModelImpl &&
            (identical(other.taskId, taskId) || other.taskId == taskId) &&
            (identical(other.videoUrl, videoUrl) ||
                other.videoUrl == videoUrl) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, taskId, videoUrl, error);

  /// Create a copy of VideoGenerationTaskModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VideoGenerationTaskModelImplCopyWith<_$VideoGenerationTaskModelImpl>
  get copyWith =>
      __$$VideoGenerationTaskModelImplCopyWithImpl<
        _$VideoGenerationTaskModelImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VideoGenerationTaskModelImplToJson(this);
  }
}

abstract class _VideoGenerationTaskModel implements VideoGenerationTaskModel {
  const factory _VideoGenerationTaskModel({
    required final String taskId,
    final String? videoUrl,
    final String? error,
  }) = _$VideoGenerationTaskModelImpl;

  factory _VideoGenerationTaskModel.fromJson(Map<String, dynamic> json) =
      _$VideoGenerationTaskModelImpl.fromJson;

  @override
  String get taskId;
  @override
  String? get videoUrl;
  @override
  String? get error;

  /// Create a copy of VideoGenerationTaskModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VideoGenerationTaskModelImplCopyWith<_$VideoGenerationTaskModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}
