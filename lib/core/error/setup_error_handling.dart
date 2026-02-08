import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

Future<void> setupErrorHandling() async {
  //  Flutter 框架级错误（同步）
  FlutterError.onError = (FlutterErrorDetails details) {
    //  在开发环境下，仍然显示错误UI，方便调试
    FlutterError.presentError(details);

    // 上报 Sentry
    Sentry.captureException(
      details.exception,
      stackTrace: details.stack,
      withScope: (scope) {
        scope.level = SentryLevel.fatal;
      },
    );
  };

  // 异步/未捕获错误
  PlatformDispatcher.instance.onError = (error, stack) {
    Sentry.captureException(
      error,
      stackTrace: stack,
      withScope: (scope) {
        scope.level = SentryLevel.error;
      },
    );
    return true; // 阻止默认崩溃
  };

  // 3. 自定义崩溃页面（企业级 UI 友好）
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return Material(
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(title: const Text('出错了')),
            body: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      size: 80,
                      color: Colors.red,
                    ),
                    const SizedBox(height: 24),
                    Text(
                      '抱歉，出现问题了',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      details.exceptionAsString(),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 32),
                    ElevatedButton(
                      onPressed: () {
                        // 尝试返回或重载
                        if (Navigator.canPop(context)) {
                          Navigator.pop(context);
                        }
                      },
                      child: const Text('返回上一页'),
                    ),
                    const SizedBox(height: 16),
                    TextButton(
                      onPressed: () {
                        //TODO 可加反馈按钮，跳转客服或邮件
                      },
                      child: const Text('可以艾特我们官方社媒 @quickartai'),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  };
}
