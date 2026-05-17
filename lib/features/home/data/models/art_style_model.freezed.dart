// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'art_style_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ArtStyleModel {

 String get id; String get name; String get url;// Background image
 String get thumbnailUrl; String get md5; bool get isNew; String? get promptTemplate;
/// Create a copy of ArtStyleModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ArtStyleModelCopyWith<ArtStyleModel> get copyWith => _$ArtStyleModelCopyWithImpl<ArtStyleModel>(this as ArtStyleModel, _$identity);

  /// Serializes this ArtStyleModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ArtStyleModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.url, url) || other.url == url)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl)&&(identical(other.md5, md5) || other.md5 == md5)&&(identical(other.isNew, isNew) || other.isNew == isNew)&&(identical(other.promptTemplate, promptTemplate) || other.promptTemplate == promptTemplate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,url,thumbnailUrl,md5,isNew,promptTemplate);

@override
String toString() {
  return 'ArtStyleModel(id: $id, name: $name, url: $url, thumbnailUrl: $thumbnailUrl, md5: $md5, isNew: $isNew, promptTemplate: $promptTemplate)';
}


}

/// @nodoc
abstract mixin class $ArtStyleModelCopyWith<$Res>  {
  factory $ArtStyleModelCopyWith(ArtStyleModel value, $Res Function(ArtStyleModel) _then) = _$ArtStyleModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String url, String thumbnailUrl, String md5, bool isNew, String? promptTemplate
});




}
/// @nodoc
class _$ArtStyleModelCopyWithImpl<$Res>
    implements $ArtStyleModelCopyWith<$Res> {
  _$ArtStyleModelCopyWithImpl(this._self, this._then);

  final ArtStyleModel _self;
  final $Res Function(ArtStyleModel) _then;

/// Create a copy of ArtStyleModel
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


/// Adds pattern-matching-related methods to [ArtStyleModel].
extension ArtStyleModelPatterns on ArtStyleModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ArtStyleModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ArtStyleModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ArtStyleModel value)  $default,){
final _that = this;
switch (_that) {
case _ArtStyleModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ArtStyleModel value)?  $default,){
final _that = this;
switch (_that) {
case _ArtStyleModel() when $default != null:
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
case _ArtStyleModel() when $default != null:
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
case _ArtStyleModel():
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
case _ArtStyleModel() when $default != null:
return $default(_that.id,_that.name,_that.url,_that.thumbnailUrl,_that.md5,_that.isNew,_that.promptTemplate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ArtStyleModel implements ArtStyleModel {
  const _ArtStyleModel({required this.id, required this.name, required this.url, required this.thumbnailUrl, required this.md5, this.isNew = false, this.promptTemplate});
  factory _ArtStyleModel.fromJson(Map<String, dynamic> json) => _$ArtStyleModelFromJson(json);

@override final  String id;
@override final  String name;
@override final  String url;
// Background image
@override final  String thumbnailUrl;
@override final  String md5;
@override@JsonKey() final  bool isNew;
@override final  String? promptTemplate;

/// Create a copy of ArtStyleModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ArtStyleModelCopyWith<_ArtStyleModel> get copyWith => __$ArtStyleModelCopyWithImpl<_ArtStyleModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ArtStyleModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ArtStyleModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.url, url) || other.url == url)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl)&&(identical(other.md5, md5) || other.md5 == md5)&&(identical(other.isNew, isNew) || other.isNew == isNew)&&(identical(other.promptTemplate, promptTemplate) || other.promptTemplate == promptTemplate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,url,thumbnailUrl,md5,isNew,promptTemplate);

@override
String toString() {
  return 'ArtStyleModel(id: $id, name: $name, url: $url, thumbnailUrl: $thumbnailUrl, md5: $md5, isNew: $isNew, promptTemplate: $promptTemplate)';
}


}

/// @nodoc
abstract mixin class _$ArtStyleModelCopyWith<$Res> implements $ArtStyleModelCopyWith<$Res> {
  factory _$ArtStyleModelCopyWith(_ArtStyleModel value, $Res Function(_ArtStyleModel) _then) = __$ArtStyleModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String url, String thumbnailUrl, String md5, bool isNew, String? promptTemplate
});




}
/// @nodoc
class __$ArtStyleModelCopyWithImpl<$Res>
    implements _$ArtStyleModelCopyWith<$Res> {
  __$ArtStyleModelCopyWithImpl(this._self, this._then);

  final _ArtStyleModel _self;
  final $Res Function(_ArtStyleModel) _then;

/// Create a copy of ArtStyleModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? url = null,Object? thumbnailUrl = null,Object? md5 = null,Object? isNew = null,Object? promptTemplate = freezed,}) {
  return _then(_ArtStyleModel(
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
