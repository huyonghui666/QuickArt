// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image_template_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ImageTemplateModel _$ImageTemplateModelFromJson(Map<String, dynamic> json) {
  return _ImageTemplateModel.fromJson(json);
}

/// @nodoc
mixin _$ImageTemplateModel {
  String get id => throw _privateConstructorUsedError;
  Map<String, String> get name => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  String? get thumbnailUrl => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;
  Map<String, String>? get description => throw _privateConstructorUsedError;

  /// Serializes this ImageTemplateModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ImageTemplateModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ImageTemplateModelCopyWith<ImageTemplateModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageTemplateModelCopyWith<$Res> {
  factory $ImageTemplateModelCopyWith(
    ImageTemplateModel value,
    $Res Function(ImageTemplateModel) then,
  ) = _$ImageTemplateModelCopyWithImpl<$Res, ImageTemplateModel>;
  @useResult
  $Res call({
    String id,
    Map<String, String> name,
    String imageUrl,
    String? thumbnailUrl,
    String? category,
    Map<String, String>? description,
  });
}

/// @nodoc
class _$ImageTemplateModelCopyWithImpl<$Res, $Val extends ImageTemplateModel>
    implements $ImageTemplateModelCopyWith<$Res> {
  _$ImageTemplateModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ImageTemplateModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? imageUrl = null,
    Object? thumbnailUrl = freezed,
    Object? category = freezed,
    Object? description = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as Map<String, String>,
            imageUrl: null == imageUrl
                ? _value.imageUrl
                : imageUrl // ignore: cast_nullable_to_non_nullable
                      as String,
            thumbnailUrl: freezed == thumbnailUrl
                ? _value.thumbnailUrl
                : thumbnailUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            category: freezed == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                      as String?,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as Map<String, String>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ImageTemplateModelImplCopyWith<$Res>
    implements $ImageTemplateModelCopyWith<$Res> {
  factory _$$ImageTemplateModelImplCopyWith(
    _$ImageTemplateModelImpl value,
    $Res Function(_$ImageTemplateModelImpl) then,
  ) = __$$ImageTemplateModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    Map<String, String> name,
    String imageUrl,
    String? thumbnailUrl,
    String? category,
    Map<String, String>? description,
  });
}

/// @nodoc
class __$$ImageTemplateModelImplCopyWithImpl<$Res>
    extends _$ImageTemplateModelCopyWithImpl<$Res, _$ImageTemplateModelImpl>
    implements _$$ImageTemplateModelImplCopyWith<$Res> {
  __$$ImageTemplateModelImplCopyWithImpl(
    _$ImageTemplateModelImpl _value,
    $Res Function(_$ImageTemplateModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ImageTemplateModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? imageUrl = null,
    Object? thumbnailUrl = freezed,
    Object? category = freezed,
    Object? description = freezed,
  }) {
    return _then(
      _$ImageTemplateModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value._name
            : name // ignore: cast_nullable_to_non_nullable
                  as Map<String, String>,
        imageUrl: null == imageUrl
            ? _value.imageUrl
            : imageUrl // ignore: cast_nullable_to_non_nullable
                  as String,
        thumbnailUrl: freezed == thumbnailUrl
            ? _value.thumbnailUrl
            : thumbnailUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        category: freezed == category
            ? _value.category
            : category // ignore: cast_nullable_to_non_nullable
                  as String?,
        description: freezed == description
            ? _value._description
            : description // ignore: cast_nullable_to_non_nullable
                  as Map<String, String>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ImageTemplateModelImpl extends _ImageTemplateModel {
  const _$ImageTemplateModelImpl({
    required this.id,
    required final Map<String, String> name,
    required this.imageUrl,
    this.thumbnailUrl,
    this.category,
    final Map<String, String>? description,
  }) : _name = name,
       _description = description,
       super._();

  factory _$ImageTemplateModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ImageTemplateModelImplFromJson(json);

  @override
  final String id;
  final Map<String, String> _name;
  @override
  Map<String, String> get name {
    if (_name is EqualUnmodifiableMapView) return _name;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_name);
  }

  @override
  final String imageUrl;
  @override
  final String? thumbnailUrl;
  @override
  final String? category;
  final Map<String, String>? _description;
  @override
  Map<String, String>? get description {
    final value = _description;
    if (value == null) return null;
    if (_description is EqualUnmodifiableMapView) return _description;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'ImageTemplateModel(id: $id, name: $name, imageUrl: $imageUrl, thumbnailUrl: $thumbnailUrl, category: $category, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageTemplateModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._name, _name) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.thumbnailUrl, thumbnailUrl) ||
                other.thumbnailUrl == thumbnailUrl) &&
            (identical(other.category, category) ||
                other.category == category) &&
            const DeepCollectionEquality().equals(
              other._description,
              _description,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    const DeepCollectionEquality().hash(_name),
    imageUrl,
    thumbnailUrl,
    category,
    const DeepCollectionEquality().hash(_description),
  );

  /// Create a copy of ImageTemplateModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ImageTemplateModelImplCopyWith<_$ImageTemplateModelImpl> get copyWith =>
      __$$ImageTemplateModelImplCopyWithImpl<_$ImageTemplateModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ImageTemplateModelImplToJson(this);
  }
}

abstract class _ImageTemplateModel extends ImageTemplateModel {
  const factory _ImageTemplateModel({
    required final String id,
    required final Map<String, String> name,
    required final String imageUrl,
    final String? thumbnailUrl,
    final String? category,
    final Map<String, String>? description,
  }) = _$ImageTemplateModelImpl;
  const _ImageTemplateModel._() : super._();

  factory _ImageTemplateModel.fromJson(Map<String, dynamic> json) =
      _$ImageTemplateModelImpl.fromJson;

  @override
  String get id;
  @override
  Map<String, String> get name;
  @override
  String get imageUrl;
  @override
  String? get thumbnailUrl;
  @override
  String? get category;
  @override
  Map<String, String>? get description;

  /// Create a copy of ImageTemplateModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ImageTemplateModelImplCopyWith<_$ImageTemplateModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
