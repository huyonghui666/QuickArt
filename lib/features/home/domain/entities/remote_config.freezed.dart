// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'remote_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RemoteConfig {

 String get configVersion; List<ArtStyle> get styles;
/// Create a copy of RemoteConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RemoteConfigCopyWith<RemoteConfig> get copyWith => _$RemoteConfigCopyWithImpl<RemoteConfig>(this as RemoteConfig, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RemoteConfig&&(identical(other.configVersion, configVersion) || other.configVersion == configVersion)&&const DeepCollectionEquality().equals(other.styles, styles));
}


@override
int get hashCode => Object.hash(runtimeType,configVersion,const DeepCollectionEquality().hash(styles));

@override
String toString() {
  return 'RemoteConfig(configVersion: $configVersion, styles: $styles)';
}


}

/// @nodoc
abstract mixin class $RemoteConfigCopyWith<$Res>  {
  factory $RemoteConfigCopyWith(RemoteConfig value, $Res Function(RemoteConfig) _then) = _$RemoteConfigCopyWithImpl;
@useResult
$Res call({
 String configVersion, List<ArtStyle> styles
});




}
/// @nodoc
class _$RemoteConfigCopyWithImpl<$Res>
    implements $RemoteConfigCopyWith<$Res> {
  _$RemoteConfigCopyWithImpl(this._self, this._then);

  final RemoteConfig _self;
  final $Res Function(RemoteConfig) _then;

/// Create a copy of RemoteConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? configVersion = null,Object? styles = null,}) {
  return _then(_self.copyWith(
configVersion: null == configVersion ? _self.configVersion : configVersion // ignore: cast_nullable_to_non_nullable
as String,styles: null == styles ? _self.styles : styles // ignore: cast_nullable_to_non_nullable
as List<ArtStyle>,
  ));
}

}


/// Adds pattern-matching-related methods to [RemoteConfig].
extension RemoteConfigPatterns on RemoteConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RemoteConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RemoteConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RemoteConfig value)  $default,){
final _that = this;
switch (_that) {
case _RemoteConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RemoteConfig value)?  $default,){
final _that = this;
switch (_that) {
case _RemoteConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String configVersion,  List<ArtStyle> styles)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RemoteConfig() when $default != null:
return $default(_that.configVersion,_that.styles);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String configVersion,  List<ArtStyle> styles)  $default,) {final _that = this;
switch (_that) {
case _RemoteConfig():
return $default(_that.configVersion,_that.styles);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String configVersion,  List<ArtStyle> styles)?  $default,) {final _that = this;
switch (_that) {
case _RemoteConfig() when $default != null:
return $default(_that.configVersion,_that.styles);case _:
  return null;

}
}

}

/// @nodoc


class _RemoteConfig implements RemoteConfig {
  const _RemoteConfig({required this.configVersion, required final  List<ArtStyle> styles}): _styles = styles;
  

@override final  String configVersion;
 final  List<ArtStyle> _styles;
@override List<ArtStyle> get styles {
  if (_styles is EqualUnmodifiableListView) return _styles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_styles);
}


/// Create a copy of RemoteConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RemoteConfigCopyWith<_RemoteConfig> get copyWith => __$RemoteConfigCopyWithImpl<_RemoteConfig>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RemoteConfig&&(identical(other.configVersion, configVersion) || other.configVersion == configVersion)&&const DeepCollectionEquality().equals(other._styles, _styles));
}


@override
int get hashCode => Object.hash(runtimeType,configVersion,const DeepCollectionEquality().hash(_styles));

@override
String toString() {
  return 'RemoteConfig(configVersion: $configVersion, styles: $styles)';
}


}

/// @nodoc
abstract mixin class _$RemoteConfigCopyWith<$Res> implements $RemoteConfigCopyWith<$Res> {
  factory _$RemoteConfigCopyWith(_RemoteConfig value, $Res Function(_RemoteConfig) _then) = __$RemoteConfigCopyWithImpl;
@override @useResult
$Res call({
 String configVersion, List<ArtStyle> styles
});




}
/// @nodoc
class __$RemoteConfigCopyWithImpl<$Res>
    implements _$RemoteConfigCopyWith<$Res> {
  __$RemoteConfigCopyWithImpl(this._self, this._then);

  final _RemoteConfig _self;
  final $Res Function(_RemoteConfig) _then;

/// Create a copy of RemoteConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? configVersion = null,Object? styles = null,}) {
  return _then(_RemoteConfig(
configVersion: null == configVersion ? _self.configVersion : configVersion // ignore: cast_nullable_to_non_nullable
as String,styles: null == styles ? _self._styles : styles // ignore: cast_nullable_to_non_nullable
as List<ArtStyle>,
  ));
}


}

// dart format on
