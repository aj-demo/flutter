

import 'package:flutter/material.dart';
// import 'package:flutter_demo/utils/my_router.dart';
import 'package:go_router/go_router.dart';
import '../components/bottomNavigationBar/index.dart';

class BaseLayout extends StatelessWidget {
  const BaseLayout({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        
        onHorizontalDragStart: (details) {
          print(details.toStringShort());
        },
        child: navigationShell,
      ),
      bottomNavigationBar: AjBottomNavigationBar(
        currentIndex: navigationShell.currentIndex,
        onSelectTab: (int index) {
          if (index != navigationShell.currentIndex) {
            navigationShell.goBranch(index);
          }
        },
      ),
    );
  }
}