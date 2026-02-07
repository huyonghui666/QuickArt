// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'video_template_page.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$VideoTemplatePage {
  /// 模板列表
  List<VideoTemplate> get items => throw _privateConstructorUsedError;

  /// 当前页码
  int get currentPage => throw _privateConstructorUsedError;

  /// 总页数
  int get totalPages => throw _privateConstructorUsedError;

  /// 是否有更多数据
  bool get hasMore => throw _privateConstructorUsedError;

  /// Create a copy of VideoTemplatePage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VideoTemplatePageCopyWith<VideoTemplatePage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VideoTemplatePageCopyWith<$Res> {
  factory $VideoTemplatePageCopyWith(
    VideoTemplatePage value,
    $Res Function(VideoTemplatePage) then,
  ) = _$VideoTemplatePageCopyWithImpl<$Res, VideoTemplatePage>;
  @useResult
  $Res call({
    List<VideoTemplate> items,
    int currentPage,
    int totalPages,
    bool hasMore,
  });
}

/// @nodoc
class _$VideoTemplatePageCopyWithImpl<$Res, $Val extends VideoTemplatePage>
    implements $VideoTemplatePageCopyWith<$Res> {
  _$VideoTemplatePageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VideoTemplatePage
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
                      as List<VideoTemplate>,
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
abstract class _$$VideoTemplatePageImplCopyWith<$Res>
    implements $VideoTemplatePageCopyWith<$Res> {
  factory _$$VideoTemplatePageImplCopyWith(
    _$VideoTemplatePageImpl value,
    $Res Function(_$VideoTemplatePageImpl) then,
  ) = __$$VideoTemplatePageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<VideoTemplate> items,
    int currentPage,
    int totalPages,
    bool hasMore,
  });
}

/// @nodoc
class __$$VideoTemplatePageImplCopyWithImpl<$Res>
    extends _$VideoTemplatePageCopyWithImpl<$Res, _$VideoTemplatePageImpl>
    implements _$$VideoTemplatePageImplCopyWith<$Res> {
  __$$VideoTemplatePageImplCopyWithImpl(
    _$VideoTemplatePageImpl _value,
    $Res Function(_$VideoTemplatePageImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of VideoTemplatePage
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
      _$VideoTemplatePageImpl(
        items: null == items
            ? _value._items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<VideoTemplate>,
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

class _$VideoTemplatePageImpl implements _VideoTemplatePage {
  const _$VideoTemplatePageImpl({
    required final List<VideoTemplate> items,
    required this.currentPage,
    required this.totalPages,
    required this.hasMore,
  }) : _items = items;

  /// 模板列表
  final List<VideoTemplate> _items;

  /// 模板列表
  @override
  List<VideoTemplate> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  /// 当前页码
  @override
  final int currentPage;

  /// 总页数
  @override
  final int totalPages;

  /// 是否有更多数据
  @override
  final bool hasMore;

  @override
  String toString() {
    return 'VideoTemplatePage(items: $items, currentPage: $currentPage, totalPages: $totalPages, hasMore: $hasMore)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VideoTemplatePageImpl &&
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

  /// Create a copy of VideoTemplatePage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VideoTemplatePageImplCopyWith<_$VideoTemplatePageImpl> get copyWith =>
      __$$VideoTemplatePageImplCopyWithImpl<_$VideoTemplatePageImpl>(
        this,
        _$identity,
      );
}

abstract class _VideoTemplatePage implements VideoTemplatePage {
  const factory _VideoTemplatePage({
    required final List<VideoTemplate> items,
    required final int currentPage,
    required final int totalPages,
    required final bool hasMore,
  }) = _$VideoTemplatePageImpl;

  /// 模板列表
  @override
  List<VideoTemplate> get items;

  /// 当前页码
  @override
  int get currentPage;

  /// 总页数
  @override
  int get totalPages;

  /// 是否有更多数据
  @override
  bool get hasMore;

  /// Create a copy of VideoTemplatePage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VideoTemplatePageImplCopyWith<_$VideoTemplatePageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
