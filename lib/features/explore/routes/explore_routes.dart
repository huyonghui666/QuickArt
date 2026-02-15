import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// 发现路由
List<GoRoute> get exploreRoutes => [
      GoRoute(
        path: '/explore',
        builder: (context, state) => const Center(
          child: Text(
            'Explore Screen',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    ];
