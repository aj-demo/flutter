/*
 * @Author: apathyjade <apathyjade@outlook.com>
 * @Version: 0.0.1
 * @Date: 2020-01-06 14:55:37
 * @Last Modified by:   apathyjade
 * @Last Modified Time: 2020-01-06 14:55:37
 */

import 'package:flutter/material.dart';

enum TabItem { home, cart, setting }

Map<TabItem, String> tabNames = {
  TabItem.home: '首页',
  TabItem.cart: '购物车',
  TabItem.setting: '设置',
};
Map<TabItem, MaterialColor> tabColors = {
  TabItem.home: Colors.red,
  TabItem.cart: Colors.green,
  TabItem.setting: Colors.blue,
};
Map<TabItem, IconData> tabIcons = {
  TabItem.home: Icons.home,
  TabItem.cart:  Icons.shopping_cart,
  TabItem.setting: Icons.settings,
};
// ignore: must_be_immutable
class AjBottomNavigationBar extends StatelessWidget {

  AjBottomNavigationBar({this.currentTab, this.onSelectTab});
  TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;
  void _onTap (index) {
    onSelectTab(
      TabItem.values[index],
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
    return [
      _buidItem(tabItem: TabItem.home),
      _buidItem(tabItem: TabItem.cart),
      _buidItem(tabItem: TabItem.setting),
    ];
  }
  BottomNavigationBarItem _buidItem({TabItem tabItem}) {
    return BottomNavigationBarItem(
      icon: Icon(
        tabIcons[tabItem],
        color: _getTabColor(tabItem),
      ),
      title: Text(
        tabNames[tabItem],
        style: TextStyle(
          color: _getTabColor(tabItem),
        )
      ),
    );
  }
  Color _getTabColor(tabItem) {
    return tabItem == this.currentTab ? tabColors[tabItem] : Colors.grey;
  }
}