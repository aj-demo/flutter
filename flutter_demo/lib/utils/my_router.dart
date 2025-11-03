
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const operateTypeKey = "_operate_type_key";

enum OperateTypeEnum {
  push,
  pop,
  go,
}

class RouterHelper {
  BuildContext context;
  late GoRouter goRouter;
  late GoRouterState goRouterState;
  late OperateTypeEnum? type;
  RouterHelper(this.context) {
    goRouter = GoRouter.of(context);
    goRouterState = goRouter.state;
    final extra = goRouterState.extra;
    if (extra is Map<String, dynamic>) {
      type = extra[operateTypeKey];
    } else {
      type = null;
    }
  }
  static RouterHelper of(BuildContext context) {
    return RouterHelper(context);
  }
  Future<T?> pushNamed<T extends Object>(
    String name,
    {
      Map<String, String> pathParameters = const <String, String>{},
      Map<String, dynamic> queryParameters = const <String, dynamic>{},
      Map<String, dynamic>? extra,
    }
  ) {
    extra = extra ?? {};
    extra[operateTypeKey] = OperateTypeEnum.push;
    return goRouter.pushNamed(
      name,
      pathParameters: pathParameters,
      queryParameters: queryParameters,
      extra: extra,
    );
  }
  void goNamed(
    String name,
    {
      Map<String, String> pathParameters = const <String, String>{},
      Map<String, dynamic> queryParameters = const <String, dynamic>{},
      Map<String, dynamic>? extra,
    }
  ) {
    extra = extra ?? {};
    extra[operateTypeKey] = OperateTypeEnum.go;
    return goRouter.goNamed(
      name,
      pathParameters: pathParameters,
      queryParameters: queryParameters,
      extra: extra,
    );
  }
  void pop(
    Map<String, dynamic>? extra,
  ) {
    extra = extra ?? {};
    extra[operateTypeKey] = OperateTypeEnum.pop;
    return goRouter.pop(extra);
  }
  bool isTypeOf(OperateTypeEnum type) {
    final extra = (goRouterState.extra ?? {}) as Map<String, dynamic>;
    return extra[operateTypeKey] == type;
  }
  bool isPushType() {
    return isTypeOf(OperateTypeEnum.push);
  }
  bool isPopType() {
    return isTypeOf(OperateTypeEnum.pop);
  }
  bool isGoType() {
    return isTypeOf(OperateTypeEnum.go);
  }
}