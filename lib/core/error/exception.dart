import 'package:dio/dio.dart';

abstract class AppException implements Exception {
  final String message;
  final String? code;
  final dynamic details;

  AppException(this.message, {this.code, this.details});

  @override
  String toString() => 'AppException: $message (code: $code)';
}

class NetworkException extends AppException {
  NetworkException(super.message, {super.code, super.details});

  factory NetworkException.fromDioError(DioException error) {
    String message = error.message ?? 'Unknown network error';
    String? code = error.response?.statusCode?.toString();
    dynamic details = error.response?.data;

    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        message = 'Connection timed out';
        break;
      case DioExceptionType.badResponse:
        message = error.response?.statusMessage ?? message;
        break;
      case DioExceptionType.cancel:
        message = 'Request cancelled';
        break;
      default:
        break;
    }

    return NetworkException(message, code: code, details: details);
  }
}

class DataException extends AppException {
  DataException(super.message, {super.code, super.details});
}

class DomainException extends AppException {
  DomainException(super.message, {super.code, super.details});
}

class UnknownException extends AppException {
  UnknownException(super.message, {super.details}) : super(code: 'unknown');
}
