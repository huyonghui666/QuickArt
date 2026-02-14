// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'video_generation_task_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VideoGenerationTaskModel {

 String get taskId; String? get videoUrl; String? get error;
/// Create a copy of VideoGenerationTaskModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VideoGenerationTaskModelCopyWith<VideoGenerationTaskModel> get copyWith => _$VideoGenerationTaskModelCopyWithImpl<VideoGenerationTaskModel>(this as VideoGenerationTaskModel, _$identity);

  /// Serializes this VideoGenerationTaskModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VideoGenerationTaskModel&&(identical(other.taskId, taskId) || other.taskId == taskId)&&(identical(other.videoUrl, videoUrl) || other.videoUrl == videoUrl)&&(identical(other.error, error) || other.error == error));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,taskId,videoUrl,error);

@override
String toString() {
  return 'VideoGenerationTaskModel(taskId: $taskId, videoUrl: $videoUrl, error: $error)';
}


}

/// @nodoc
abstract mixin class $VideoGenerationTaskModelCopyWith<$Res>  {
  factory $VideoGenerationTaskModelCopyWith(VideoGenerationTaskModel value, $Res Function(VideoGenerationTaskModel) _then) = _$VideoGenerationTaskModelCopyWithImpl;
@useResult
$Res call({
 String taskId, String? videoUrl, String? error
});




}
/// @nodoc
class _$VideoGenerationTaskModelCopyWithImpl<$Res>
    implements $VideoGenerationTaskModelCopyWith<$Res> {
  _$VideoGenerationTaskModelCopyWithImpl(this._self, this._then);

  final VideoGenerationTaskModel _self;
  final $Res Function(VideoGenerationTaskModel) _then;

/// Create a copy of VideoGenerationTaskModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? taskId = null,Object? videoUrl = freezed,Object? error = freezed,}) {
  return _then(_self.copyWith(
taskId: null == taskId ? _self.taskId : taskId // ignore: cast_nullable_to_non_nullable
as String,videoUrl: freezed == videoUrl ? _self.videoUrl : videoUrl // ignore: cast_nullable_to_non_nullable
as String?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [VideoGenerationTaskModel].
extension VideoGenerationTaskModelPatterns on VideoGenerationTaskModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VideoGenerationTaskModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VideoGenerationTaskModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VideoGenerationTaskModel value)  $default,){
final _that = this;
switch (_that) {
case _VideoGenerationTaskModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VideoGenerationTaskModel value)?  $default,){
final _that = this;
switch (_that) {
case _VideoGenerationTaskModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String taskId,  String? videoUrl,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VideoGenerationTaskModel() when $default != null:
return $default(_that.taskId,_that.videoUrl,_that.error);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String taskId,  String? videoUrl,  String? error)  $default,) {final _that = this;
switch (_that) {
case _VideoGenerationTaskModel():
return $default(_that.taskId,_that.videoUrl,_that.error);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String taskId,  String? videoUrl,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _VideoGenerationTaskModel() when $default != null:
return $default(_that.taskId,_that.videoUrl,_that.error);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VideoGenerationTaskModel extends VideoGenerationTaskModel {
  const _VideoGenerationTaskModel({required this.taskId, this.videoUrl, this.error}): super._();
  factory _VideoGenerationTaskModel.fromJson(Map<String, dynamic> json) => _$VideoGenerationTaskModelFromJson(json);

@override final  String taskId;
@override final  String? videoUrl;
@override final  String? error;

/// Create a copy of VideoGenerationTaskModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VideoGenerationTaskModelCopyWith<_VideoGenerationTaskModel> get copyWith => __$VideoGenerationTaskModelCopyWithImpl<_VideoGenerationTaskModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VideoGenerationTaskModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VideoGenerationTaskModel&&(identical(other.taskId, taskId) || other.taskId == taskId)&&(identical(other.videoUrl, videoUrl) || other.videoUrl == videoUrl)&&(identical(other.error, error) || other.error == error));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,taskId,videoUrl,error);

@override
String toString() {
  return 'VideoGenerationTaskModel(taskId: $taskId, videoUrl: $videoUrl, error: $error)';
}


}

/// @nodoc
abstract mixin class _$VideoGenerationTaskModelCopyWith<$Res> implements $VideoGenerationTaskModelCopyWith<$Res> {
  factory _$VideoGenerationTaskModelCopyWith(_VideoGenerationTaskModel value, $Res Function(_VideoGenerationTaskModel) _then) = __$VideoGenerationTaskModelCopyWithImpl;
@override @useResult
$Res call({
 String taskId, String? videoUrl, String? error
});




}
/// @nodoc
class __$VideoGenerationTaskModelCopyWithImpl<$Res>
    implements _$VideoGenerationTaskModelCopyWith<$Res> {
  __$VideoGenerationTaskModelCopyWithImpl(this._self, this._then);

  final _VideoGenerationTaskModel _self;
  final $Res Function(_VideoGenerationTaskModel) _then;

/// Create a copy of VideoGenerationTaskModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? taskId = null,Object? videoUrl = freezed,Object? error = freezed,}) {
  return _then(_VideoGenerationTaskModel(
taskId: null == taskId ? _self.taskId : taskId // ignore: cast_nullable_to_non_nullable
as String,videoUrl: freezed == videoUrl ? _self.videoUrl : videoUrl // ignore: cast_nullable_to_non_nullable
as String?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
