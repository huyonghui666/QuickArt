// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'video_template_page_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VideoTemplatePageModel {

/// 模板列表数据
 List<VideoTemplateModel> get content;/// 总页数
 int get totalPages;/// 总元素数量
 int get totalElements;/// 是否是最后一页
 bool get last;/// 每页大小
 int get size;/// 当前页码
 int get number;
/// Create a copy of VideoTemplatePageModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VideoTemplatePageModelCopyWith<VideoTemplatePageModel> get copyWith => _$VideoTemplatePageModelCopyWithImpl<VideoTemplatePageModel>(this as VideoTemplatePageModel, _$identity);

  /// Serializes this VideoTemplatePageModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VideoTemplatePageModel&&const DeepCollectionEquality().equals(other.content, content)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.totalElements, totalElements) || other.totalElements == totalElements)&&(identical(other.last, last) || other.last == last)&&(identical(other.size, size) || other.size == size)&&(identical(other.number, number) || other.number == number));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(content),totalPages,totalElements,last,size,number);

@override
String toString() {
  return 'VideoTemplatePageModel(content: $content, totalPages: $totalPages, totalElements: $totalElements, last: $last, size: $size, number: $number)';
}


}

/// @nodoc
abstract mixin class $VideoTemplatePageModelCopyWith<$Res>  {
  factory $VideoTemplatePageModelCopyWith(VideoTemplatePageModel value, $Res Function(VideoTemplatePageModel) _then) = _$VideoTemplatePageModelCopyWithImpl;
@useResult
$Res call({
 List<VideoTemplateModel> content, int totalPages, int totalElements, bool last, int size, int number
});




}
/// @nodoc
class _$VideoTemplatePageModelCopyWithImpl<$Res>
    implements $VideoTemplatePageModelCopyWith<$Res> {
  _$VideoTemplatePageModelCopyWithImpl(this._self, this._then);

  final VideoTemplatePageModel _self;
  final $Res Function(VideoTemplatePageModel) _then;

/// Create a copy of VideoTemplatePageModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? content = null,Object? totalPages = null,Object? totalElements = null,Object? last = null,Object? size = null,Object? number = null,}) {
  return _then(_self.copyWith(
content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as List<VideoTemplateModel>,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,totalElements: null == totalElements ? _self.totalElements : totalElements // ignore: cast_nullable_to_non_nullable
as int,last: null == last ? _self.last : last // ignore: cast_nullable_to_non_nullable
as bool,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [VideoTemplatePageModel].
extension VideoTemplatePageModelPatterns on VideoTemplatePageModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VideoTemplatePageModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VideoTemplatePageModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VideoTemplatePageModel value)  $default,){
final _that = this;
switch (_that) {
case _VideoTemplatePageModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VideoTemplatePageModel value)?  $default,){
final _that = this;
switch (_that) {
case _VideoTemplatePageModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<VideoTemplateModel> content,  int totalPages,  int totalElements,  bool last,  int size,  int number)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VideoTemplatePageModel() when $default != null:
return $default(_that.content,_that.totalPages,_that.totalElements,_that.last,_that.size,_that.number);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<VideoTemplateModel> content,  int totalPages,  int totalElements,  bool last,  int size,  int number)  $default,) {final _that = this;
switch (_that) {
case _VideoTemplatePageModel():
return $default(_that.content,_that.totalPages,_that.totalElements,_that.last,_that.size,_that.number);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<VideoTemplateModel> content,  int totalPages,  int totalElements,  bool last,  int size,  int number)?  $default,) {final _that = this;
switch (_that) {
case _VideoTemplatePageModel() when $default != null:
return $default(_that.content,_that.totalPages,_that.totalElements,_that.last,_that.size,_that.number);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VideoTemplatePageModel extends VideoTemplatePageModel {
  const _VideoTemplatePageModel({required final  List<VideoTemplateModel> content, required this.totalPages, required this.totalElements, required this.last, required this.size, required this.number}): _content = content,super._();
  factory _VideoTemplatePageModel.fromJson(Map<String, dynamic> json) => _$VideoTemplatePageModelFromJson(json);

/// 模板列表数据
 final  List<VideoTemplateModel> _content;
/// 模板列表数据
@override List<VideoTemplateModel> get content {
  if (_content is EqualUnmodifiableListView) return _content;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_content);
}

/// 总页数
@override final  int totalPages;
/// 总元素数量
@override final  int totalElements;
/// 是否是最后一页
@override final  bool last;
/// 每页大小
@override final  int size;
/// 当前页码
@override final  int number;

/// Create a copy of VideoTemplatePageModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VideoTemplatePageModelCopyWith<_VideoTemplatePageModel> get copyWith => __$VideoTemplatePageModelCopyWithImpl<_VideoTemplatePageModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VideoTemplatePageModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VideoTemplatePageModel&&const DeepCollectionEquality().equals(other._content, _content)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.totalElements, totalElements) || other.totalElements == totalElements)&&(identical(other.last, last) || other.last == last)&&(identical(other.size, size) || other.size == size)&&(identical(other.number, number) || other.number == number));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_content),totalPages,totalElements,last,size,number);

@override
String toString() {
  return 'VideoTemplatePageModel(content: $content, totalPages: $totalPages, totalElements: $totalElements, last: $last, size: $size, number: $number)';
}


}

/// @nodoc
abstract mixin class _$VideoTemplatePageModelCopyWith<$Res> implements $VideoTemplatePageModelCopyWith<$Res> {
  factory _$VideoTemplatePageModelCopyWith(_VideoTemplatePageModel value, $Res Function(_VideoTemplatePageModel) _then) = __$VideoTemplatePageModelCopyWithImpl;
@override @useResult
$Res call({
 List<VideoTemplateModel> content, int totalPages, int totalElements, bool last, int size, int number
});




}
/// @nodoc
class __$VideoTemplatePageModelCopyWithImpl<$Res>
    implements _$VideoTemplatePageModelCopyWith<$Res> {
  __$VideoTemplatePageModelCopyWithImpl(this._self, this._then);

  final _VideoTemplatePageModel _self;
  final $Res Function(_VideoTemplatePageModel) _then;

/// Create a copy of VideoTemplatePageModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? content = null,Object? totalPages = null,Object? totalElements = null,Object? last = null,Object? size = null,Object? number = null,}) {
  return _then(_VideoTemplatePageModel(
content: null == content ? _self._content : content // ignore: cast_nullable_to_non_nullable
as List<VideoTemplateModel>,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,totalElements: null == totalElements ? _self.totalElements : totalElements // ignore: cast_nullable_to_non_nullable
as int,last: null == last ? _self.last : last // ignore: cast_nullable_to_non_nullable
as bool,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
