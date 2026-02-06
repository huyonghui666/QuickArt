// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image_template_page.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ImageTemplatePage {
  List<ImageTemplate> get items => throw _privateConstructorUsedError;
  int get currentPage => throw _privateConstructorUsedError;
  int get totalPages => throw _privateConstructorUsedError;
  bool get hasMore => throw _privateConstructorUsedError;

  /// Create a copy of ImageTemplatePage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ImageTemplatePageCopyWith<ImageTemplatePage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageTemplatePageCopyWith<$Res> {
  factory $ImageTemplatePageCopyWith(
    ImageTemplatePage value,
    $Res Function(ImageTemplatePage) then,
  ) = _$ImageTemplatePageCopyWithImpl<$Res, ImageTemplatePage>;
  @useResult
  $Res call({
    List<ImageTemplate> items,
    int currentPage,
    int totalPages,
    bool hasMore,
  });
}

/// @nodoc
class _$ImageTemplatePageCopyWithImpl<$Res, $Val extends ImageTemplatePage>
    implements $ImageTemplatePageCopyWith<$Res> {
  _$ImageTemplatePageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ImageTemplatePage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? currentPage = null,
    Object? totalPages = null,
    Object? hasMore = null,
  }) {
    return _then(
      _value.copyWith(
            items: null == items
                ? _value.items
                : items // ignore: cast_nullable_to_non_nullable
                      as List<ImageTemplate>,
            currentPage: null == currentPage
                ? _value.currentPage
                : currentPage // ignore: cast_nullable_to_non_nullable
                      as int,
            totalPages: null == totalPages
                ? _value.totalPages
                : totalPages // ignore: cast_nullable_to_non_nullable
                      as int,
            hasMore: null == hasMore
                ? _value.hasMore
                : hasMore // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ImageTemplatePageImplCopyWith<$Res>
    implements $ImageTemplatePageCopyWith<$Res> {
  factory _$$ImageTemplatePageImplCopyWith(
    _$ImageTemplatePageImpl value,
    $Res Function(_$ImageTemplatePageImpl) then,
  ) = __$$ImageTemplatePageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<ImageTemplate> items,
    int currentPage,
    int totalPages,
    bool hasMore,
  });
}

/// @nodoc
class __$$ImageTemplatePageImplCopyWithImpl<$Res>
    extends _$ImageTemplatePageCopyWithImpl<$Res, _$ImageTemplatePageImpl>
    implements _$$ImageTemplatePageImplCopyWith<$Res> {
  __$$ImageTemplatePageImplCopyWithImpl(
    _$ImageTemplatePageImpl _value,
    $Res Function(_$ImageTemplatePageImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ImageTemplatePage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? currentPage = null,
    Object? totalPages = null,
    Object? hasMore = null,
  }) {
    return _then(
      _$ImageTemplatePageImpl(
        items: null == items
            ? _value._items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<ImageTemplate>,
        currentPage: null == currentPage
            ? _value.currentPage
            : currentPage // ignore: cast_nullable_to_non_nullable
                  as int,
        totalPages: null == totalPages
            ? _value.totalPages
            : totalPages // ignore: cast_nullable_to_non_nullable
                  as int,
        hasMore: null == hasMore
            ? _value.hasMore
            : hasMore // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$ImageTemplatePageImpl extends _ImageTemplatePage {
  const _$ImageTemplatePageImpl({
    required final List<ImageTemplate> items,
    required this.currentPage,
    required this.totalPages,
    required this.hasMore,
  }) : _items = items,
       super._();

  final List<ImageTemplate> _items;
  @override
  List<ImageTemplate> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final int currentPage;
  @override
  final int totalPages;
  @override
  final bool hasMore;

  @override
  String toString() {
    return 'ImageTemplatePage(items: $items, currentPage: $currentPage, totalPages: $totalPages, hasMore: $hasMore)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageTemplatePageImpl &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.hasMore, hasMore) || other.hasMore == hasMore));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_items),
    currentPage,
    totalPages,
    hasMore,
  );

  /// Create a copy of ImageTemplatePage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ImageTemplatePageImplCopyWith<_$ImageTemplatePageImpl> get copyWith =>
      __$$ImageTemplatePageImplCopyWithImpl<_$ImageTemplatePageImpl>(
        this,
        _$identity,
      );
}

abstract class _ImageTemplatePage extends ImageTemplatePage {
  const factory _ImageTemplatePage({
    required final List<ImageTemplate> items,
    required final int currentPage,
    required final int totalPages,
    required final bool hasMore,
  }) = _$ImageTemplatePageImpl;
  const _ImageTemplatePage._() : super._();

  @override
  List<ImageTemplate> get items;
  @override
  int get currentPage;
  @override
  int get totalPages;
  @override
  bool get hasMore;

  /// Create a copy of ImageTemplatePage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ImageTemplatePageImplCopyWith<_$ImageTemplatePageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
