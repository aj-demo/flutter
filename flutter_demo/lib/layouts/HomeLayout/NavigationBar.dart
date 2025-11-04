/*
 * @Author: apathyjade <apathyjade@outlook.com>
 * @Version: 0.0.1
 * @Date: 2020-01-06 14:55:37
 * @Last Modified by:   apathyjade
 * @Last Modified Time: 2020-01-06 14:55:37
 */

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class TabItem {
  const TabItem({
    required this.key,
    required this.name,
    required this.color,
    required this.icon
  });
  final String key;
  final String name;
  final Color color;
  final IconData icon;
}

List<Map> appBottomTabs = const [
  {
    'key': 'home',
    'name': '首页',
    'color': Colors.red,
    'icon': CupertinoIcons.home
  },
  {
    'key': 'cart',
    'name': '购物车',
    'color': Colors.green,
    'icon': CupertinoIcons.shopping_cart
  },
  {
    'key': 'setting',
    'name': '设置',
    'color': Colors.blue,
    'icon': CupertinoIcons.settings
  }
];

// ignore: must_be_immutable
class AjBottomNavigationBar extends StatelessWidget {
  AjBottomNavigationBar({super.key, required this.currentIndex, required this.onTap});
  int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    final current = appBottomTabs[currentIndex]; 
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      iconSize: 24,
      currentIndex: currentIndex,
      unselectedItemColor: Colors.grey,
      selectedItemColor: current['color'],
      unselectedFontSize: 12,
      selectedFontSize: 12,
      onTap: onTap,
      items: _buildItems(),
    );
  }
  List<BottomNavigationBarItem> _buildItems() {
    return appBottomTabs.map(_buidItem).toList();
  }
  BottomNavigationBarItem _buidItem(tabItem) {
    return BottomNavigationBarItem(
      key: Key(tabItem['key']),
      icon: Icon(
        tabItem['icon']
      ),
      label: tabItem['name'],
    );
  }
}