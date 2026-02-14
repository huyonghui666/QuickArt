// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image_template_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ImageTemplateModel {

 String get id; Map<String, String> get name; String get imageUrl; String? get thumbnailUrl; String? get category; Map<String, String>? get description;
/// Create a copy of ImageTemplateModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ImageTemplateModelCopyWith<ImageTemplateModel> get copyWith => _$ImageTemplateModelCopyWithImpl<ImageTemplateModel>(this as ImageTemplateModel, _$identity);

  /// Serializes this ImageTemplateModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImageTemplateModel&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.name, name)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl)&&(identical(other.category, category) || other.category == category)&&const DeepCollectionEquality().equals(other.description, description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(name),imageUrl,thumbnailUrl,category,const DeepCollectionEquality().hash(description));

@override
String toString() {
  return 'ImageTemplateModel(id: $id, name: $name, imageUrl: $imageUrl, thumbnailUrl: $thumbnailUrl, category: $category, description: $description)';
}


}

/// @nodoc
abstract mixin class $ImageTemplateModelCopyWith<$Res>  {
  factory $ImageTemplateModelCopyWith(ImageTemplateModel value, $Res Function(ImageTemplateModel) _then) = _$ImageTemplateModelCopyWithImpl;
@useResult
$Res call({
 String id, Map<String, String> name, String imageUrl, String? thumbnailUrl, String? category, Map<String, String>? description
});




}
/// @nodoc
class _$ImageTemplateModelCopyWithImpl<$Res>
    implements $ImageTemplateModelCopyWith<$Res> {
  _$ImageTemplateModelCopyWithImpl(this._self, this._then);

  final ImageTemplateModel _self;
  final $Res Function(ImageTemplateModel) _then;

/// Create a copy of ImageTemplateModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? imageUrl = null,Object? thumbnailUrl = freezed,Object? category = freezed,Object? description = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as Map<String, String>,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,thumbnailUrl: freezed == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as Map<String, String>?,
  ));
}

}


/// Adds pattern-matching-related methods to [ImageTemplateModel].
extension ImageTemplateModelPatterns on ImageTemplateModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ImageTemplateModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ImageTemplateModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ImageTemplateModel value)  $default,){
final _that = this;
switch (_that) {
case _ImageTemplateModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ImageTemplateModel value)?  $default,){
final _that = this;
switch (_that) {
case _ImageTemplateModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  Map<String, String> name,  String imageUrl,  String? thumbnailUrl,  String? category,  Map<String, String>? description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ImageTemplateModel() when $default != null:
return $default(_that.id,_that.name,_that.imageUrl,_that.thumbnailUrl,_that.category,_that.description);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  Map<String, String> name,  String imageUrl,  String? thumbnailUrl,  String? category,  Map<String, String>? description)  $default,) {final _that = this;
switch (_that) {
case _ImageTemplateModel():
return $default(_that.id,_that.name,_that.imageUrl,_that.thumbnailUrl,_that.category,_that.description);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  Map<String, String> name,  String imageUrl,  String? thumbnailUrl,  String? category,  Map<String, String>? description)?  $default,) {final _that = this;
switch (_that) {
case _ImageTemplateModel() when $default != null:
return $default(_that.id,_that.name,_that.imageUrl,_that.thumbnailUrl,_that.category,_that.description);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ImageTemplateModel extends ImageTemplateModel {
  const _ImageTemplateModel({required this.id, required final  Map<String, String> name, required this.imageUrl, this.thumbnailUrl, this.category, final  Map<String, String>? description}): _name = name,_description = description,super._();
  factory _ImageTemplateModel.fromJson(Map<String, dynamic> json) => _$ImageTemplateModelFromJson(json);

@override final  String id;
 final  Map<String, String> _name;
@override Map<String, String> get name {
  if (_name is EqualUnmodifiableMapView) return _name;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_name);
}

@override final  String imageUrl;
@override final  String? thumbnailUrl;
@override final  String? category;
 final  Map<String, String>? _description;
@override Map<String, String>? get description {
  final value = _description;
  if (value == null) return null;
  if (_description is EqualUnmodifiableMapView) return _description;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of ImageTemplateModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ImageTemplateModelCopyWith<_ImageTemplateModel> get copyWith => __$ImageTemplateModelCopyWithImpl<_ImageTemplateModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ImageTemplateModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ImageTemplateModel&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other._name, _name)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl)&&(identical(other.category, category) || other.category == category)&&const DeepCollectionEquality().equals(other._description, _description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(_name),imageUrl,thumbnailUrl,category,const DeepCollectionEquality().hash(_description));

@override
String toString() {
  return 'ImageTemplateModel(id: $id, name: $name, imageUrl: $imageUrl, thumbnailUrl: $thumbnailUrl, category: $category, description: $description)';
}


}

/// @nodoc
abstract mixin class _$ImageTemplateModelCopyWith<$Res> implements $ImageTemplateModelCopyWith<$Res> {
  factory _$ImageTemplateModelCopyWith(_ImageTemplateModel value, $Res Function(_ImageTemplateModel) _then) = __$ImageTemplateModelCopyWithImpl;
@override @useResult
$Res call({
 String id, Map<String, String> name, String imageUrl, String? thumbnailUrl, String? category, Map<String, String>? description
});




}
/// @nodoc
class __$ImageTemplateModelCopyWithImpl<$Res>
    implements _$ImageTemplateModelCopyWith<$Res> {
  __$ImageTemplateModelCopyWithImpl(this._self, this._then);

  final _ImageTemplateModel _self;
  final $Res Function(_ImageTemplateModel) _then;

/// Create a copy of ImageTemplateModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? imageUrl = null,Object? thumbnailUrl = freezed,Object? category = freezed,Object? description = freezed,}) {
  return _then(_ImageTemplateModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self._name : name // ignore: cast_nullable_to_non_nullable
as Map<String, String>,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,thumbnailUrl: freezed == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self._description : description // ignore: cast_nullable_to_non_nullable
as Map<String, String>?,
  ));
}


}

// dart format on
