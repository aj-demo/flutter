import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum TransitionType {
  fade,       // 淡入淡出
  scale,      // 缩放
  slide,      // 从左滑入
  slideFromRight, // 从右滑入 (类似 iOS)
  slideFromBottom, // 从底部滑入 (类似 Android)
}

class CustomPageTransitionsBuilder {
  TransitionType type;
  CustomPageTransitionsBuilder(this.type);

  static CustomPageTransitionsBuilder of(TransitionType type) {
    return CustomPageTransitionsBuilder(type);
  }

  CustomTransitionPage getPage(BuildContext context, GoRouterState state, Widget child) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: MaterialApp(home: child),
      transitionsBuilder: buildTransition,
    );
  }

  Widget buildTransition(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    final fn = CustomPageTransitionsBuilder.get(type);
    return fn(context, animation, secondaryAnimation, child);
  }

  static CustomTransitionPage getTransitionPage (context, state, child) {
    final extraMap = state.extra as Map<String, dynamic>? ?? {};
    final transitionType = extraMap['transition_type'];
    final transitionsBuilder = CustomPageTransitionsBuilder.get(transitionType);
    return CustomTransitionPage(
      key: state.pageKey,
      child: child,
      transitionsBuilder: transitionsBuilder,
    );
  }
  /// 根据类型获取对应的 TransitionBuilder
  static Widget Function(BuildContext, Animation<double>, Animation<double>, Widget) get(TransitionType? type) {
    switch (type) {
      case TransitionType.scale:
        return _buildScaleTransition;
      case TransitionType.slide:
        return _buildSlideTransition;
      case TransitionType.slideFromRight:
        return _buildSlideFromRightTransition;
      case TransitionType.slideFromBottom:
        return _buildSlideFromBottomTransition;
      default:
        return _buildFadeTransition;
    }
  }
  // --- 3. 实现具体的动画构建函数 ---
  /// 淡入淡出动画
  static Widget _buildFadeTransition(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }
  /// 缩放动画
  static Widget _buildScaleTransition(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return ScaleTransition(
      scale: CurvedAnimation(
        parent: animation,
        curve: Curves.elasticOut,
      ),
      child: child,
    );
  }
  /// 从左滑入 (默认)
  static Widget _buildSlideTransition(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    const begin = Offset(-1.0, 0.0);
    const end = Offset.zero;
    const curve = Curves.ease;
    var tween = Tween(begin: begin, end: end).chain(
      CurveTween(curve: curve),
    );
    return SlideTransition(
      position: animation.drive(tween),
      child: child,
    );
  }
  /// 从右滑入 (iOS 风格)
  static Widget _buildSlideFromRightTransition(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    const begin = Offset(1.0, 0.0);
    const end = Offset.zero;
    const curve = Curves.ease;
    var tween = Tween(begin: begin, end: end).chain(
      CurveTween(curve: curve),
    );
    return SlideTransition(
      position: animation.drive(tween),
      child: child,
    );
  }
  /// 从底部滑入 (Android 风格)
  static Widget _buildSlideFromBottomTransition(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    const begin = Offset(0.0, 1.0);
    const end = Offset.zero;
    const curve = Curves.ease;
    var tween = Tween(begin: begin, end: end).chain(
      CurveTween(curve: curve),
    );
    return SlideTransition(
      position: animation.drive(tween),
      child: child,
    );
  }
}