// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image_template_page_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ImageTemplatePageModel {

 List<ImageTemplateModel> get content; int get number; int get totalPages; bool get last;
/// Create a copy of ImageTemplatePageModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ImageTemplatePageModelCopyWith<ImageTemplatePageModel> get copyWith => _$ImageTemplatePageModelCopyWithImpl<ImageTemplatePageModel>(this as ImageTemplatePageModel, _$identity);

  /// Serializes this ImageTemplatePageModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImageTemplatePageModel&&const DeepCollectionEquality().equals(other.content, content)&&(identical(other.number, number) || other.number == number)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.last, last) || other.last == last));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(content),number,totalPages,last);

@override
String toString() {
  return 'ImageTemplatePageModel(content: $content, number: $number, totalPages: $totalPages, last: $last)';
}


}

/// @nodoc
abstract mixin class $ImageTemplatePageModelCopyWith<$Res>  {
  factory $ImageTemplatePageModelCopyWith(ImageTemplatePageModel value, $Res Function(ImageTemplatePageModel) _then) = _$ImageTemplatePageModelCopyWithImpl;
@useResult
$Res call({
 List<ImageTemplateModel> content, int number, int totalPages, bool last
});




}
/// @nodoc
class _$ImageTemplatePageModelCopyWithImpl<$Res>
    implements $ImageTemplatePageModelCopyWith<$Res> {
  _$ImageTemplatePageModelCopyWithImpl(this._self, this._then);

  final ImageTemplatePageModel _self;
  final $Res Function(ImageTemplatePageModel) _then;

/// Create a copy of ImageTemplatePageModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? content = null,Object? number = null,Object? totalPages = null,Object? last = null,}) {
  return _then(_self.copyWith(
content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as List<ImageTemplateModel>,number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,last: null == last ? _self.last : last // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ImageTemplatePageModel].
extension ImageTemplatePageModelPatterns on ImageTemplatePageModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ImageTemplatePageModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ImageTemplatePageModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ImageTemplatePageModel value)  $default,){
final _that = this;
switch (_that) {
case _ImageTemplatePageModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ImageTemplatePageModel value)?  $default,){
final _that = this;
switch (_that) {
case _ImageTemplatePageModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ImageTemplateModel> content,  int number,  int totalPages,  bool last)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ImageTemplatePageModel() when $default != null:
return $default(_that.content,_that.number,_that.totalPages,_that.last);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ImageTemplateModel> content,  int number,  int totalPages,  bool last)  $default,) {final _that = this;
switch (_that) {
case _ImageTemplatePageModel():
return $default(_that.content,_that.number,_that.totalPages,_that.last);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ImageTemplateModel> content,  int number,  int totalPages,  bool last)?  $default,) {final _that = this;
switch (_that) {
case _ImageTemplatePageModel() when $default != null:
return $default(_that.content,_that.number,_that.totalPages,_that.last);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ImageTemplatePageModel extends ImageTemplatePageModel {
  const _ImageTemplatePageModel({required final  List<ImageTemplateModel> content, required this.number, required this.totalPages, required this.last}): _content = content,super._();
  factory _ImageTemplatePageModel.fromJson(Map<String, dynamic> json) => _$ImageTemplatePageModelFromJson(json);

 final  List<ImageTemplateModel> _content;
@override List<ImageTemplateModel> get content {
  if (_content is EqualUnmodifiableListView) return _content;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_content);
}

@override final  int number;
@override final  int totalPages;
@override final  bool last;

/// Create a copy of ImageTemplatePageModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ImageTemplatePageModelCopyWith<_ImageTemplatePageModel> get copyWith => __$ImageTemplatePageModelCopyWithImpl<_ImageTemplatePageModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ImageTemplatePageModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ImageTemplatePageModel&&const DeepCollectionEquality().equals(other._content, _content)&&(identical(other.number, number) || other.number == number)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.last, last) || other.last == last));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_content),number,totalPages,last);

@override
String toString() {
  return 'ImageTemplatePageModel(content: $content, number: $number, totalPages: $totalPages, last: $last)';
}


}

/// @nodoc
abstract mixin class _$ImageTemplatePageModelCopyWith<$Res> implements $ImageTemplatePageModelCopyWith<$Res> {
  factory _$ImageTemplatePageModelCopyWith(_ImageTemplatePageModel value, $Res Function(_ImageTemplatePageModel) _then) = __$ImageTemplatePageModelCopyWithImpl;
@override @useResult
$Res call({
 List<ImageTemplateModel> content, int number, int totalPages, bool last
});




}
/// @nodoc
class __$ImageTemplatePageModelCopyWithImpl<$Res>
    implements _$ImageTemplatePageModelCopyWith<$Res> {
  __$ImageTemplatePageModelCopyWithImpl(this._self, this._then);

  final _ImageTemplatePageModel _self;
  final $Res Function(_ImageTemplatePageModel) _then;

/// Create a copy of ImageTemplatePageModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? content = null,Object? number = null,Object? totalPages = null,Object? last = null,}) {
  return _then(_ImageTemplatePageModel(
content: null == content ? _self._content : content // ignore: cast_nullable_to_non_nullable
as List<ImageTemplateModel>,number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,last: null == last ? _self.last : last // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
