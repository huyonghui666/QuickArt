import 'package:logger/logger.dart';

/// 日志
final logger = Logger(
  printer: PrettyPrinter(
    methodCount: 1,
    errorMethodCount: 5,
    lineLength: 80,
  ),
);
