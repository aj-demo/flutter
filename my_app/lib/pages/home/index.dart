

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_app/components/appBar/index.dart';
import 'package:my_app/components/dialog/index.dart';
import 'package:my_app/components/bottomNavigationBar/index.js';

class PageHome extends StatelessWidget {
  int _tabIndex = 1;
  _onPageChange(int index) {
    // setState(() {
    //   _tabIndex = index;
    // });
  }
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Welcome to Flutter',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Scaffold(
        backgroundColor: Colors.white,
        appBar: new AjAppBar(),
        body: new Center(
          child: new Column(
            children: [
              
            ]
          ),
        ),
        floatingActionButton: new AjDialog(),
        bottomNavigationBar: new AjBottomNavigationBar(),
      ),
    );
  }
}
