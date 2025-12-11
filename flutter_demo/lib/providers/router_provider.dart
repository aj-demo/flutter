
import 'package:flutter/material.dart';
import 'package:flutter_demo/components/PageTransitionsBuilder/index.dart';
import 'package:flutter_demo/providers/global_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../layouts/base.dart';
import '../pages/home/index.dart';
import '../pages/setting/setting.dart';
import '../pages/cart/cart.dart';
import '../pages/home/next.dart';
import '../pages/login/index.dart';
import '../pages/setting/user_info.dart';

final GlobalKey<NavigatorState> rootKey = GlobalKey();
final GlobalKey<StatefulNavigationShellState> shellKey = GlobalKey();
final GlobalKey<NavigatorState> homeKey = GlobalKey();

final routerProvider = Provider<GoRouter>((ref) {
  final notifier = ref.read(globalProvider.notifier);
  return GoRouter(
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
                pageBuilder: (context, state) {
                  return CustomPageTransitionsBuilder.getTransitionPage(context, state, PageHome());
                },
                redirect: (context, state) {
                  Future.microtask(() => notifier.setUpstairs(Text('data abc')));
                  return null;
                },
              ),
            ]
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: "cart",
                path: '/cart',
                pageBuilder: (context, state) {
                  return CustomPageTransitionsBuilder.getTransitionPage(context, state, PageCart());
                },
                redirect: (context, state) {
                  return null;
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: "setting",
                path: '/setting',
                pageBuilder: (context, state) {
                  return CustomPageTransitionsBuilder.getTransitionPage(context, state, PageSetting());
                },
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
            pageBuilder: (context, state) {
              return CustomPageTransitionsBuilder.getTransitionPage(context, state, PageHomeNext());
            },
          ),
          GoRoute(
            name: "login",
            path: '/login',
            pageBuilder: (context, state) {
              return CustomPageTransitionsBuilder.getTransitionPage(context, state, LoginPage());
            },
          ),
          GoRoute(
            name: "user_info",
            path: '/user_info',
            pageBuilder: (context, state) {
              return CustomPageTransitionsBuilder.getTransitionPage(context, state, UserInfo());
            },
          ),
        ],
      ),
    ],
    redirect: (context, state) {
      Future.microtask(() => notifier.clearUpstairs());
      return null;
    },
    onEnter: (context, current, next, goRputer) {
      // print('onEnter: globalNotifier.clearUpstairs');
      // final globalNotifier = ref.read(globalProvider.notifier);
      // globalNotifier.clearUpstairs();
      return const Allow();
    }
  );
});