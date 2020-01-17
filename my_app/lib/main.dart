import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_app/components/appBar/index.dart';
import 'package:my_app/components/dialog/index.dart';
import 'package:my_app/components/bottomNavigationBar/index.dart';

import './pages/home/index.dart';
import './pages/setting/setting.dart';
import './pages/cart/cart.dart';

// void main() => runApp(new PageHome());
void main() => runApp(new App());

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AppState();
}

List<Widget> pages = [
  new PageHome(),
  new PageCart(),
  new PageSetting()
];

class AppState extends State<App> {
  int _pageIndex = 0;
  void _changePage(int index) {
    if (index == _pageIndex) {
    } else {
      setState(() => _pageIndex = index);
    }
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
        body: IndexedStack(
          index: _pageIndex,
          children: pages,
        ),
        floatingActionButton: new AjDialog(),
        drawer: Drawer(
          child: Center(
            child: Text('Drawer'),
          ),
        ),
        bottomNavigationBar: new AjBottomNavigationBar(
          currentTab: _pageIndex,
          onSelectTab: _changePage,
        ),
      ),
    );
  }
}
