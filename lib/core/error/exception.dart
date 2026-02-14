import 'package:dio/dio.dart';

/// 应用异常基类
abstract class AppException implements Exception {
  /// 构造函数
  AppException(this.message, {this.code, this.details});

  /// 错误信息
  final String message;

  /// 错误码
  final String? code;

  /// 错误详情
  final dynamic details;

  @override
  String toString() => 'AppException: $message (code: $code)';
}

/// 网络异常
class NetworkException extends AppException {
  /// 构造函数
  NetworkException(super.message, {super.code, super.details});

  /// 从 DioException 构造
  factory NetworkException.fromDioError(DioException error) {
    var message = error.message ?? 'Unknown network error';
    final code = error.response?.statusCode?.toString();
    final dynamic details = error.response?.data;

    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        message = 'Connection timed out';
      case DioExceptionType.badResponse:
        message = error.response?.statusMessage ?? message;
      case DioExceptionType.cancel:
        message = 'Request cancelled';
      case _:
        break;
    }

    return NetworkException(message, code: code, details: details);
  }
}

/// 数据异常
class DataException extends AppException {
  /// 构造函数
  DataException(super.message, {super.code, super.details});
}

/// 领域异常
class DomainException extends AppException {
  /// 构造函数
  DomainException(super.message, {super.code, super.details});
}

/// 未知异常
class UnknownException extends AppException {
  /// 构造函数
  UnknownException(super.message, {super.details}) : super(code: 'unknown');
}
