// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image_template_page.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ImageTemplatePage {

 List<ImageTemplate> get items; int get currentPage; int get totalPages; bool get hasMore;
/// Create a copy of ImageTemplatePage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ImageTemplatePageCopyWith<ImageTemplatePage> get copyWith => _$ImageTemplatePageCopyWithImpl<ImageTemplatePage>(this as ImageTemplatePage, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImageTemplatePage&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),currentPage,totalPages,hasMore);

@override
String toString() {
  return 'ImageTemplatePage(items: $items, currentPage: $currentPage, totalPages: $totalPages, hasMore: $hasMore)';
}


}

/// @nodoc
abstract mixin class $ImageTemplatePageCopyWith<$Res>  {
  factory $ImageTemplatePageCopyWith(ImageTemplatePage value, $Res Function(ImageTemplatePage) _then) = _$ImageTemplatePageCopyWithImpl;
@useResult
$Res call({
 List<ImageTemplate> items, int currentPage, int totalPages, bool hasMore
});




}
/// @nodoc
class _$ImageTemplatePageCopyWithImpl<$Res>
    implements $ImageTemplatePageCopyWith<$Res> {
  _$ImageTemplatePageCopyWithImpl(this._self, this._then);

  final ImageTemplatePage _self;
  final $Res Function(ImageTemplatePage) _then;

/// Create a copy of ImageTemplatePage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? currentPage = null,Object? totalPages = null,Object? hasMore = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<ImageTemplate>,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ImageTemplatePage].
extension ImageTemplatePagePatterns on ImageTemplatePage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ImageTemplatePage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ImageTemplatePage() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ImageTemplatePage value)  $default,){
final _that = this;
switch (_that) {
case _ImageTemplatePage():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ImageTemplatePage value)?  $default,){
final _that = this;
switch (_that) {
case _ImageTemplatePage() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ImageTemplate> items,  int currentPage,  int totalPages,  bool hasMore)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ImageTemplatePage() when $default != null:
return $default(_that.items,_that.currentPage,_that.totalPages,_that.hasMore);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ImageTemplate> items,  int currentPage,  int totalPages,  bool hasMore)  $default,) {final _that = this;
switch (_that) {
case _ImageTemplatePage():
return $default(_that.items,_that.currentPage,_that.totalPages,_that.hasMore);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ImageTemplate> items,  int currentPage,  int totalPages,  bool hasMore)?  $default,) {final _that = this;
switch (_that) {
case _ImageTemplatePage() when $default != null:
return $default(_that.items,_that.currentPage,_that.totalPages,_that.hasMore);case _:
  return null;

}
}

}

/// @nodoc


class _ImageTemplatePage extends ImageTemplatePage {
  const _ImageTemplatePage({required final  List<ImageTemplate> items, required this.currentPage, required this.totalPages, required this.hasMore}): _items = items,super._();
  

 final  List<ImageTemplate> _items;
@override List<ImageTemplate> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  int currentPage;
@override final  int totalPages;
@override final  bool hasMore;

/// Create a copy of ImageTemplatePage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ImageTemplatePageCopyWith<_ImageTemplatePage> get copyWith => __$ImageTemplatePageCopyWithImpl<_ImageTemplatePage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ImageTemplatePage&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),currentPage,totalPages,hasMore);

@override
String toString() {
  return 'ImageTemplatePage(items: $items, currentPage: $currentPage, totalPages: $totalPages, hasMore: $hasMore)';
}


}

/// @nodoc
abstract mixin class _$ImageTemplatePageCopyWith<$Res> implements $ImageTemplatePageCopyWith<$Res> {
  factory _$ImageTemplatePageCopyWith(_ImageTemplatePage value, $Res Function(_ImageTemplatePage) _then) = __$ImageTemplatePageCopyWithImpl;
@override @useResult
$Res call({
 List<ImageTemplate> items, int currentPage, int totalPages, bool hasMore
});




}
/// @nodoc
class __$ImageTemplatePageCopyWithImpl<$Res>
    implements _$ImageTemplatePageCopyWith<$Res> {
  __$ImageTemplatePageCopyWithImpl(this._self, this._then);

  final _ImageTemplatePage _self;
  final $Res Function(_ImageTemplatePage) _then;

/// Create a copy of ImageTemplatePage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? currentPage = null,Object? totalPages = null,Object? hasMore = null,}) {
  return _then(_ImageTemplatePage(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<ImageTemplate>,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
