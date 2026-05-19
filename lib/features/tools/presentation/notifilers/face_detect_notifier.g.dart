// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'face_detect_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$faceDetectHash() => r'8e3eee46961af79740cbacfb698a2036accd3de1';

/// 人脸检测状态管理
///
/// Copied from [FaceDetect].
@ProviderFor(FaceDetect)
final faceDetectProvider =
    AutoDisposeAsyncNotifierProvider<FaceDetect, FaceDetectResult?>.internal(
      FaceDetect.new,
      name: r'faceDetectProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$faceDetectHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$FaceDetect = AutoDisposeAsyncNotifier<FaceDetectResult?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
