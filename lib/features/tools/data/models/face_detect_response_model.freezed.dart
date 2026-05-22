// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'face_detect_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FaceInfoModel {

/// Magic Hour 内部路径
 String get path;/// CDN 缩略图 URL
 String get url;
/// Create a copy of FaceInfoModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FaceInfoModelCopyWith<FaceInfoModel> get copyWith => _$FaceInfoModelCopyWithImpl<FaceInfoModel>(this as FaceInfoModel, _$identity);

  /// Serializes this FaceInfoModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FaceInfoModel&&(identical(other.path, path) || other.path == path)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,path,url);

@override
String toString() {
  return 'FaceInfoModel(path: $path, url: $url)';
}


}

/// @nodoc
abstract mixin class $FaceInfoModelCopyWith<$Res>  {
  factory $FaceInfoModelCopyWith(FaceInfoModel value, $Res Function(FaceInfoModel) _then) = _$FaceInfoModelCopyWithImpl;
@useResult
$Res call({
 String path, String url
});




}
/// @nodoc
class _$FaceInfoModelCopyWithImpl<$Res>
    implements $FaceInfoModelCopyWith<$Res> {
  _$FaceInfoModelCopyWithImpl(this._self, this._then);

  final FaceInfoModel _self;
  final $Res Function(FaceInfoModel) _then;

/// Create a copy of FaceInfoModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? path = null,Object? url = null,}) {
  return _then(_self.copyWith(
path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [FaceInfoModel].
extension FaceInfoModelPatterns on FaceInfoModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FaceInfoModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FaceInfoModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FaceInfoModel value)  $default,){
final _that = this;
switch (_that) {
case _FaceInfoModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FaceInfoModel value)?  $default,){
final _that = this;
switch (_that) {
case _FaceInfoModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String path,  String url)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FaceInfoModel() when $default != null:
return $default(_that.path,_that.url);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String path,  String url)  $default,) {final _that = this;
switch (_that) {
case _FaceInfoModel():
return $default(_that.path,_that.url);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String path,  String url)?  $default,) {final _that = this;
switch (_that) {
case _FaceInfoModel() when $default != null:
return $default(_that.path,_that.url);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FaceInfoModel extends FaceInfoModel {
  const _FaceInfoModel({required this.path, required this.url}): super._();
  factory _FaceInfoModel.fromJson(Map<String, dynamic> json) => _$FaceInfoModelFromJson(json);

/// Magic Hour 内部路径
@override final  String path;
/// CDN 缩略图 URL
@override final  String url;

/// Create a copy of FaceInfoModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FaceInfoModelCopyWith<_FaceInfoModel> get copyWith => __$FaceInfoModelCopyWithImpl<_FaceInfoModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FaceInfoModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FaceInfoModel&&(identical(other.path, path) || other.path == path)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,path,url);

@override
String toString() {
  return 'FaceInfoModel(path: $path, url: $url)';
}


}

/// @nodoc
abstract mixin class _$FaceInfoModelCopyWith<$Res> implements $FaceInfoModelCopyWith<$Res> {
  factory _$FaceInfoModelCopyWith(_FaceInfoModel value, $Res Function(_FaceInfoModel) _then) = __$FaceInfoModelCopyWithImpl;
@override @useResult
$Res call({
 String path, String url
});




}
/// @nodoc
class __$FaceInfoModelCopyWithImpl<$Res>
    implements _$FaceInfoModelCopyWith<$Res> {
  __$FaceInfoModelCopyWithImpl(this._self, this._then);

  final _FaceInfoModel _self;
  final $Res Function(_FaceInfoModel) _then;

/// Create a copy of FaceInfoModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? path = null,Object? url = null,}) {
  return _then(_FaceInfoModel(
path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$FaceDetectResponseModel {

/// 目标图片 OSS URL
 String get targetOssUrl;/// 检测到的人脸列表
 List<FaceInfoModel> get faces;
/// Create a copy of FaceDetectResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FaceDetectResponseModelCopyWith<FaceDetectResponseModel> get copyWith => _$FaceDetectResponseModelCopyWithImpl<FaceDetectResponseModel>(this as FaceDetectResponseModel, _$identity);

  /// Serializes this FaceDetectResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FaceDetectResponseModel&&(identical(other.targetOssUrl, targetOssUrl) || other.targetOssUrl == targetOssUrl)&&const DeepCollectionEquality().equals(other.faces, faces));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,targetOssUrl,const DeepCollectionEquality().hash(faces));

@override
String toString() {
  return 'FaceDetectResponseModel(targetOssUrl: $targetOssUrl, faces: $faces)';
}


}

/// @nodoc
abstract mixin class $FaceDetectResponseModelCopyWith<$Res>  {
  factory $FaceDetectResponseModelCopyWith(FaceDetectResponseModel value, $Res Function(FaceDetectResponseModel) _then) = _$FaceDetectResponseModelCopyWithImpl;
@useResult
$Res call({
 String targetOssUrl, List<FaceInfoModel> faces
});




}
/// @nodoc
class _$FaceDetectResponseModelCopyWithImpl<$Res>
    implements $FaceDetectResponseModelCopyWith<$Res> {
  _$FaceDetectResponseModelCopyWithImpl(this._self, this._then);

  final FaceDetectResponseModel _self;
  final $Res Function(FaceDetectResponseModel) _then;

/// Create a copy of FaceDetectResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? targetOssUrl = null,Object? faces = null,}) {
  return _then(_self.copyWith(
targetOssUrl: null == targetOssUrl ? _self.targetOssUrl : targetOssUrl // ignore: cast_nullable_to_non_nullable
as String,faces: null == faces ? _self.faces : faces // ignore: cast_nullable_to_non_nullable
as List<FaceInfoModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [FaceDetectResponseModel].
extension FaceDetectResponseModelPatterns on FaceDetectResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FaceDetectResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FaceDetectResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FaceDetectResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _FaceDetectResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FaceDetectResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _FaceDetectResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String targetOssUrl,  List<FaceInfoModel> faces)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FaceDetectResponseModel() when $default != null:
return $default(_that.targetOssUrl,_that.faces);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String targetOssUrl,  List<FaceInfoModel> faces)  $default,) {final _that = this;
switch (_that) {
case _FaceDetectResponseModel():
return $default(_that.targetOssUrl,_that.faces);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String targetOssUrl,  List<FaceInfoModel> faces)?  $default,) {final _that = this;
switch (_that) {
case _FaceDetectResponseModel() when $default != null:
return $default(_that.targetOssUrl,_that.faces);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FaceDetectResponseModel extends FaceDetectResponseModel {
  const _FaceDetectResponseModel({required this.targetOssUrl, required final  List<FaceInfoModel> faces}): _faces = faces,super._();
  factory _FaceDetectResponseModel.fromJson(Map<String, dynamic> json) => _$FaceDetectResponseModelFromJson(json);

/// 目标图片 OSS URL
@override final  String targetOssUrl;
/// 检测到的人脸列表
 final  List<FaceInfoModel> _faces;
/// 检测到的人脸列表
@override List<FaceInfoModel> get faces {
  if (_faces is EqualUnmodifiableListView) return _faces;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_faces);
}


/// Create a copy of FaceDetectResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FaceDetectResponseModelCopyWith<_FaceDetectResponseModel> get copyWith => __$FaceDetectResponseModelCopyWithImpl<_FaceDetectResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FaceDetectResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FaceDetectResponseModel&&(identical(other.targetOssUrl, targetOssUrl) || other.targetOssUrl == targetOssUrl)&&const DeepCollectionEquality().equals(other._faces, _faces));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,targetOssUrl,const DeepCollectionEquality().hash(_faces));

@override
String toString() {
  return 'FaceDetectResponseModel(targetOssUrl: $targetOssUrl, faces: $faces)';
}


}

/// @nodoc
abstract mixin class _$FaceDetectResponseModelCopyWith<$Res> implements $FaceDetectResponseModelCopyWith<$Res> {
  factory _$FaceDetectResponseModelCopyWith(_FaceDetectResponseModel value, $Res Function(_FaceDetectResponseModel) _then) = __$FaceDetectResponseModelCopyWithImpl;
@override @useResult
$Res call({
 String targetOssUrl, List<FaceInfoModel> faces
});




}
/// @nodoc
class __$FaceDetectResponseModelCopyWithImpl<$Res>
    implements _$FaceDetectResponseModelCopyWith<$Res> {
  __$FaceDetectResponseModelCopyWithImpl(this._self, this._then);

  final _FaceDetectResponseModel _self;
  final $Res Function(_FaceDetectResponseModel) _then;

/// Create a copy of FaceDetectResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? targetOssUrl = null,Object? faces = null,}) {
  return _then(_FaceDetectResponseModel(
targetOssUrl: null == targetOssUrl ? _self.targetOssUrl : targetOssUrl // ignore: cast_nullable_to_non_nullable
as String,faces: null == faces ? _self._faces : faces // ignore: cast_nullable_to_non_nullable
as List<FaceInfoModel>,
  ));
}


}

// dart format on
