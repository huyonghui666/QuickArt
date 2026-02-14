// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'generation_result_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GenerationResultModel {

 String get taskId; String get event;// success, failed, processing
 String? get type;// IMAGE, VIDEO
 String? get url;// 统一存储 imageUrl 或 videoUrl
 String? get thumbnailUrl;// 视频尾帧图或其他缩略图
 String? get error;
/// Create a copy of GenerationResultModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GenerationResultModelCopyWith<GenerationResultModel> get copyWith => _$GenerationResultModelCopyWithImpl<GenerationResultModel>(this as GenerationResultModel, _$identity);

  /// Serializes this GenerationResultModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GenerationResultModel&&(identical(other.taskId, taskId) || other.taskId == taskId)&&(identical(other.event, event) || other.event == event)&&(identical(other.type, type) || other.type == type)&&(identical(other.url, url) || other.url == url)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl)&&(identical(other.error, error) || other.error == error));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,taskId,event,type,url,thumbnailUrl,error);

@override
String toString() {
  return 'GenerationResultModel(taskId: $taskId, event: $event, type: $type, url: $url, thumbnailUrl: $thumbnailUrl, error: $error)';
}


}

/// @nodoc
abstract mixin class $GenerationResultModelCopyWith<$Res>  {
  factory $GenerationResultModelCopyWith(GenerationResultModel value, $Res Function(GenerationResultModel) _then) = _$GenerationResultModelCopyWithImpl;
@useResult
$Res call({
 String taskId, String event, String? type, String? url, String? thumbnailUrl, String? error
});




}
/// @nodoc
class _$GenerationResultModelCopyWithImpl<$Res>
    implements $GenerationResultModelCopyWith<$Res> {
  _$GenerationResultModelCopyWithImpl(this._self, this._then);

  final GenerationResultModel _self;
  final $Res Function(GenerationResultModel) _then;

/// Create a copy of GenerationResultModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? taskId = null,Object? event = null,Object? type = freezed,Object? url = freezed,Object? thumbnailUrl = freezed,Object? error = freezed,}) {
  return _then(_self.copyWith(
taskId: null == taskId ? _self.taskId : taskId // ignore: cast_nullable_to_non_nullable
as String,event: null == event ? _self.event : event // ignore: cast_nullable_to_non_nullable
as String,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,thumbnailUrl: freezed == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [GenerationResultModel].
extension GenerationResultModelPatterns on GenerationResultModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GenerationResultModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GenerationResultModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GenerationResultModel value)  $default,){
final _that = this;
switch (_that) {
case _GenerationResultModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GenerationResultModel value)?  $default,){
final _that = this;
switch (_that) {
case _GenerationResultModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String taskId,  String event,  String? type,  String? url,  String? thumbnailUrl,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GenerationResultModel() when $default != null:
return $default(_that.taskId,_that.event,_that.type,_that.url,_that.thumbnailUrl,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String taskId,  String event,  String? type,  String? url,  String? thumbnailUrl,  String? error)  $default,) {final _that = this;
switch (_that) {
case _GenerationResultModel():
return $default(_that.taskId,_that.event,_that.type,_that.url,_that.thumbnailUrl,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String taskId,  String event,  String? type,  String? url,  String? thumbnailUrl,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _GenerationResultModel() when $default != null:
return $default(_that.taskId,_that.event,_that.type,_that.url,_that.thumbnailUrl,_that.error);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GenerationResultModel implements GenerationResultModel {
  const _GenerationResultModel({required this.taskId, required this.event, this.type, this.url, this.thumbnailUrl, this.error});
  factory _GenerationResultModel.fromJson(Map<String, dynamic> json) => _$GenerationResultModelFromJson(json);

@override final  String taskId;
@override final  String event;
// success, failed, processing
@override final  String? type;
// IMAGE, VIDEO
@override final  String? url;
// 统一存储 imageUrl 或 videoUrl
@override final  String? thumbnailUrl;
// 视频尾帧图或其他缩略图
@override final  String? error;

/// Create a copy of GenerationResultModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GenerationResultModelCopyWith<_GenerationResultModel> get copyWith => __$GenerationResultModelCopyWithImpl<_GenerationResultModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GenerationResultModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GenerationResultModel&&(identical(other.taskId, taskId) || other.taskId == taskId)&&(identical(other.event, event) || other.event == event)&&(identical(other.type, type) || other.type == type)&&(identical(other.url, url) || other.url == url)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl)&&(identical(other.error, error) || other.error == error));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,taskId,event,type,url,thumbnailUrl,error);

@override
String toString() {
  return 'GenerationResultModel(taskId: $taskId, event: $event, type: $type, url: $url, thumbnailUrl: $thumbnailUrl, error: $error)';
}


}

/// @nodoc
abstract mixin class _$GenerationResultModelCopyWith<$Res> implements $GenerationResultModelCopyWith<$Res> {
  factory _$GenerationResultModelCopyWith(_GenerationResultModel value, $Res Function(_GenerationResultModel) _then) = __$GenerationResultModelCopyWithImpl;
@override @useResult
$Res call({
 String taskId, String event, String? type, String? url, String? thumbnailUrl, String? error
});




}
/// @nodoc
class __$GenerationResultModelCopyWithImpl<$Res>
    implements _$GenerationResultModelCopyWith<$Res> {
  __$GenerationResultModelCopyWithImpl(this._self, this._then);

  final _GenerationResultModel _self;
  final $Res Function(_GenerationResultModel) _then;

/// Create a copy of GenerationResultModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? taskId = null,Object? event = null,Object? type = freezed,Object? url = freezed,Object? thumbnailUrl = freezed,Object? error = freezed,}) {
  return _then(_GenerationResultModel(
taskId: null == taskId ? _self.taskId : taskId // ignore: cast_nullable_to_non_nullable
as String,event: null == event ? _self.event : event // ignore: cast_nullable_to_non_nullable
as String,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,thumbnailUrl: freezed == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
