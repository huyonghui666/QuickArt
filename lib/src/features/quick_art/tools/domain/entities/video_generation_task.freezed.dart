// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'video_generation_task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

VideoGenerationTask _$VideoGenerationTaskFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'success':
      return _Success.fromJson(json);
    case 'failed':
      return _Failed.fromJson(json);

    default:
      throw CheckedFromJsonException(
        json,
        'runtimeType',
        'VideoGenerationTask',
        'Invalid union type "${json['runtimeType']}"!',
      );
  }
}

/// @nodoc
mixin _$VideoGenerationTask {
  String get taskId => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String taskId, String videoUrl) success,
    required TResult Function(String taskId, String error) failed,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String taskId, String videoUrl)? success,
    TResult? Function(String taskId, String error)? failed,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String taskId, String videoUrl)? success,
    TResult Function(String taskId, String error)? failed,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Success value) success,
    required TResult Function(_Failed value) failed,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Success value)? success,
    TResult? Function(_Failed value)? failed,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Success value)? success,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this VideoGenerationTask to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VideoGenerationTask
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VideoGenerationTaskCopyWith<VideoGenerationTask> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VideoGenerationTaskCopyWith<$Res> {
  factory $VideoGenerationTaskCopyWith(
    VideoGenerationTask value,
    $Res Function(VideoGenerationTask) then,
  ) = _$VideoGenerationTaskCopyWithImpl<$Res, VideoGenerationTask>;
  @useResult
  $Res call({String taskId});
}

/// @nodoc
class _$VideoGenerationTaskCopyWithImpl<$Res, $Val extends VideoGenerationTask>
    implements $VideoGenerationTaskCopyWith<$Res> {
  _$VideoGenerationTaskCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VideoGenerationTask
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? taskId = null}) {
    return _then(
      _value.copyWith(
            taskId: null == taskId
                ? _value.taskId
                : taskId // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res>
    implements $VideoGenerationTaskCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
    _$SuccessImpl value,
    $Res Function(_$SuccessImpl) then,
  ) = __$$SuccessImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String taskId, String videoUrl});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$VideoGenerationTaskCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
    _$SuccessImpl _value,
    $Res Function(_$SuccessImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of VideoGenerationTask
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? taskId = null, Object? videoUrl = null}) {
    return _then(
      _$SuccessImpl(
        taskId: null == taskId
            ? _value.taskId
            : taskId // ignore: cast_nullable_to_non_nullable
                  as String,
        videoUrl: null == videoUrl
            ? _value.videoUrl
            : videoUrl // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SuccessImpl implements _Success {
  const _$SuccessImpl({
    required this.taskId,
    required this.videoUrl,
    final String? $type,
  }) : $type = $type ?? 'success';

  factory _$SuccessImpl.fromJson(Map<String, dynamic> json) =>
      _$$SuccessImplFromJson(json);

  @override
  final String taskId;
  @override
  final String videoUrl;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'VideoGenerationTask.success(taskId: $taskId, videoUrl: $videoUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            (identical(other.taskId, taskId) || other.taskId == taskId) &&
            (identical(other.videoUrl, videoUrl) ||
                other.videoUrl == videoUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, taskId, videoUrl);

  /// Create a copy of VideoGenerationTask
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      __$$SuccessImplCopyWithImpl<_$SuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String taskId, String videoUrl) success,
    required TResult Function(String taskId, String error) failed,
  }) {
    return success(taskId, videoUrl);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String taskId, String videoUrl)? success,
    TResult? Function(String taskId, String error)? failed,
  }) {
    return success?.call(taskId, videoUrl);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String taskId, String videoUrl)? success,
    TResult Function(String taskId, String error)? failed,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(taskId, videoUrl);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Success value) success,
    required TResult Function(_Failed value) failed,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Success value)? success,
    TResult? Function(_Failed value)? failed,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Success value)? success,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$SuccessImplToJson(this);
  }
}

abstract class _Success implements VideoGenerationTask {
  const factory _Success({
    required final String taskId,
    required final String videoUrl,
  }) = _$SuccessImpl;

  factory _Success.fromJson(Map<String, dynamic> json) = _$SuccessImpl.fromJson;

  @override
  String get taskId;
  String get videoUrl;

  /// Create a copy of VideoGenerationTask
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FailedImplCopyWith<$Res>
    implements $VideoGenerationTaskCopyWith<$Res> {
  factory _$$FailedImplCopyWith(
    _$FailedImpl value,
    $Res Function(_$FailedImpl) then,
  ) = __$$FailedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String taskId, String error});
}

/// @nodoc
class __$$FailedImplCopyWithImpl<$Res>
    extends _$VideoGenerationTaskCopyWithImpl<$Res, _$FailedImpl>
    implements _$$FailedImplCopyWith<$Res> {
  __$$FailedImplCopyWithImpl(
    _$FailedImpl _value,
    $Res Function(_$FailedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of VideoGenerationTask
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? taskId = null, Object? error = null}) {
    return _then(
      _$FailedImpl(
        taskId: null == taskId
            ? _value.taskId
            : taskId // ignore: cast_nullable_to_non_nullable
                  as String,
        error: null == error
            ? _value.error
            : error // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$FailedImpl implements _Failed {
  const _$FailedImpl({
    required this.taskId,
    required this.error,
    final String? $type,
  }) : $type = $type ?? 'failed';

  factory _$FailedImpl.fromJson(Map<String, dynamic> json) =>
      _$$FailedImplFromJson(json);

  @override
  final String taskId;
  @override
  final String error;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'VideoGenerationTask.failed(taskId: $taskId, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailedImpl &&
            (identical(other.taskId, taskId) || other.taskId == taskId) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, taskId, error);

  /// Create a copy of VideoGenerationTask
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FailedImplCopyWith<_$FailedImpl> get copyWith =>
      __$$FailedImplCopyWithImpl<_$FailedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String taskId, String videoUrl) success,
    required TResult Function(String taskId, String error) failed,
  }) {
    return failed(taskId, error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String taskId, String videoUrl)? success,
    TResult? Function(String taskId, String error)? failed,
  }) {
    return failed?.call(taskId, error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String taskId, String videoUrl)? success,
    TResult Function(String taskId, String error)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(taskId, error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Success value) success,
    required TResult Function(_Failed value) failed,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Success value)? success,
    TResult? Function(_Failed value)? failed,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Success value)? success,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$FailedImplToJson(this);
  }
}

abstract class _Failed implements VideoGenerationTask {
  const factory _Failed({
    required final String taskId,
    required final String error,
  }) = _$FailedImpl;

  factory _Failed.fromJson(Map<String, dynamic> json) = _$FailedImpl.fromJson;

  @override
  String get taskId;
  String get error;

  /// Create a copy of VideoGenerationTask
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FailedImplCopyWith<_$FailedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
