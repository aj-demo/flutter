

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_demo/model/PageTransitionsBuilder/index.dart';
import 'package:flutter_demo/utils/my_router.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_demo/components/appBar/index.dart';

class PageHome extends StatefulWidget {
  const PageHome({super.key});

  @override
  State<StatefulWidget> createState() => PageHomeState();
}
class PageHomeState extends State with AutomaticKeepAliveClientMixin  {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    final routerState = GoRouterState.of(context);
    super.build(context);
    return Scaffold(
      key: routerState.pageKey,
      appBar: const AjAppBar(),
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Text('homePage'),
          IconButton(
            onPressed: () => gotoNext(context),
            icon: Icon(Icons.warning)
          ),
        ]
      )
    );
  }
  void gotoNext(BuildContext context) {
    final rh = RouterHelper.of(context);
    rh.pushNamed("detail", extra: { 'transition_type':  TransitionType.slideFromBottom});
  }
}