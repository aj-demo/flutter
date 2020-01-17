

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PageSetting extends StatelessWidget {
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
          child: Text('settingPage'),
        ),
      ),
    );
  }
}
