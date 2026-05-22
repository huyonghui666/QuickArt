import 'package:dio/dio.dart';
import 'package:quick_art/core/error/exception.dart';
import 'package:quick_art/features/tools/data/models/face_detect_response_model.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

/// 换脸远程数据源接口
abstract interface class IFaceSwapRemoteDataSource {
  /// 上传目标图片，返回检测到的人脸列表
  Future<FaceDetectResponseModel> detectFaces(String imagePath);

  /// 提交换脸任务，返回 taskId
  ///
  /// [originalFacePaths] 目标图里要被替换的脸的 Magic Hour 内部路径
  /// [faceImageUrls]     用来替换的脸的 CDN URL（自拍脸），顺序与 originalFacePaths 对应
  Future<String> swapFaces({
    required String targetOssUrl,
    required List<String> originalFacePaths,
    required List<String> faceImageUrls,
  });
}

/// 换脸远程数据源
class FaceSwapRemoteDataSource implements IFaceSwapRemoteDataSource {
  /// 构造
  FaceSwapRemoteDataSource(this._dio);

  final Dio _dio;

  @override
  Future<String> swapFaces({
    required String targetOssUrl,
    required List<String> originalFacePaths,
    required List<String> faceImageUrls,
  }) async {
    try {
      if (originalFacePaths.length != faceImageUrls.length) {
        throw DataException('originalFacePaths and faceImages length mismatch');
      }

      final formData = FormData.fromMap({
        'targetOssUrl': targetOssUrl,
        'originalFacePaths': originalFacePaths,
        'faceImages': faceImageUrls,
      });
      final response = await _dio.post<Map<String, dynamic>>(
        '/face-swap/swap',
        data: formData,
      );
      if (response.statusCode != 200) {
        throw NetworkException('Face swap failed: ${response.data}');
      }
      final data = response.data;
      if (data == null) throw DataException('No data in face swap response');
      return data['taskId'] as String;
    } on DioException catch (e, stackTrace) {
      await Sentry.captureException(
        e,
        stackTrace: stackTrace,
        withScope: (scope) async {
          await scope.setTag('feature', 'face_swap');
        },
      );
      throw NetworkException.fromDioError(e);
    } catch (e, stackTrace) {
      if (e is AppException) rethrow;
      await Sentry.captureException(
        e,
        stackTrace: stackTrace,
        withScope: (scope) async {
          await scope.setTag('feature', 'face_swap');
        },
      );
      throw UnknownException(e.toString());
    }
  }

  @override
  Future<FaceDetectResponseModel> detectFaces(String imagePath) async {
    try {
      final formData = FormData.fromMap({
        'targetImage': await MultipartFile.fromFile(imagePath),
      });
      final response = await _dio.post<Map<String, dynamic>>(
        '/face-swap/detect',
        data: formData,
      );
      if (response.statusCode != 200) {
        throw NetworkException('Face detect failed: ${response.data}');
      }
      final data = response.data;
      if (data == null) {
        throw DataException('No data in face detect response');
      }
      return FaceDetectResponseModel.fromJson(data);
    } on DioException catch (e, stackTrace) {
      await Sentry.captureException(
        e,
        stackTrace: stackTrace,
        withScope: (scope) async {
          await scope.setTag('feature', 'face_detect');
          scope.contexts['input'] = {'imagePath': imagePath};
        },
      );
      throw NetworkException.fromDioError(e);
    } catch (e, stackTrace) {
      if (e is AppException) rethrow;
      await Sentry.captureException(
        e,
        stackTrace: stackTrace,
        withScope: (scope) async {
          await scope.setTag('feature', 'face_detect');
        },
      );
      throw UnknownException(e.toString());
    }
  }
}
