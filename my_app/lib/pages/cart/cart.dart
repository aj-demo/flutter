

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PageCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Welcome to Flutter',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Scaffold(
        backgroundColor: Colors.white,
        body: new Center(
          child: Text('cartPage'),
        ),
      ),
    );
  }
}
