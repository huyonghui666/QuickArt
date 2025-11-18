// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image_generation_task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ImageGenerationTask _$ImageGenerationTaskFromJson(Map<String, dynamic> json) {
  return _ImageGenerationTask.fromJson(json);
}

/// @nodoc
mixin _$ImageGenerationTask {
  String get taskId => throw _privateConstructorUsedError;

  /// Serializes this ImageGenerationTask to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ImageGenerationTask
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ImageGenerationTaskCopyWith<ImageGenerationTask> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageGenerationTaskCopyWith<$Res> {
  factory $ImageGenerationTaskCopyWith(
    ImageGenerationTask value,
    $Res Function(ImageGenerationTask) then,
  ) = _$ImageGenerationTaskCopyWithImpl<$Res, ImageGenerationTask>;
  @useResult
  $Res call({String taskId});
}

/// @nodoc
class _$ImageGenerationTaskCopyWithImpl<$Res, $Val extends ImageGenerationTask>
    implements $ImageGenerationTaskCopyWith<$Res> {
  _$ImageGenerationTaskCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ImageGenerationTask
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
abstract class _$$ImageGenerationTaskImplCopyWith<$Res>
    implements $ImageGenerationTaskCopyWith<$Res> {
  factory _$$ImageGenerationTaskImplCopyWith(
    _$ImageGenerationTaskImpl value,
    $Res Function(_$ImageGenerationTaskImpl) then,
  ) = __$$ImageGenerationTaskImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String taskId});
}

/// @nodoc
class __$$ImageGenerationTaskImplCopyWithImpl<$Res>
    extends _$ImageGenerationTaskCopyWithImpl<$Res, _$ImageGenerationTaskImpl>
    implements _$$ImageGenerationTaskImplCopyWith<$Res> {
  __$$ImageGenerationTaskImplCopyWithImpl(
    _$ImageGenerationTaskImpl _value,
    $Res Function(_$ImageGenerationTaskImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ImageGenerationTask
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? taskId = null}) {
    return _then(
      _$ImageGenerationTaskImpl(
        taskId: null == taskId
            ? _value.taskId
            : taskId // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ImageGenerationTaskImpl implements _ImageGenerationTask {
  const _$ImageGenerationTaskImpl({required this.taskId});

  factory _$ImageGenerationTaskImpl.fromJson(Map<String, dynamic> json) =>
      _$$ImageGenerationTaskImplFromJson(json);

  @override
  final String taskId;

  @override
  String toString() {
    return 'ImageGenerationTask(taskId: $taskId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageGenerationTaskImpl &&
            (identical(other.taskId, taskId) || other.taskId == taskId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, taskId);

  /// Create a copy of ImageGenerationTask
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ImageGenerationTaskImplCopyWith<_$ImageGenerationTaskImpl> get copyWith =>
      __$$ImageGenerationTaskImplCopyWithImpl<_$ImageGenerationTaskImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ImageGenerationTaskImplToJson(this);
  }
}

abstract class _ImageGenerationTask implements ImageGenerationTask {
  const factory _ImageGenerationTask({required final String taskId}) =
      _$ImageGenerationTaskImpl;

  factory _ImageGenerationTask.fromJson(Map<String, dynamic> json) =
      _$ImageGenerationTaskImpl.fromJson;

  @override
  String get taskId;

  /// Create a copy of ImageGenerationTask
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ImageGenerationTaskImplCopyWith<_$ImageGenerationTaskImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
