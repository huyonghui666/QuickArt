// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'remote_config_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RemoteConfigModel {

 String get configVersion; List<ArtStyleModel> get styles;
/// Create a copy of RemoteConfigModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RemoteConfigModelCopyWith<RemoteConfigModel> get copyWith => _$RemoteConfigModelCopyWithImpl<RemoteConfigModel>(this as RemoteConfigModel, _$identity);

  /// Serializes this RemoteConfigModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RemoteConfigModel&&(identical(other.configVersion, configVersion) || other.configVersion == configVersion)&&const DeepCollectionEquality().equals(other.styles, styles));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,configVersion,const DeepCollectionEquality().hash(styles));

@override
String toString() {
  return 'RemoteConfigModel(configVersion: $configVersion, styles: $styles)';
}


}

/// @nodoc
abstract mixin class $RemoteConfigModelCopyWith<$Res>  {
  factory $RemoteConfigModelCopyWith(RemoteConfigModel value, $Res Function(RemoteConfigModel) _then) = _$RemoteConfigModelCopyWithImpl;
@useResult
$Res call({
 String configVersion, List<ArtStyleModel> styles
});




}
/// @nodoc
class _$RemoteConfigModelCopyWithImpl<$Res>
    implements $RemoteConfigModelCopyWith<$Res> {
  _$RemoteConfigModelCopyWithImpl(this._self, this._then);

  final RemoteConfigModel _self;
  final $Res Function(RemoteConfigModel) _then;

/// Create a copy of RemoteConfigModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? configVersion = null,Object? styles = null,}) {
  return _then(_self.copyWith(
configVersion: null == configVersion ? _self.configVersion : configVersion // ignore: cast_nullable_to_non_nullable
as String,styles: null == styles ? _self.styles : styles // ignore: cast_nullable_to_non_nullable
as List<ArtStyleModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [RemoteConfigModel].
extension RemoteConfigModelPatterns on RemoteConfigModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RemoteConfigModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RemoteConfigModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RemoteConfigModel value)  $default,){
final _that = this;
switch (_that) {
case _RemoteConfigModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RemoteConfigModel value)?  $default,){
final _that = this;
switch (_that) {
case _RemoteConfigModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String configVersion,  List<ArtStyleModel> styles)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RemoteConfigModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String configVersion,  List<ArtStyleModel> styles)  $default,) {final _that = this;
switch (_that) {
case _RemoteConfigModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String configVersion,  List<ArtStyleModel> styles)?  $default,) {final _that = this;
switch (_that) {
case _RemoteConfigModel() when $default != null:
return $default(_that.configVersion,_that.styles);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RemoteConfigModel implements RemoteConfigModel {
  const _RemoteConfigModel({required this.configVersion, required final  List<ArtStyleModel> styles}): _styles = styles;
  factory _RemoteConfigModel.fromJson(Map<String, dynamic> json) => _$RemoteConfigModelFromJson(json);

@override final  String configVersion;
 final  List<ArtStyleModel> _styles;
@override List<ArtStyleModel> get styles {
  if (_styles is EqualUnmodifiableListView) return _styles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_styles);
}


/// Create a copy of RemoteConfigModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RemoteConfigModelCopyWith<_RemoteConfigModel> get copyWith => __$RemoteConfigModelCopyWithImpl<_RemoteConfigModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RemoteConfigModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RemoteConfigModel&&(identical(other.configVersion, configVersion) || other.configVersion == configVersion)&&const DeepCollectionEquality().equals(other._styles, _styles));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,configVersion,const DeepCollectionEquality().hash(_styles));

@override
String toString() {
  return 'RemoteConfigModel(configVersion: $configVersion, styles: $styles)';
}


}

/// @nodoc
abstract mixin class _$RemoteConfigModelCopyWith<$Res> implements $RemoteConfigModelCopyWith<$Res> {
  factory _$RemoteConfigModelCopyWith(_RemoteConfigModel value, $Res Function(_RemoteConfigModel) _then) = __$RemoteConfigModelCopyWithImpl;
@override @useResult
$Res call({
 String configVersion, List<ArtStyleModel> styles
});




}
/// @nodoc
class __$RemoteConfigModelCopyWithImpl<$Res>
    implements _$RemoteConfigModelCopyWith<$Res> {
  __$RemoteConfigModelCopyWithImpl(this._self, this._then);

  final _RemoteConfigModel _self;
  final $Res Function(_RemoteConfigModel) _then;

/// Create a copy of RemoteConfigModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? configVersion = null,Object? styles = null,}) {
  return _then(_RemoteConfigModel(
configVersion: null == configVersion ? _self.configVersion : configVersion // ignore: cast_nullable_to_non_nullable
as String,styles: null == styles ? _self._styles : styles // ignore: cast_nullable_to_non_nullable
as List<ArtStyleModel>,
  ));
}


}

// dart format on
