// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image_template_page_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ImageTemplatePageModel _$ImageTemplatePageModelFromJson(
  Map<String, dynamic> json,
) {
  return _ImageTemplatePageModel.fromJson(json);
}

/// @nodoc
mixin _$ImageTemplatePageModel {
  List<ImageTemplateModel> get content => throw _privateConstructorUsedError;
  int get number => throw _privateConstructorUsedError;
  int get totalPages => throw _privateConstructorUsedError;
  bool get last => throw _privateConstructorUsedError;

  /// Serializes this ImageTemplatePageModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ImageTemplatePageModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ImageTemplatePageModelCopyWith<ImageTemplatePageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageTemplatePageModelCopyWith<$Res> {
  factory $ImageTemplatePageModelCopyWith(
    ImageTemplatePageModel value,
    $Res Function(ImageTemplatePageModel) then,
  ) = _$ImageTemplatePageModelCopyWithImpl<$Res, ImageTemplatePageModel>;
  @useResult
  $Res call({
    List<ImageTemplateModel> content,
    int number,
    int totalPages,
    bool last,
  });
}

/// @nodoc
class _$ImageTemplatePageModelCopyWithImpl<
  $Res,
  $Val extends ImageTemplatePageModel
>
    implements $ImageTemplatePageModelCopyWith<$Res> {
  _$ImageTemplatePageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ImageTemplatePageModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? number = null,
    Object? totalPages = null,
    Object? last = null,
  }) {
    return _then(
      _value.copyWith(
            content: null == content
                ? _value.content
                : content // ignore: cast_nullable_to_non_nullable
                      as List<ImageTemplateModel>,
            number: null == number
                ? _value.number
                : number // ignore: cast_nullable_to_non_nullable
                      as int,
            totalPages: null == totalPages
                ? _value.totalPages
                : totalPages // ignore: cast_nullable_to_non_nullable
                      as int,
            last: null == last
                ? _value.last
                : last // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ImageTemplatePageModelImplCopyWith<$Res>
    implements $ImageTemplatePageModelCopyWith<$Res> {
  factory _$$ImageTemplatePageModelImplCopyWith(
    _$ImageTemplatePageModelImpl value,
    $Res Function(_$ImageTemplatePageModelImpl) then,
  ) = __$$ImageTemplatePageModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<ImageTemplateModel> content,
    int number,
    int totalPages,
    bool last,
  });
}

/// @nodoc
class __$$ImageTemplatePageModelImplCopyWithImpl<$Res>
    extends
        _$ImageTemplatePageModelCopyWithImpl<$Res, _$ImageTemplatePageModelImpl>
    implements _$$ImageTemplatePageModelImplCopyWith<$Res> {
  __$$ImageTemplatePageModelImplCopyWithImpl(
    _$ImageTemplatePageModelImpl _value,
    $Res Function(_$ImageTemplatePageModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ImageTemplatePageModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? number = null,
    Object? totalPages = null,
    Object? last = null,
  }) {
    return _then(
      _$ImageTemplatePageModelImpl(
        content: null == content
            ? _value._content
            : content // ignore: cast_nullable_to_non_nullable
                  as List<ImageTemplateModel>,
        number: null == number
            ? _value.number
            : number // ignore: cast_nullable_to_non_nullable
                  as int,
        totalPages: null == totalPages
            ? _value.totalPages
            : totalPages // ignore: cast_nullable_to_non_nullable
                  as int,
        last: null == last
            ? _value.last
            : last // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ImageTemplatePageModelImpl extends _ImageTemplatePageModel {
  const _$ImageTemplatePageModelImpl({
    required final List<ImageTemplateModel> content,
    required this.number,
    required this.totalPages,
    required this.last,
  }) : _content = content,
       super._();

  factory _$ImageTemplatePageModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ImageTemplatePageModelImplFromJson(json);

  final List<ImageTemplateModel> _content;
  @override
  List<ImageTemplateModel> get content {
    if (_content is EqualUnmodifiableListView) return _content;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_content);
  }

  @override
  final int number;
  @override
  final int totalPages;
  @override
  final bool last;

  @override
  String toString() {
    return 'ImageTemplatePageModel(content: $content, number: $number, totalPages: $totalPages, last: $last)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageTemplatePageModelImpl &&
            const DeepCollectionEquality().equals(other._content, _content) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.last, last) || other.last == last));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_content),
    number,
    totalPages,
    last,
  );

  /// Create a copy of ImageTemplatePageModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ImageTemplatePageModelImplCopyWith<_$ImageTemplatePageModelImpl>
  get copyWith =>
      __$$ImageTemplatePageModelImplCopyWithImpl<_$ImageTemplatePageModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ImageTemplatePageModelImplToJson(this);
  }
}

abstract class _ImageTemplatePageModel extends ImageTemplatePageModel {
  const factory _ImageTemplatePageModel({
    required final List<ImageTemplateModel> content,
    required final int number,
    required final int totalPages,
    required final bool last,
  }) = _$ImageTemplatePageModelImpl;
  const _ImageTemplatePageModel._() : super._();

  factory _ImageTemplatePageModel.fromJson(Map<String, dynamic> json) =
      _$ImageTemplatePageModelImpl.fromJson;

  @override
  List<ImageTemplateModel> get content;
  @override
  int get number;
  @override
  int get totalPages;
  @override
  bool get last;

  /// Create a copy of ImageTemplatePageModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ImageTemplatePageModelImplCopyWith<_$ImageTemplatePageModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}
