// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'video_template_page_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

VideoTemplatePageModel _$VideoTemplatePageModelFromJson(
  Map<String, dynamic> json,
) {
  return _VideoTemplatePageModel.fromJson(json);
}

/// @nodoc
mixin _$VideoTemplatePageModel {
  /// 模板列表数据
  List<VideoTemplateModel> get content => throw _privateConstructorUsedError;

  /// 总页数
  int get totalPages => throw _privateConstructorUsedError;

  /// 总元素数量
  int get totalElements => throw _privateConstructorUsedError;

  /// 是否是最后一页
  bool get last => throw _privateConstructorUsedError;

  /// 每页大小
  int get size => throw _privateConstructorUsedError;

  /// 当前页码
  int get number => throw _privateConstructorUsedError;

  /// Serializes this VideoTemplatePageModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VideoTemplatePageModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VideoTemplatePageModelCopyWith<VideoTemplatePageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VideoTemplatePageModelCopyWith<$Res> {
  factory $VideoTemplatePageModelCopyWith(
    VideoTemplatePageModel value,
    $Res Function(VideoTemplatePageModel) then,
  ) = _$VideoTemplatePageModelCopyWithImpl<$Res, VideoTemplatePageModel>;
  @useResult
  $Res call({
    List<VideoTemplateModel> content,
    int totalPages,
    int totalElements,
    bool last,
    int size,
    int number,
  });
}

/// @nodoc
class _$VideoTemplatePageModelCopyWithImpl<
  $Res,
  $Val extends VideoTemplatePageModel
>
    implements $VideoTemplatePageModelCopyWith<$Res> {
  _$VideoTemplatePageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VideoTemplatePageModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? totalPages = null,
    Object? totalElements = null,
    Object? last = null,
    Object? size = null,
    Object? number = null,
  }) {
    return _then(
      _value.copyWith(
            content: null == content
                ? _value.content
                : content // ignore: cast_nullable_to_non_nullable
                      as List<VideoTemplateModel>,
            totalPages: null == totalPages
                ? _value.totalPages
                : totalPages // ignore: cast_nullable_to_non_nullable
                      as int,
            totalElements: null == totalElements
                ? _value.totalElements
                : totalElements // ignore: cast_nullable_to_non_nullable
                      as int,
            last: null == last
                ? _value.last
                : last // ignore: cast_nullable_to_non_nullable
                      as bool,
            size: null == size
                ? _value.size
                : size // ignore: cast_nullable_to_non_nullable
                      as int,
            number: null == number
                ? _value.number
                : number // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$VideoTemplatePageModelImplCopyWith<$Res>
    implements $VideoTemplatePageModelCopyWith<$Res> {
  factory _$$VideoTemplatePageModelImplCopyWith(
    _$VideoTemplatePageModelImpl value,
    $Res Function(_$VideoTemplatePageModelImpl) then,
  ) = __$$VideoTemplatePageModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<VideoTemplateModel> content,
    int totalPages,
    int totalElements,
    bool last,
    int size,
    int number,
  });
}

/// @nodoc
class __$$VideoTemplatePageModelImplCopyWithImpl<$Res>
    extends
        _$VideoTemplatePageModelCopyWithImpl<$Res, _$VideoTemplatePageModelImpl>
    implements _$$VideoTemplatePageModelImplCopyWith<$Res> {
  __$$VideoTemplatePageModelImplCopyWithImpl(
    _$VideoTemplatePageModelImpl _value,
    $Res Function(_$VideoTemplatePageModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of VideoTemplatePageModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? totalPages = null,
    Object? totalElements = null,
    Object? last = null,
    Object? size = null,
    Object? number = null,
  }) {
    return _then(
      _$VideoTemplatePageModelImpl(
        content: null == content
            ? _value._content
            : content // ignore: cast_nullable_to_non_nullable
                  as List<VideoTemplateModel>,
        totalPages: null == totalPages
            ? _value.totalPages
            : totalPages // ignore: cast_nullable_to_non_nullable
                  as int,
        totalElements: null == totalElements
            ? _value.totalElements
            : totalElements // ignore: cast_nullable_to_non_nullable
                  as int,
        last: null == last
            ? _value.last
            : last // ignore: cast_nullable_to_non_nullable
                  as bool,
        size: null == size
            ? _value.size
            : size // ignore: cast_nullable_to_non_nullable
                  as int,
        number: null == number
            ? _value.number
            : number // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$VideoTemplatePageModelImpl extends _VideoTemplatePageModel {
  const _$VideoTemplatePageModelImpl({
    required final List<VideoTemplateModel> content,
    required this.totalPages,
    required this.totalElements,
    required this.last,
    required this.size,
    required this.number,
  }) : _content = content,
       super._();

  factory _$VideoTemplatePageModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$VideoTemplatePageModelImplFromJson(json);

  /// 模板列表数据
  final List<VideoTemplateModel> _content;

  /// 模板列表数据
  @override
  List<VideoTemplateModel> get content {
    if (_content is EqualUnmodifiableListView) return _content;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_content);
  }

  /// 总页数
  @override
  final int totalPages;

  /// 总元素数量
  @override
  final int totalElements;

  /// 是否是最后一页
  @override
  final bool last;

  /// 每页大小
  @override
  final int size;

  /// 当前页码
  @override
  final int number;

  @override
  String toString() {
    return 'VideoTemplatePageModel(content: $content, totalPages: $totalPages, totalElements: $totalElements, last: $last, size: $size, number: $number)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VideoTemplatePageModelImpl &&
            const DeepCollectionEquality().equals(other._content, _content) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.totalElements, totalElements) ||
                other.totalElements == totalElements) &&
            (identical(other.last, last) || other.last == last) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.number, number) || other.number == number));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_content),
    totalPages,
    totalElements,
    last,
    size,
    number,
  );

  /// Create a copy of VideoTemplatePageModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VideoTemplatePageModelImplCopyWith<_$VideoTemplatePageModelImpl>
  get copyWith =>
      __$$VideoTemplatePageModelImplCopyWithImpl<_$VideoTemplatePageModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$VideoTemplatePageModelImplToJson(this);
  }
}

abstract class _VideoTemplatePageModel extends VideoTemplatePageModel {
  const factory _VideoTemplatePageModel({
    required final List<VideoTemplateModel> content,
    required final int totalPages,
    required final int totalElements,
    required final bool last,
    required final int size,
    required final int number,
  }) = _$VideoTemplatePageModelImpl;
  const _VideoTemplatePageModel._() : super._();

  factory _VideoTemplatePageModel.fromJson(Map<String, dynamic> json) =
      _$VideoTemplatePageModelImpl.fromJson;

  /// 模板列表数据
  @override
  List<VideoTemplateModel> get content;

  /// 总页数
  @override
  int get totalPages;

  /// 总元素数量
  @override
  int get totalElements;

  /// 是否是最后一页
  @override
  bool get last;

  /// 每页大小
  @override
  int get size;

  /// 当前页码
  @override
  int get number;

  /// Create a copy of VideoTemplatePageModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VideoTemplatePageModelImplCopyWith<_$VideoTemplatePageModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}
