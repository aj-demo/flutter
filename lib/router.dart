
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
              builder: (context, state) => const MyHomePage(title: 'okay', color: Colors.brown),
            ),
            GoRoute(
              name: 'recommend',
              path: '/recommend',
              builder: (context, state) => const MyHomePage(title: 'recommend', color: Colors.lightBlueAccent),
            ),
            GoRoute(
              name: 'contact',
              path: '/contact',
              builder: (context, state) => const MyHomePage(title: 'contact', color: Colors.green),
            ),
            GoRoute(
              name: 'center',
              path: '/center',
              builder: (context, state) => const PageCenter(title: 'center', color: Colors.greenAccent),
            ),
          ]
        )
      ],
      // builder: (context, state, navigationShell) {
      //   return BaseLayout(child: navigationShell);
      // },
      pageBuilder: (context, state, shell) {
        return CustomTransitionPage(
          child: BaseLayout(child: shell),
          opaque: true,
          transitionDuration: const Duration(milliseconds: 100),
          transitionsBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {

            const begin = Offset(0.0, 1.0);
            const end = Offset.zero;
            final tween = Tween(begin: begin, end: end);
            final offsetAnimation = animation.drive(tween);

            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          },
        );
      }
    ),
  ],
);
