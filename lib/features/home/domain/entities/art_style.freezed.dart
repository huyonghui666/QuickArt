// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'art_style.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ArtStyle {

 String get id; String get name; String get url;// Background image
 String get thumbnailUrl; String get md5; bool get isNew; String? get promptTemplate;
/// Create a copy of ArtStyle
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ArtStyleCopyWith<ArtStyle> get copyWith => _$ArtStyleCopyWithImpl<ArtStyle>(this as ArtStyle, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ArtStyle&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.url, url) || other.url == url)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl)&&(identical(other.md5, md5) || other.md5 == md5)&&(identical(other.isNew, isNew) || other.isNew == isNew)&&(identical(other.promptTemplate, promptTemplate) || other.promptTemplate == promptTemplate));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,url,thumbnailUrl,md5,isNew,promptTemplate);

@override
String toString() {
  return 'ArtStyle(id: $id, name: $name, url: $url, thumbnailUrl: $thumbnailUrl, md5: $md5, isNew: $isNew, promptTemplate: $promptTemplate)';
}


}

/// @nodoc
abstract mixin class $ArtStyleCopyWith<$Res>  {
  factory $ArtStyleCopyWith(ArtStyle value, $Res Function(ArtStyle) _then) = _$ArtStyleCopyWithImpl;
@useResult
$Res call({
 String id, String name, String url, String thumbnailUrl, String md5, bool isNew, String? promptTemplate
});




}
/// @nodoc
class _$ArtStyleCopyWithImpl<$Res>
    implements $ArtStyleCopyWith<$Res> {
  _$ArtStyleCopyWithImpl(this._self, this._then);

  final ArtStyle _self;
  final $Res Function(ArtStyle) _then;

/// Create a copy of ArtStyle
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? url = null,Object? thumbnailUrl = null,Object? md5 = null,Object? isNew = null,Object? promptTemplate = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,thumbnailUrl: null == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String,md5: null == md5 ? _self.md5 : md5 // ignore: cast_nullable_to_non_nullable
as String,isNew: null == isNew ? _self.isNew : isNew // ignore: cast_nullable_to_non_nullable
as bool,promptTemplate: freezed == promptTemplate ? _self.promptTemplate : promptTemplate // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ArtStyle].
extension ArtStylePatterns on ArtStyle {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ArtStyle value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ArtStyle() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ArtStyle value)  $default,){
final _that = this;
switch (_that) {
case _ArtStyle():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ArtStyle value)?  $default,){
final _that = this;
switch (_that) {
case _ArtStyle() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String url,  String thumbnailUrl,  String md5,  bool isNew,  String? promptTemplate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ArtStyle() when $default != null:
return $default(_that.id,_that.name,_that.url,_that.thumbnailUrl,_that.md5,_that.isNew,_that.promptTemplate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String url,  String thumbnailUrl,  String md5,  bool isNew,  String? promptTemplate)  $default,) {final _that = this;
switch (_that) {
case _ArtStyle():
return $default(_that.id,_that.name,_that.url,_that.thumbnailUrl,_that.md5,_that.isNew,_that.promptTemplate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String url,  String thumbnailUrl,  String md5,  bool isNew,  String? promptTemplate)?  $default,) {final _that = this;
switch (_that) {
case _ArtStyle() when $default != null:
return $default(_that.id,_that.name,_that.url,_that.thumbnailUrl,_that.md5,_that.isNew,_that.promptTemplate);case _:
  return null;

}
}

}

/// @nodoc


class _ArtStyle implements ArtStyle {
  const _ArtStyle({required this.id, required this.name, required this.url, required this.thumbnailUrl, required this.md5, this.isNew = false, this.promptTemplate});
  

@override final  String id;
@override final  String name;
@override final  String url;
// Background image
@override final  String thumbnailUrl;
@override final  String md5;
@override@JsonKey() final  bool isNew;
@override final  String? promptTemplate;

/// Create a copy of ArtStyle
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ArtStyleCopyWith<_ArtStyle> get copyWith => __$ArtStyleCopyWithImpl<_ArtStyle>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ArtStyle&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.url, url) || other.url == url)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl)&&(identical(other.md5, md5) || other.md5 == md5)&&(identical(other.isNew, isNew) || other.isNew == isNew)&&(identical(other.promptTemplate, promptTemplate) || other.promptTemplate == promptTemplate));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,url,thumbnailUrl,md5,isNew,promptTemplate);

@override
String toString() {
  return 'ArtStyle(id: $id, name: $name, url: $url, thumbnailUrl: $thumbnailUrl, md5: $md5, isNew: $isNew, promptTemplate: $promptTemplate)';
}


}

/// @nodoc
abstract mixin class _$ArtStyleCopyWith<$Res> implements $ArtStyleCopyWith<$Res> {
  factory _$ArtStyleCopyWith(_ArtStyle value, $Res Function(_ArtStyle) _then) = __$ArtStyleCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String url, String thumbnailUrl, String md5, bool isNew, String? promptTemplate
});




}
/// @nodoc
class __$ArtStyleCopyWithImpl<$Res>
    implements _$ArtStyleCopyWith<$Res> {
  __$ArtStyleCopyWithImpl(this._self, this._then);

  final _ArtStyle _self;
  final $Res Function(_ArtStyle) _then;

/// Create a copy of ArtStyle
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? url = null,Object? thumbnailUrl = null,Object? md5 = null,Object? isNew = null,Object? promptTemplate = freezed,}) {
  return _then(_ArtStyle(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,thumbnailUrl: null == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String,md5: null == md5 ? _self.md5 : md5 // ignore: cast_nullable_to_non_nullable
as String,isNew: null == isNew ? _self.isNew : isNew // ignore: cast_nullable_to_non_nullable
as bool,promptTemplate: freezed == promptTemplate ? _self.promptTemplate : promptTemplate // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
