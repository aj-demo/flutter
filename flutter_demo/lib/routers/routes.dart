
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../model/PageTransitionsBuilder/index.dart';
import '../layouts/base.dart';
import '../pages/home/index.dart';
import '../pages/setting/setting.dart';
import '../pages/cart/cart.dart';
import '../pages/home/next.dart';


final GlobalKey<NavigatorState> rootKey = GlobalKey();
final GlobalKey<StatefulNavigationShellState> shellKey = GlobalKey();
final GlobalKey<NavigatorState> homeKey = GlobalKey();

// var pagesCacheMap = {};

final appRouter = GoRouter(
  navigatorKey: rootKey,
  // initialLocation: '/home',
  routes: [
    StatefulShellRoute.indexedStack(
      key: shellKey,
      parentNavigatorKey: rootKey,
      // navigatorContainerBuilder: (BuildContext context, StatefulNavigationShell navigator, List<Widget> previousNavigators) {
      //   // Wrap each branch navigator with the app's BaseLayout so the shell UI stays around child navigation
      //   return BaseLayout(
      //     navigator: navigator,
      //     child: previousNavigators[navigator.currentIndex],
      //   );
      // },
      builder: (BuildContext context, GoRouterState state, StatefulNavigationShell navigationShell) {
        // Return the navigationShell produced by the StatefulShellRoute
        return BaseLayout(
          navigationShell: navigationShell,
        );
      },
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
            ),
          ]
        ),
        StatefulShellBranch(routes: [
          GoRoute(
            name: "cart",
            path: '/cart',
            pageBuilder: (context, state) {
              return CustomPageTransitionsBuilder.getTransitionPage(context, state, PageCart());
            },
          ),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
            name: "setting",
            path: '/setting',
            pageBuilder: (context, state) {
              return CustomPageTransitionsBuilder.getTransitionPage(context, state, PageSetting());
            },
          ),
        ]),
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
      ],
    ),
  ],
  redirect: (context, state) {
    // final goRouter = GoRouter.of(context);
    // final stack = goRouter.routerDelegate.currentConfiguration;
    
    return null;
  },
  onEnter: (context, current, next, goRputer) {
    // print('${current.fullPath} --- ${next.fullPath}');
    // print(goRputer.routerDelegate.currentConfiguration.matches.length);
    return const Allow();
  }
);