// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'remote_art_style_config_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RemoteArtStyleConfigModel {

/// 全局配置版本号，单调递增整数字符串，用于 ETag 比较
 String get artStyleConfigVersion; List<ArtStyleModel> get styles;
/// Create a copy of RemoteArtStyleConfigModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RemoteArtStyleConfigModelCopyWith<RemoteArtStyleConfigModel> get copyWith => _$RemoteArtStyleConfigModelCopyWithImpl<RemoteArtStyleConfigModel>(this as RemoteArtStyleConfigModel, _$identity);

  /// Serializes this RemoteArtStyleConfigModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RemoteArtStyleConfigModel&&(identical(other.artStyleConfigVersion, artStyleConfigVersion) || other.artStyleConfigVersion == artStyleConfigVersion)&&const DeepCollectionEquality().equals(other.styles, styles));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,artStyleConfigVersion,const DeepCollectionEquality().hash(styles));

@override
String toString() {
  return 'RemoteArtStyleConfigModel(artStyleConfigVersion: $artStyleConfigVersion, styles: $styles)';
}


}

/// @nodoc
abstract mixin class $RemoteArtStyleConfigModelCopyWith<$Res>  {
  factory $RemoteArtStyleConfigModelCopyWith(RemoteArtStyleConfigModel value, $Res Function(RemoteArtStyleConfigModel) _then) = _$RemoteArtStyleConfigModelCopyWithImpl;
@useResult
$Res call({
 String artStyleConfigVersion, List<ArtStyleModel> styles
});




}
/// @nodoc
class _$RemoteArtStyleConfigModelCopyWithImpl<$Res>
    implements $RemoteArtStyleConfigModelCopyWith<$Res> {
  _$RemoteArtStyleConfigModelCopyWithImpl(this._self, this._then);

  final RemoteArtStyleConfigModel _self;
  final $Res Function(RemoteArtStyleConfigModel) _then;

/// Create a copy of RemoteArtStyleConfigModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? artStyleConfigVersion = null,Object? styles = null,}) {
  return _then(_self.copyWith(
artStyleConfigVersion: null == artStyleConfigVersion ? _self.artStyleConfigVersion : artStyleConfigVersion // ignore: cast_nullable_to_non_nullable
as String,styles: null == styles ? _self.styles : styles // ignore: cast_nullable_to_non_nullable
as List<ArtStyleModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [RemoteArtStyleConfigModel].
extension RemoteArtStyleConfigModelPatterns on RemoteArtStyleConfigModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RemoteArtStyleConfigModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RemoteArtStyleConfigModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RemoteArtStyleConfigModel value)  $default,){
final _that = this;
switch (_that) {
case _RemoteArtStyleConfigModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RemoteArtStyleConfigModel value)?  $default,){
final _that = this;
switch (_that) {
case _RemoteArtStyleConfigModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String artStyleConfigVersion,  List<ArtStyleModel> styles)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RemoteArtStyleConfigModel() when $default != null:
return $default(_that.artStyleConfigVersion,_that.styles);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String artStyleConfigVersion,  List<ArtStyleModel> styles)  $default,) {final _that = this;
switch (_that) {
case _RemoteArtStyleConfigModel():
return $default(_that.artStyleConfigVersion,_that.styles);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String artStyleConfigVersion,  List<ArtStyleModel> styles)?  $default,) {final _that = this;
switch (_that) {
case _RemoteArtStyleConfigModel() when $default != null:
return $default(_that.artStyleConfigVersion,_that.styles);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RemoteArtStyleConfigModel implements RemoteArtStyleConfigModel {
  const _RemoteArtStyleConfigModel({required this.artStyleConfigVersion, required final  List<ArtStyleModel> styles}): _styles = styles;
  factory _RemoteArtStyleConfigModel.fromJson(Map<String, dynamic> json) => _$RemoteArtStyleConfigModelFromJson(json);

/// 全局配置版本号，单调递增整数字符串，用于 ETag 比较
@override final  String artStyleConfigVersion;
 final  List<ArtStyleModel> _styles;
@override List<ArtStyleModel> get styles {
  if (_styles is EqualUnmodifiableListView) return _styles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_styles);
}


/// Create a copy of RemoteArtStyleConfigModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RemoteArtStyleConfigModelCopyWith<_RemoteArtStyleConfigModel> get copyWith => __$RemoteArtStyleConfigModelCopyWithImpl<_RemoteArtStyleConfigModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RemoteArtStyleConfigModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RemoteArtStyleConfigModel&&(identical(other.artStyleConfigVersion, artStyleConfigVersion) || other.artStyleConfigVersion == artStyleConfigVersion)&&const DeepCollectionEquality().equals(other._styles, _styles));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,artStyleConfigVersion,const DeepCollectionEquality().hash(_styles));

@override
String toString() {
  return 'RemoteArtStyleConfigModel(artStyleConfigVersion: $artStyleConfigVersion, styles: $styles)';
}


}

/// @nodoc
abstract mixin class _$RemoteArtStyleConfigModelCopyWith<$Res> implements $RemoteArtStyleConfigModelCopyWith<$Res> {
  factory _$RemoteArtStyleConfigModelCopyWith(_RemoteArtStyleConfigModel value, $Res Function(_RemoteArtStyleConfigModel) _then) = __$RemoteArtStyleConfigModelCopyWithImpl;
@override @useResult
$Res call({
 String artStyleConfigVersion, List<ArtStyleModel> styles
});




}
/// @nodoc
class __$RemoteArtStyleConfigModelCopyWithImpl<$Res>
    implements _$RemoteArtStyleConfigModelCopyWith<$Res> {
  __$RemoteArtStyleConfigModelCopyWithImpl(this._self, this._then);

  final _RemoteArtStyleConfigModel _self;
  final $Res Function(_RemoteArtStyleConfigModel) _then;

/// Create a copy of RemoteArtStyleConfigModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? artStyleConfigVersion = null,Object? styles = null,}) {
  return _then(_RemoteArtStyleConfigModel(
artStyleConfigVersion: null == artStyleConfigVersion ? _self.artStyleConfigVersion : artStyleConfigVersion // ignore: cast_nullable_to_non_nullable
as String,styles: null == styles ? _self._styles : styles // ignore: cast_nullable_to_non_nullable
as List<ArtStyleModel>,
  ));
}


}

// dart format on
