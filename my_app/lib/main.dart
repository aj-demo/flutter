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
  TabItem _currentTab = TabItem.home;
  void _selectTab(TabItem tabItem) {
    if (tabItem == _currentTab) {
    } else {
      setState(() => _currentTab = tabItem);
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
        bottomNavigationBar: new AjBottomNavigationBar(
          currentTab: _currentTab,
          onSelectTab: _selectTab,
        ),
      ),
    );
  }
}