

import 'package:flutter/material.dart';
import 'package:flutter_demo/utils/my_router.dart';
import 'package:go_router/go_router.dart';

class PageCart extends StatelessWidget {
  const PageCart({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Text('cartPage'),
            IconButton(
              onPressed: () => gotoNext(context),
              icon: Icon(Icons.warning)
            ),
          ],
          
        ),
      ),
    );
  }
  void gotoNext (BuildContext context) {
    // final rh = RouterHelper.of(context);
    // rh.pushNamed("detail");
    context.pushNamed("detail");
  }
}
