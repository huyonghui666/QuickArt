// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'video_template.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VideoTemplate {

/// 模板ID
 String get id;/// 模板名称（多语言支持）
 Map<String, String> get name;/// 封面图URL
 String get coverUrl;/// 视频URL
 String get videoUrl;/// 模板分类
 String? get category;/// 模板描述
 String? get description;
/// Create a copy of VideoTemplate
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VideoTemplateCopyWith<VideoTemplate> get copyWith => _$VideoTemplateCopyWithImpl<VideoTemplate>(this as VideoTemplate, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VideoTemplate&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.name, name)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl)&&(identical(other.videoUrl, videoUrl) || other.videoUrl == videoUrl)&&(identical(other.category, category) || other.category == category)&&(identical(other.description, description) || other.description == description));
}


@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(name),coverUrl,videoUrl,category,description);

@override
String toString() {
  return 'VideoTemplate(id: $id, name: $name, coverUrl: $coverUrl, videoUrl: $videoUrl, category: $category, description: $description)';
}


}

/// @nodoc
abstract mixin class $VideoTemplateCopyWith<$Res>  {
  factory $VideoTemplateCopyWith(VideoTemplate value, $Res Function(VideoTemplate) _then) = _$VideoTemplateCopyWithImpl;
@useResult
$Res call({
 String id, Map<String, String> name, String coverUrl, String videoUrl, String? category, String? description
});




}
/// @nodoc
class _$VideoTemplateCopyWithImpl<$Res>
    implements $VideoTemplateCopyWith<$Res> {
  _$VideoTemplateCopyWithImpl(this._self, this._then);

  final VideoTemplate _self;
  final $Res Function(VideoTemplate) _then;

/// Create a copy of VideoTemplate
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? coverUrl = null,Object? videoUrl = null,Object? category = freezed,Object? description = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as Map<String, String>,coverUrl: null == coverUrl ? _self.coverUrl : coverUrl // ignore: cast_nullable_to_non_nullable
as String,videoUrl: null == videoUrl ? _self.videoUrl : videoUrl // ignore: cast_nullable_to_non_nullable
as String,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [VideoTemplate].
extension VideoTemplatePatterns on VideoTemplate {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VideoTemplate value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VideoTemplate() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VideoTemplate value)  $default,){
final _that = this;
switch (_that) {
case _VideoTemplate():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VideoTemplate value)?  $default,){
final _that = this;
switch (_that) {
case _VideoTemplate() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  Map<String, String> name,  String coverUrl,  String videoUrl,  String? category,  String? description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VideoTemplate() when $default != null:
return $default(_that.id,_that.name,_that.coverUrl,_that.videoUrl,_that.category,_that.description);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  Map<String, String> name,  String coverUrl,  String videoUrl,  String? category,  String? description)  $default,) {final _that = this;
switch (_that) {
case _VideoTemplate():
return $default(_that.id,_that.name,_that.coverUrl,_that.videoUrl,_that.category,_that.description);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  Map<String, String> name,  String coverUrl,  String videoUrl,  String? category,  String? description)?  $default,) {final _that = this;
switch (_that) {
case _VideoTemplate() when $default != null:
return $default(_that.id,_that.name,_that.coverUrl,_that.videoUrl,_that.category,_that.description);case _:
  return null;

}
}

}

/// @nodoc


class _VideoTemplate implements VideoTemplate {
  const _VideoTemplate({required this.id, required final  Map<String, String> name, required this.coverUrl, required this.videoUrl, this.category, this.description}): _name = name;
  

/// 模板ID
@override final  String id;
/// 模板名称（多语言支持）
 final  Map<String, String> _name;
/// 模板名称（多语言支持）
@override Map<String, String> get name {
  if (_name is EqualUnmodifiableMapView) return _name;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_name);
}

/// 封面图URL
@override final  String coverUrl;
/// 视频URL
@override final  String videoUrl;
/// 模板分类
@override final  String? category;
/// 模板描述
@override final  String? description;

/// Create a copy of VideoTemplate
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VideoTemplateCopyWith<_VideoTemplate> get copyWith => __$VideoTemplateCopyWithImpl<_VideoTemplate>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VideoTemplate&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other._name, _name)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl)&&(identical(other.videoUrl, videoUrl) || other.videoUrl == videoUrl)&&(identical(other.category, category) || other.category == category)&&(identical(other.description, description) || other.description == description));
}


@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(_name),coverUrl,videoUrl,category,description);

@override
String toString() {
  return 'VideoTemplate(id: $id, name: $name, coverUrl: $coverUrl, videoUrl: $videoUrl, category: $category, description: $description)';
}


}

/// @nodoc
abstract mixin class _$VideoTemplateCopyWith<$Res> implements $VideoTemplateCopyWith<$Res> {
  factory _$VideoTemplateCopyWith(_VideoTemplate value, $Res Function(_VideoTemplate) _then) = __$VideoTemplateCopyWithImpl;
@override @useResult
$Res call({
 String id, Map<String, String> name, String coverUrl, String videoUrl, String? category, String? description
});




}
/// @nodoc
class __$VideoTemplateCopyWithImpl<$Res>
    implements _$VideoTemplateCopyWith<$Res> {
  __$VideoTemplateCopyWithImpl(this._self, this._then);

  final _VideoTemplate _self;
  final $Res Function(_VideoTemplate) _then;

/// Create a copy of VideoTemplate
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? coverUrl = null,Object? videoUrl = null,Object? category = freezed,Object? description = freezed,}) {
  return _then(_VideoTemplate(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self._name : name // ignore: cast_nullable_to_non_nullable
as Map<String, String>,coverUrl: null == coverUrl ? _self.coverUrl : coverUrl // ignore: cast_nullable_to_non_nullable
as String,videoUrl: null == videoUrl ? _self.videoUrl : videoUrl // ignore: cast_nullable_to_non_nullable
as String,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
