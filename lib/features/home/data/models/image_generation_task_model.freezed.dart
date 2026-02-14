// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image_generation_task_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ImageGenerationTaskModel {

 String get taskId;
/// Create a copy of ImageGenerationTaskModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ImageGenerationTaskModelCopyWith<ImageGenerationTaskModel> get copyWith => _$ImageGenerationTaskModelCopyWithImpl<ImageGenerationTaskModel>(this as ImageGenerationTaskModel, _$identity);

  /// Serializes this ImageGenerationTaskModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImageGenerationTaskModel&&(identical(other.taskId, taskId) || other.taskId == taskId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,taskId);

@override
String toString() {
  return 'ImageGenerationTaskModel(taskId: $taskId)';
}


}

/// @nodoc
abstract mixin class $ImageGenerationTaskModelCopyWith<$Res>  {
  factory $ImageGenerationTaskModelCopyWith(ImageGenerationTaskModel value, $Res Function(ImageGenerationTaskModel) _then) = _$ImageGenerationTaskModelCopyWithImpl;
@useResult
$Res call({
 String taskId
});




}
/// @nodoc
class _$ImageGenerationTaskModelCopyWithImpl<$Res>
    implements $ImageGenerationTaskModelCopyWith<$Res> {
  _$ImageGenerationTaskModelCopyWithImpl(this._self, this._then);

  final ImageGenerationTaskModel _self;
  final $Res Function(ImageGenerationTaskModel) _then;

/// Create a copy of ImageGenerationTaskModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? taskId = null,}) {
  return _then(_self.copyWith(
taskId: null == taskId ? _self.taskId : taskId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ImageGenerationTaskModel].
extension ImageGenerationTaskModelPatterns on ImageGenerationTaskModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ImageGenerationTaskModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ImageGenerationTaskModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ImageGenerationTaskModel value)  $default,){
final _that = this;
switch (_that) {
case _ImageGenerationTaskModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ImageGenerationTaskModel value)?  $default,){
final _that = this;
switch (_that) {
case _ImageGenerationTaskModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String taskId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ImageGenerationTaskModel() when $default != null:
return $default(_that.taskId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String taskId)  $default,) {final _that = this;
switch (_that) {
case _ImageGenerationTaskModel():
return $default(_that.taskId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String taskId)?  $default,) {final _that = this;
switch (_that) {
case _ImageGenerationTaskModel() when $default != null:
return $default(_that.taskId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ImageGenerationTaskModel extends ImageGenerationTaskModel {
  const _ImageGenerationTaskModel({required this.taskId}): super._();
  factory _ImageGenerationTaskModel.fromJson(Map<String, dynamic> json) => _$ImageGenerationTaskModelFromJson(json);

@override final  String taskId;

/// Create a copy of ImageGenerationTaskModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ImageGenerationTaskModelCopyWith<_ImageGenerationTaskModel> get copyWith => __$ImageGenerationTaskModelCopyWithImpl<_ImageGenerationTaskModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ImageGenerationTaskModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ImageGenerationTaskModel&&(identical(other.taskId, taskId) || other.taskId == taskId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,taskId);

@override
String toString() {
  return 'ImageGenerationTaskModel(taskId: $taskId)';
}


}

/// @nodoc
abstract mixin class _$ImageGenerationTaskModelCopyWith<$Res> implements $ImageGenerationTaskModelCopyWith<$Res> {
  factory _$ImageGenerationTaskModelCopyWith(_ImageGenerationTaskModel value, $Res Function(_ImageGenerationTaskModel) _then) = __$ImageGenerationTaskModelCopyWithImpl;
@override @useResult
$Res call({
 String taskId
});




}
/// @nodoc
class __$ImageGenerationTaskModelCopyWithImpl<$Res>
    implements _$ImageGenerationTaskModelCopyWith<$Res> {
  __$ImageGenerationTaskModelCopyWithImpl(this._self, this._then);

  final _ImageGenerationTaskModel _self;
  final $Res Function(_ImageGenerationTaskModel) _then;

/// Create a copy of ImageGenerationTaskModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? taskId = null,}) {
  return _then(_ImageGenerationTaskModel(
taskId: null == taskId ? _self.taskId : taskId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
