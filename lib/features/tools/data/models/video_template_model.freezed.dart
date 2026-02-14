// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'video_template_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VideoTemplateModel {

/// 模板ID
 String get id;/// 模板名称（多语言支持）
 Map<String, String> get name;/// 封面图URL
 String get coverUrl;/// 视频URL
 String get videoUrl;/// 模板分类
 String? get category;/// 模板描述
 String? get description;
/// Create a copy of VideoTemplateModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VideoTemplateModelCopyWith<VideoTemplateModel> get copyWith => _$VideoTemplateModelCopyWithImpl<VideoTemplateModel>(this as VideoTemplateModel, _$identity);

  /// Serializes this VideoTemplateModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VideoTemplateModel&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.name, name)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl)&&(identical(other.videoUrl, videoUrl) || other.videoUrl == videoUrl)&&(identical(other.category, category) || other.category == category)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(name),coverUrl,videoUrl,category,description);

@override
String toString() {
  return 'VideoTemplateModel(id: $id, name: $name, coverUrl: $coverUrl, videoUrl: $videoUrl, category: $category, description: $description)';
}


}

/// @nodoc
abstract mixin class $VideoTemplateModelCopyWith<$Res>  {
  factory $VideoTemplateModelCopyWith(VideoTemplateModel value, $Res Function(VideoTemplateModel) _then) = _$VideoTemplateModelCopyWithImpl;
@useResult
$Res call({
 String id, Map<String, String> name, String coverUrl, String videoUrl, String? category, String? description
});




}
/// @nodoc
class _$VideoTemplateModelCopyWithImpl<$Res>
    implements $VideoTemplateModelCopyWith<$Res> {
  _$VideoTemplateModelCopyWithImpl(this._self, this._then);

  final VideoTemplateModel _self;
  final $Res Function(VideoTemplateModel) _then;

/// Create a copy of VideoTemplateModel
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


/// Adds pattern-matching-related methods to [VideoTemplateModel].
extension VideoTemplateModelPatterns on VideoTemplateModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VideoTemplateModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VideoTemplateModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VideoTemplateModel value)  $default,){
final _that = this;
switch (_that) {
case _VideoTemplateModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VideoTemplateModel value)?  $default,){
final _that = this;
switch (_that) {
case _VideoTemplateModel() when $default != null:
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
case _VideoTemplateModel() when $default != null:
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
case _VideoTemplateModel():
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
case _VideoTemplateModel() when $default != null:
return $default(_that.id,_that.name,_that.coverUrl,_that.videoUrl,_that.category,_that.description);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VideoTemplateModel extends VideoTemplateModel {
  const _VideoTemplateModel({required this.id, required final  Map<String, String> name, required this.coverUrl, required this.videoUrl, this.category, this.description}): _name = name,super._();
  factory _VideoTemplateModel.fromJson(Map<String, dynamic> json) => _$VideoTemplateModelFromJson(json);

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

/// Create a copy of VideoTemplateModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VideoTemplateModelCopyWith<_VideoTemplateModel> get copyWith => __$VideoTemplateModelCopyWithImpl<_VideoTemplateModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VideoTemplateModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VideoTemplateModel&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other._name, _name)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl)&&(identical(other.videoUrl, videoUrl) || other.videoUrl == videoUrl)&&(identical(other.category, category) || other.category == category)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(_name),coverUrl,videoUrl,category,description);

@override
String toString() {
  return 'VideoTemplateModel(id: $id, name: $name, coverUrl: $coverUrl, videoUrl: $videoUrl, category: $category, description: $description)';
}


}

/// @nodoc
abstract mixin class _$VideoTemplateModelCopyWith<$Res> implements $VideoTemplateModelCopyWith<$Res> {
  factory _$VideoTemplateModelCopyWith(_VideoTemplateModel value, $Res Function(_VideoTemplateModel) _then) = __$VideoTemplateModelCopyWithImpl;
@override @useResult
$Res call({
 String id, Map<String, String> name, String coverUrl, String videoUrl, String? category, String? description
});




}
/// @nodoc
class __$VideoTemplateModelCopyWithImpl<$Res>
    implements _$VideoTemplateModelCopyWith<$Res> {
  __$VideoTemplateModelCopyWithImpl(this._self, this._then);

  final _VideoTemplateModel _self;
  final $Res Function(_VideoTemplateModel) _then;

/// Create a copy of VideoTemplateModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? coverUrl = null,Object? videoUrl = null,Object? category = freezed,Object? description = freezed,}) {
  return _then(_VideoTemplateModel(
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
