// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'face_detect_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FaceInfo {

/// Magic Hour 内部路径
 String get path;/// CDN 缩略图 URL
 String get url;
/// Create a copy of FaceInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FaceInfoCopyWith<FaceInfo> get copyWith => _$FaceInfoCopyWithImpl<FaceInfo>(this as FaceInfo, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FaceInfo&&(identical(other.path, path) || other.path == path)&&(identical(other.url, url) || other.url == url));
}


@override
int get hashCode => Object.hash(runtimeType,path,url);

@override
String toString() {
  return 'FaceInfo(path: $path, url: $url)';
}


}

/// @nodoc
abstract mixin class $FaceInfoCopyWith<$Res>  {
  factory $FaceInfoCopyWith(FaceInfo value, $Res Function(FaceInfo) _then) = _$FaceInfoCopyWithImpl;
@useResult
$Res call({
 String path, String url
});




}
/// @nodoc
class _$FaceInfoCopyWithImpl<$Res>
    implements $FaceInfoCopyWith<$Res> {
  _$FaceInfoCopyWithImpl(this._self, this._then);

  final FaceInfo _self;
  final $Res Function(FaceInfo) _then;

/// Create a copy of FaceInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? path = null,Object? url = null,}) {
  return _then(_self.copyWith(
path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [FaceInfo].
extension FaceInfoPatterns on FaceInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FaceInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FaceInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FaceInfo value)  $default,){
final _that = this;
switch (_that) {
case _FaceInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FaceInfo value)?  $default,){
final _that = this;
switch (_that) {
case _FaceInfo() when $default != null:
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
case _FaceInfo() when $default != null:
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
case _FaceInfo():
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
case _FaceInfo() when $default != null:
return $default(_that.path,_that.url);case _:
  return null;

}
}

}

/// @nodoc


class _FaceInfo implements FaceInfo {
  const _FaceInfo({required this.path, required this.url});
  

/// Magic Hour 内部路径
@override final  String path;
/// CDN 缩略图 URL
@override final  String url;

/// Create a copy of FaceInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FaceInfoCopyWith<_FaceInfo> get copyWith => __$FaceInfoCopyWithImpl<_FaceInfo>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FaceInfo&&(identical(other.path, path) || other.path == path)&&(identical(other.url, url) || other.url == url));
}


@override
int get hashCode => Object.hash(runtimeType,path,url);

@override
String toString() {
  return 'FaceInfo(path: $path, url: $url)';
}


}

/// @nodoc
abstract mixin class _$FaceInfoCopyWith<$Res> implements $FaceInfoCopyWith<$Res> {
  factory _$FaceInfoCopyWith(_FaceInfo value, $Res Function(_FaceInfo) _then) = __$FaceInfoCopyWithImpl;
@override @useResult
$Res call({
 String path, String url
});




}
/// @nodoc
class __$FaceInfoCopyWithImpl<$Res>
    implements _$FaceInfoCopyWith<$Res> {
  __$FaceInfoCopyWithImpl(this._self, this._then);

  final _FaceInfo _self;
  final $Res Function(_FaceInfo) _then;

/// Create a copy of FaceInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? path = null,Object? url = null,}) {
  return _then(_FaceInfo(
path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$FaceDetectResult {

/// 目标图片 OSS URL
 String get targetOssUrl;/// 检测到的人脸列表
 List<FaceInfo> get faces;
/// Create a copy of FaceDetectResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FaceDetectResultCopyWith<FaceDetectResult> get copyWith => _$FaceDetectResultCopyWithImpl<FaceDetectResult>(this as FaceDetectResult, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FaceDetectResult&&(identical(other.targetOssUrl, targetOssUrl) || other.targetOssUrl == targetOssUrl)&&const DeepCollectionEquality().equals(other.faces, faces));
}


@override
int get hashCode => Object.hash(runtimeType,targetOssUrl,const DeepCollectionEquality().hash(faces));

@override
String toString() {
  return 'FaceDetectResult(targetOssUrl: $targetOssUrl, faces: $faces)';
}


}

/// @nodoc
abstract mixin class $FaceDetectResultCopyWith<$Res>  {
  factory $FaceDetectResultCopyWith(FaceDetectResult value, $Res Function(FaceDetectResult) _then) = _$FaceDetectResultCopyWithImpl;
@useResult
$Res call({
 String targetOssUrl, List<FaceInfo> faces
});




}
/// @nodoc
class _$FaceDetectResultCopyWithImpl<$Res>
    implements $FaceDetectResultCopyWith<$Res> {
  _$FaceDetectResultCopyWithImpl(this._self, this._then);

  final FaceDetectResult _self;
  final $Res Function(FaceDetectResult) _then;

/// Create a copy of FaceDetectResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? targetOssUrl = null,Object? faces = null,}) {
  return _then(_self.copyWith(
targetOssUrl: null == targetOssUrl ? _self.targetOssUrl : targetOssUrl // ignore: cast_nullable_to_non_nullable
as String,faces: null == faces ? _self.faces : faces // ignore: cast_nullable_to_non_nullable
as List<FaceInfo>,
  ));
}

}


/// Adds pattern-matching-related methods to [FaceDetectResult].
extension FaceDetectResultPatterns on FaceDetectResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FaceDetectResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FaceDetectResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FaceDetectResult value)  $default,){
final _that = this;
switch (_that) {
case _FaceDetectResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FaceDetectResult value)?  $default,){
final _that = this;
switch (_that) {
case _FaceDetectResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String targetOssUrl,  List<FaceInfo> faces)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FaceDetectResult() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String targetOssUrl,  List<FaceInfo> faces)  $default,) {final _that = this;
switch (_that) {
case _FaceDetectResult():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String targetOssUrl,  List<FaceInfo> faces)?  $default,) {final _that = this;
switch (_that) {
case _FaceDetectResult() when $default != null:
return $default(_that.targetOssUrl,_that.faces);case _:
  return null;

}
}

}

/// @nodoc


class _FaceDetectResult implements FaceDetectResult {
  const _FaceDetectResult({required this.targetOssUrl, required final  List<FaceInfo> faces}): _faces = faces;
  

/// 目标图片 OSS URL
@override final  String targetOssUrl;
/// 检测到的人脸列表
 final  List<FaceInfo> _faces;
/// 检测到的人脸列表
@override List<FaceInfo> get faces {
  if (_faces is EqualUnmodifiableListView) return _faces;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_faces);
}


/// Create a copy of FaceDetectResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FaceDetectResultCopyWith<_FaceDetectResult> get copyWith => __$FaceDetectResultCopyWithImpl<_FaceDetectResult>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FaceDetectResult&&(identical(other.targetOssUrl, targetOssUrl) || other.targetOssUrl == targetOssUrl)&&const DeepCollectionEquality().equals(other._faces, _faces));
}


@override
int get hashCode => Object.hash(runtimeType,targetOssUrl,const DeepCollectionEquality().hash(_faces));

@override
String toString() {
  return 'FaceDetectResult(targetOssUrl: $targetOssUrl, faces: $faces)';
}


}

/// @nodoc
abstract mixin class _$FaceDetectResultCopyWith<$Res> implements $FaceDetectResultCopyWith<$Res> {
  factory _$FaceDetectResultCopyWith(_FaceDetectResult value, $Res Function(_FaceDetectResult) _then) = __$FaceDetectResultCopyWithImpl;
@override @useResult
$Res call({
 String targetOssUrl, List<FaceInfo> faces
});




}
/// @nodoc
class __$FaceDetectResultCopyWithImpl<$Res>
    implements _$FaceDetectResultCopyWith<$Res> {
  __$FaceDetectResultCopyWithImpl(this._self, this._then);

  final _FaceDetectResult _self;
  final $Res Function(_FaceDetectResult) _then;

/// Create a copy of FaceDetectResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? targetOssUrl = null,Object? faces = null,}) {
  return _then(_FaceDetectResult(
targetOssUrl: null == targetOssUrl ? _self.targetOssUrl : targetOssUrl // ignore: cast_nullable_to_non_nullable
as String,faces: null == faces ? _self._faces : faces // ignore: cast_nullable_to_non_nullable
as List<FaceInfo>,
  ));
}


}

// dart format on
