import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_app/components/appBar/index.dart';
import 'package:my_app/components/dialog/index.dart';
import 'package:my_app/components/bottomNavigationBar/index.dart';
// import './pages/home/index.dart';

// void main() => runApp(new PageHome());
void main() => runApp(new App());

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AppState();
}

class AppState extends State<App> {
  int _currentTab = 0;
  void _selectTab(int tabItem) {
    if (tabItem == _currentTab) {
    } else {
      setState(() => _currentTab = tabItem);
    }
  }
  ///主体内容
  Widget _body() => PageView.builder(
    // onPageChanged: _onPageChanged,
    // controller: _pageController,
    itemBuilder: (BuildContext context, int index) {
      return pages[_currentTab];
    },
    itemCount: 3,
  );
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
        body: _body(),
        floatingActionButton: new AjDialog(),
        drawer: Drawer(
          child: Center(
            child: Text('Drawer'),
          ),
        ),
        bottomNavigationBar: new AjBottomNavigationBar(
          currentTab: _currentTab,
          onSelectTab: _selectTab,
        ),
      ),
    );
  }
}
List pages = [
  new PageView(
    children: <Widget> [
      Text('首页')
    ]
  ),
  new PageView(
    children: <Widget> [
      Text('购物车')
    ]
  ),
  new PageView(
    children: <Widget> [
      Text('设置')
    ]
  )
];
