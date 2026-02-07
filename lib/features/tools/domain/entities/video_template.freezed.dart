// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'video_template.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$VideoTemplate {
  /// 模板ID
  String get id => throw _privateConstructorUsedError;

  /// 模板名称（多语言支持）
  Map<String, String> get name => throw _privateConstructorUsedError;

  /// 封面图URL
  String get coverUrl => throw _privateConstructorUsedError;

  /// 视频URL
  String get videoUrl => throw _privateConstructorUsedError;

  /// 模板分类
  String? get category => throw _privateConstructorUsedError;

  /// 模板描述
  String? get description => throw _privateConstructorUsedError;

  /// Create a copy of VideoTemplate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VideoTemplateCopyWith<VideoTemplate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VideoTemplateCopyWith<$Res> {
  factory $VideoTemplateCopyWith(
    VideoTemplate value,
    $Res Function(VideoTemplate) then,
  ) = _$VideoTemplateCopyWithImpl<$Res, VideoTemplate>;
  @useResult
  $Res call({
    String id,
    Map<String, String> name,
    String coverUrl,
    String videoUrl,
    String? category,
    String? description,
  });
}

/// @nodoc
class _$VideoTemplateCopyWithImpl<$Res, $Val extends VideoTemplate>
    implements $VideoTemplateCopyWith<$Res> {
  _$VideoTemplateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VideoTemplate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? coverUrl = null,
    Object? videoUrl = null,
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
            coverUrl: null == coverUrl
                ? _value.coverUrl
                : coverUrl // ignore: cast_nullable_to_non_nullable
                      as String,
            videoUrl: null == videoUrl
                ? _value.videoUrl
                : videoUrl // ignore: cast_nullable_to_non_nullable
                      as String,
            category: freezed == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                      as String?,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$VideoTemplateImplCopyWith<$Res>
    implements $VideoTemplateCopyWith<$Res> {
  factory _$$VideoTemplateImplCopyWith(
    _$VideoTemplateImpl value,
    $Res Function(_$VideoTemplateImpl) then,
  ) = __$$VideoTemplateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    Map<String, String> name,
    String coverUrl,
    String videoUrl,
    String? category,
    String? description,
  });
}

/// @nodoc
class __$$VideoTemplateImplCopyWithImpl<$Res>
    extends _$VideoTemplateCopyWithImpl<$Res, _$VideoTemplateImpl>
    implements _$$VideoTemplateImplCopyWith<$Res> {
  __$$VideoTemplateImplCopyWithImpl(
    _$VideoTemplateImpl _value,
    $Res Function(_$VideoTemplateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of VideoTemplate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? coverUrl = null,
    Object? videoUrl = null,
    Object? category = freezed,
    Object? description = freezed,
  }) {
    return _then(
      _$VideoTemplateImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value._name
            : name // ignore: cast_nullable_to_non_nullable
                  as Map<String, String>,
        coverUrl: null == coverUrl
            ? _value.coverUrl
            : coverUrl // ignore: cast_nullable_to_non_nullable
                  as String,
        videoUrl: null == videoUrl
            ? _value.videoUrl
            : videoUrl // ignore: cast_nullable_to_non_nullable
                  as String,
        category: freezed == category
            ? _value.category
            : category // ignore: cast_nullable_to_non_nullable
                  as String?,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$VideoTemplateImpl implements _VideoTemplate {
  const _$VideoTemplateImpl({
    required this.id,
    required final Map<String, String> name,
    required this.coverUrl,
    required this.videoUrl,
    this.category,
    this.description,
  }) : _name = name;

  /// 模板ID
  @override
  final String id;

  /// 模板名称（多语言支持）
  final Map<String, String> _name;

  /// 模板名称（多语言支持）
  @override
  Map<String, String> get name {
    if (_name is EqualUnmodifiableMapView) return _name;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_name);
  }

  /// 封面图URL
  @override
  final String coverUrl;

  /// 视频URL
  @override
  final String videoUrl;

  /// 模板分类
  @override
  final String? category;

  /// 模板描述
  @override
  final String? description;

  @override
  String toString() {
    return 'VideoTemplate(id: $id, name: $name, coverUrl: $coverUrl, videoUrl: $videoUrl, category: $category, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VideoTemplateImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._name, _name) &&
            (identical(other.coverUrl, coverUrl) ||
                other.coverUrl == coverUrl) &&
            (identical(other.videoUrl, videoUrl) ||
                other.videoUrl == videoUrl) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    const DeepCollectionEquality().hash(_name),
    coverUrl,
    videoUrl,
    category,
    description,
  );

  /// Create a copy of VideoTemplate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VideoTemplateImplCopyWith<_$VideoTemplateImpl> get copyWith =>
      __$$VideoTemplateImplCopyWithImpl<_$VideoTemplateImpl>(this, _$identity);
}

abstract class _VideoTemplate implements VideoTemplate {
  const factory _VideoTemplate({
    required final String id,
    required final Map<String, String> name,
    required final String coverUrl,
    required final String videoUrl,
    final String? category,
    final String? description,
  }) = _$VideoTemplateImpl;

  /// 模板ID
  @override
  String get id;

  /// 模板名称（多语言支持）
  @override
  Map<String, String> get name;

  /// 封面图URL
  @override
  String get coverUrl;

  /// 视频URL
  @override
  String get videoUrl;

  /// 模板分类
  @override
  String? get category;

  /// 模板描述
  @override
  String? get description;

  /// Create a copy of VideoTemplate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VideoTemplateImplCopyWith<_$VideoTemplateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
