
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import './layouts/base.dart';
import './views/home/index.dart';
import './views/center/index.dart';
import './views/login/index.dart';

final router = GoRouter(
  routes: [
    StatefulShellRoute.indexedStack(
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: 'home',
              path: '/',
              builder: (context, state) => const MyHomePage(title: 'okay', color: Colors.brown),
            ),
          ]
        ),
        StatefulShellBranch(
            routes: [
              GoRoute(
                name: 'recommend',
                path: '/recommend',
                builder: (context, state) => const MyHomePage(title: 'recommend', color: Colors.lightBlueAccent),
              ),
            ]
        ),
        StatefulShellBranch(
            routes: [
              GoRoute(
                name: 'contact',
                path: '/contact',
                builder: (context, state) => const MyHomePage(title: 'contact', color: Colors.green),
              ),
            ]
        ),
        StatefulShellBranch(
            routes: [
              GoRoute(
                name: 'center',
                path: '/center',
                builder: (context, state) => const PageCenter(title: 'center', color: Colors.greenAccent),
              ),
            ]
        )
      ],
      builder: (context, state, navigationShell) {
        return BaseLayout(navigationShell: navigationShell);
      },
      // pageBuilder: (context, state, navigationShell) {
      //   return CustomTransitionPage(
      //     child: BaseLayout(navigationShell: navigationShell),
      //     opaque: true,
      //     transitionDuration: const Duration(milliseconds: 1000),
      //     transitionsBuilder: (
      //         BuildContext context,
      //         Animation<double> animation,
      //         Animation<double> secondaryAnimation,
      //         Widget child) {
      //
      //       const begin = Offset(0.0, 1.0);
      //       const end = Offset.zero;
      //       final tween = Tween(begin: begin, end: end);
      //       final offsetAnimation = animation.drive(tween);
      //
      //       return SlideTransition(
      //         position: offsetAnimation,
      //         child: child,
      //       );
      //     },
      //   );
      // }
    ),
    GoRoute(
      name: 'login',
      path: '/login',
      builder: (context, state) => const LoginPage(),
    ),
  ],
);
