// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'remote_art_style_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RemoteArtStyleConfig {

/// 全局配置版本号，单调递增整数字符串，用于 ETag 比较
 String get artStyleConfigVersion; List<ArtStyle> get styles;
/// Create a copy of RemoteArtStyleConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RemoteArtStyleConfigCopyWith<RemoteArtStyleConfig> get copyWith => _$RemoteArtStyleConfigCopyWithImpl<RemoteArtStyleConfig>(this as RemoteArtStyleConfig, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RemoteArtStyleConfig&&(identical(other.artStyleConfigVersion, artStyleConfigVersion) || other.artStyleConfigVersion == artStyleConfigVersion)&&const DeepCollectionEquality().equals(other.styles, styles));
}


@override
int get hashCode => Object.hash(runtimeType,artStyleConfigVersion,const DeepCollectionEquality().hash(styles));

@override
String toString() {
  return 'RemoteArtStyleConfig(artStyleConfigVersion: $artStyleConfigVersion, styles: $styles)';
}


}

/// @nodoc
abstract mixin class $RemoteArtStyleConfigCopyWith<$Res>  {
  factory $RemoteArtStyleConfigCopyWith(RemoteArtStyleConfig value, $Res Function(RemoteArtStyleConfig) _then) = _$RemoteArtStyleConfigCopyWithImpl;
@useResult
$Res call({
 String artStyleConfigVersion, List<ArtStyle> styles
});




}
/// @nodoc
class _$RemoteArtStyleConfigCopyWithImpl<$Res>
    implements $RemoteArtStyleConfigCopyWith<$Res> {
  _$RemoteArtStyleConfigCopyWithImpl(this._self, this._then);

  final RemoteArtStyleConfig _self;
  final $Res Function(RemoteArtStyleConfig) _then;

/// Create a copy of RemoteArtStyleConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? artStyleConfigVersion = null,Object? styles = null,}) {
  return _then(_self.copyWith(
artStyleConfigVersion: null == artStyleConfigVersion ? _self.artStyleConfigVersion : artStyleConfigVersion // ignore: cast_nullable_to_non_nullable
as String,styles: null == styles ? _self.styles : styles // ignore: cast_nullable_to_non_nullable
as List<ArtStyle>,
  ));
}

}


/// Adds pattern-matching-related methods to [RemoteArtStyleConfig].
extension RemoteArtStyleConfigPatterns on RemoteArtStyleConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RemoteArtStyleConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RemoteArtStyleConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RemoteArtStyleConfig value)  $default,){
final _that = this;
switch (_that) {
case _RemoteArtStyleConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RemoteArtStyleConfig value)?  $default,){
final _that = this;
switch (_that) {
case _RemoteArtStyleConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String artStyleConfigVersion,  List<ArtStyle> styles)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RemoteArtStyleConfig() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String artStyleConfigVersion,  List<ArtStyle> styles)  $default,) {final _that = this;
switch (_that) {
case _RemoteArtStyleConfig():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String artStyleConfigVersion,  List<ArtStyle> styles)?  $default,) {final _that = this;
switch (_that) {
case _RemoteArtStyleConfig() when $default != null:
return $default(_that.artStyleConfigVersion,_that.styles);case _:
  return null;

}
}

}

/// @nodoc


class _RemoteArtStyleConfig implements RemoteArtStyleConfig {
  const _RemoteArtStyleConfig({required this.artStyleConfigVersion, required final  List<ArtStyle> styles}): _styles = styles;
  

/// 全局配置版本号，单调递增整数字符串，用于 ETag 比较
@override final  String artStyleConfigVersion;
 final  List<ArtStyle> _styles;
@override List<ArtStyle> get styles {
  if (_styles is EqualUnmodifiableListView) return _styles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_styles);
}


/// Create a copy of RemoteArtStyleConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RemoteArtStyleConfigCopyWith<_RemoteArtStyleConfig> get copyWith => __$RemoteArtStyleConfigCopyWithImpl<_RemoteArtStyleConfig>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RemoteArtStyleConfig&&(identical(other.artStyleConfigVersion, artStyleConfigVersion) || other.artStyleConfigVersion == artStyleConfigVersion)&&const DeepCollectionEquality().equals(other._styles, _styles));
}


@override
int get hashCode => Object.hash(runtimeType,artStyleConfigVersion,const DeepCollectionEquality().hash(_styles));

@override
String toString() {
  return 'RemoteArtStyleConfig(artStyleConfigVersion: $artStyleConfigVersion, styles: $styles)';
}


}

/// @nodoc
abstract mixin class _$RemoteArtStyleConfigCopyWith<$Res> implements $RemoteArtStyleConfigCopyWith<$Res> {
  factory _$RemoteArtStyleConfigCopyWith(_RemoteArtStyleConfig value, $Res Function(_RemoteArtStyleConfig) _then) = __$RemoteArtStyleConfigCopyWithImpl;
@override @useResult
$Res call({
 String artStyleConfigVersion, List<ArtStyle> styles
});




}
/// @nodoc
class __$RemoteArtStyleConfigCopyWithImpl<$Res>
    implements _$RemoteArtStyleConfigCopyWith<$Res> {
  __$RemoteArtStyleConfigCopyWithImpl(this._self, this._then);

  final _RemoteArtStyleConfig _self;
  final $Res Function(_RemoteArtStyleConfig) _then;

/// Create a copy of RemoteArtStyleConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? artStyleConfigVersion = null,Object? styles = null,}) {
  return _then(_RemoteArtStyleConfig(
artStyleConfigVersion: null == artStyleConfigVersion ? _self.artStyleConfigVersion : artStyleConfigVersion // ignore: cast_nullable_to_non_nullable
as String,styles: null == styles ? _self._styles : styles // ignore: cast_nullable_to_non_nullable
as List<ArtStyle>,
  ));
}


}

// dart format on
