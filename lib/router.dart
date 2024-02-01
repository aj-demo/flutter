
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import './layouts/base.dart';
import './views/home/index.dart';
import './views/center/index.dart';

final router = GoRouter(
  routes: [
    StatefulShellRoute.indexedStack(
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
                name: 'home',
                path: '/',
                builder: (context, state) => const MyHomePage(title: 'okay'),
            ),
            GoRoute(
              name: 'recommend',
              path: '/recommend',
              builder: (context, state) => const MyHomePage(title: 'recommend'),
            ),
            GoRoute(
              name: 'contact',
              path: '/contact',
              builder: (context, state) => const MyHomePage(title: 'contact'),
            ),
            GoRoute(
              name: 'center',
              path: '/center',
              builder: (context, state) => const PageCenter(title: 'center'),
            ),
          ]
        )
      ],
      builder: (context, state, navigationShell) {
        return BaseLayout(child: navigationShell);
      },
    ),
  ],
);