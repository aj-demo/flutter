
import 'package:flutter/material.dart';
import 'package:flutter_demo/providers/auth_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../layouts/base.dart';
import '../pages/home/index.dart';
import '../pages/setting/setting.dart';
import '../pages/cart/cart.dart';
import '../pages/home/next.dart';

import '../pages/login/index.dart';

final GlobalKey<NavigatorState> rootKey = GlobalKey();
final GlobalKey<StatefulNavigationShellState> shellKey = GlobalKey();
final GlobalKey<NavigatorState> homeKey = GlobalKey();

// var pagesCacheMap = {};

final appRouter = GoRouter(
  navigatorKey: rootKey,
  routes: [
    StatefulShellRoute(
      key: shellKey,
      parentNavigatorKey: rootKey,
      navigatorContainerBuilder: (context, navigationShell, children) {
        return BaseLayout(
          navigationShell: navigationShell,
          children: children,
        );
      },
      builder: (context, state, navigationShell) => navigationShell,
      branches: [
        StatefulShellBranch(
          preload: true,
          routes: [
            GoRoute(
              name: "home",
              path: '/',
              builder: (context, state) => const PageHome(),
              // pageBuilder: (context, state) {
              //   return CustomPageTransitionsBuilder.getTransitionPage(context, state, PageHome());
              // },
            ),
          ]
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: "cart",
              path: '/cart',
              builder: (context, state) => const PageCart(),
              // pageBuilder: (context, state) {
              //   return CustomPageTransitionsBuilder.getTransitionPage(context, state, PageCart());
              // },
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: "setting",
              path: '/setting',
              builder: (context, state) => const PageSetting(),
              // pageBuilder: (context, state) {
              //   return CustomPageTransitionsBuilder.getTransitionPage(context, state, PageSetting());
              // },
            ),
          ],
        ),
      ]
    ),
    ShellRoute(
      builder: (ontext, state, child) {
        return child;
      },
      routes: [
        GoRoute(
          name: "detail",
          path: '/detail',
          builder: (context, state) => const PageHomeNext(),
          // pageBuilder: (context, state) {
          //   return CustomPageTransitionsBuilder.getTransitionPage(context, state, PageHomeNext());
          // },
        ),
        GoRoute(
          name: "login",
          path: '/login',
          builder: (context, state) => const LoginPage(),
          // pageBuilder: (context, state) {
          //   return CustomPageTransitionsBuilder.getTransitionPage(context, state, LoginPage());
          // },
        ),
      ],
    ),
  ],
  redirect: (context, state) {
    final authProvider = context.read<AuthProvider>();
    if (!authProvider.isAuthenticated) {
      return '/login';
    }
    return null;
  },
  onEnter: (context, current, next, goRputer) {
    // print('${current.fullPath} --- ${next.fullPath}');
    // print(goRputer.routerDelegate.currentConfiguration.matches.length);
    return const Allow();
  }
);