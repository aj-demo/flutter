

import 'package:flutter/material.dart';
import 'package:flutter_demo/components/PageTransitionsBuilder/index.dart';
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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Messages'),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              subtitle: Text('subtitle'),
              selected: true,
              selectedColor: Colors.blue,
              focusColor: Colors.blue,
              hoverColor: Colors.blueAccent,
            ),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          Text('homePage'),
          IconButton(
            onPressed: () => gotoNext(context),
            icon: Icon(Icons.warning)
          ),
          IconButton(
            onPressed: () => context.pushNamed('login'),
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