

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_app/components/appBar/index.dart';
import 'package:my_app/components/dialog/index.dart';
// import 'package:my_app/components/bottomNavigationBar/index.dart';

// ignore: must_be_immutable
class PageHome extends StatelessWidget {
  // int _currentTab = 0;
  // void _selectTab(int index) {
  //   // setState(() => _currentTab = index);
  // }
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
        drawer: Drawer(
          child: Center(
            child: Text('Drawer'),
          ),
        ),
        // bottomNavigationBar: new AjBottomNavigationBar(
        //   currentTab: _currentTab,
        //   onSelectTab: _selectTab,
        // ),
      ),
    );
  }
}
