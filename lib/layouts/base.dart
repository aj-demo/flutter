
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BaseLayout extends StatefulWidget {
  const BaseLayout({super.key, required this.child});

  final Widget child;

  @override
  State<BaseLayout> createState() => _MyHomePageState();
}

typedef Menu = ({
  String key,
  String label,
  Icon icon,
});

class _MyHomePageState extends State<BaseLayout> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  final List<Menu> _menus = const [
    (label: '首页', key: 'home', icon: Icon(Icons.confirmation_num_sharp)),
    (label: '推荐', key: 'recommend', icon: Icon(Icons.confirmation_num_sharp)),
    (label: '联系人', key: 'contact', icon: Icon(Icons.confirmation_num_sharp)),
    (label: '个人中心', key: 'center', icon: Icon(Icons.confirmation_num_sharp))
  ];

  void _onTap(int index) {
    Menu menu = _menus[index];
    context.goNamed(menu.key);
  }
  @override
  Widget build(BuildContext context) {

    var data = GoRouterState.of(context);
    int index = _menus.indexWhere((element) => element.key == data.topRoute?.name);
    // if (index == -1) {
    //   _onTap(0);
    // }
    return Scaffold(
      body: Center(
        child: Container(
          decoration: const BoxDecoration(color: Colors.blue),
          child: widget.child,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
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
