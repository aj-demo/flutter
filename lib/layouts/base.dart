
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BaseLayout extends StatefulWidget {
  const BaseLayout({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  State<BaseLayout> createState() => _MyHomePageState();
}

typedef Menu = ({
  String key,
  String label,
  Icon icon,
});

class _MyHomePageState extends State<BaseLayout> {

  final List<Menu> _menus = const [
    (label: '首页', key: 'home', icon: Icon(Icons.access_alarm)),
    (label: '推荐', key: 'recommend', icon: Icon(Icons.abc_sharp)),
    (label: '联系人', key: 'contact', icon: Icon(Icons.abc)),
    (label: '个人中心', key: 'center', icon: Icon(Icons.access_time))
  ];

  void _onTap(index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: widget.navigationShell.currentIndex,
        onTap: _onTap,
        showUnselectedLabels: true,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.blueGrey,
        items: _menus.map((menu) =>
            BottomNavigationBarItem(
              label: menu.label,
              icon: menu.icon,
            ),
        ).toList(),
      )
    );
  }
}
