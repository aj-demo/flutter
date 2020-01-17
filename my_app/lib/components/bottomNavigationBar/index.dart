/*
 * @Author: apathyjade <apathyjade@outlook.com>
 * @Version: 0.0.1
 * @Date: 2020-01-06 14:55:37
 * @Last Modified by:   apathyjade
 * @Last Modified Time: 2020-01-06 14:55:37
 */

import 'package:flutter/material.dart';

List<Map> appBottomTabs = const [
  {
    'key': 'home',
    'name': '首页',
    'color': Colors.red,
    'icon': Icons.home
  },
  {
    'key': 'cart',
    'name': '购物车',
    'color': Colors.green,
    'icon': Icons.shopping_cart
  },
  {
    'key': 'setting',
    'name': '设置',
    'color': Colors.blue,
    'icon': Icons.settings
  }
];

// ignore: must_be_immutable
class AjBottomNavigationBar extends StatelessWidget {

  AjBottomNavigationBar({this.currentTab, this.onSelectTab});
  int currentTab;
  final ValueChanged<int> onSelectTab;
  void _onTap (index) {
    onSelectTab(
      index,
    );
  }
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      fixedColor: Colors.black87,
      type: BottomNavigationBarType.fixed,
      iconSize: 24,
      // currentIndex: currentTab,
      onTap: _onTap,
      items: _buildItems(),
    );
  }
  List<BottomNavigationBarItem> _buildItems() {
    List<BottomNavigationBarItem> res = [];
    appBottomTabs.forEach((f) => res.add(_buidItem(f)));
    return res;
  }
  BottomNavigationBarItem _buidItem(tabItem) {
    return BottomNavigationBarItem(
      icon: Icon(
        tabItem['icon'],
        color: _getTabColor(tabItem),
      ),
      title: Text(
        tabItem['name'],
        style: TextStyle(
          color: _getTabColor(tabItem),
        )
      ),
    );
  }
  Color _getTabColor(tabItem) {
    return appBottomTabs.indexOf(tabItem) == this.currentTab ? tabItem['color'] : Colors.grey;
  }
}