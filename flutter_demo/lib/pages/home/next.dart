

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_demo/model/PageTransitionsBuilder/index.dart';
// import 'package:flutter_demo/model/PageTransitionsBuilder/index.dart';
import 'package:flutter_demo/utils/my_router.dart';
// import 'package:go_router/go_router.dart';

class PageHomeNext extends StatelessWidget {
  const PageHomeNext({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child:IconButton(
            onPressed: () => gotoNext(context),
            icon: Icon(CupertinoIcons.back)
          ),
        ),
      ),
    );
  }
  void gotoNext (BuildContext context) {
    final rh = RouterHelper.of(context);
    rh.goNamed('home');
    rh.pop({ 'transition_type': TransitionType.slide });
  }
}
