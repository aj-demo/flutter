
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'NavigationBar.dart';

class BaseLayout extends StatelessWidget {
  BaseLayout({super.key, required this.navigationShell, required this.children});
  final StatefulNavigationShell navigationShell;
  final List<Widget> children;
  final PageController pageController = PageController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView.builder(
        controller: pageController,
        physics: PageScrollPhysics(),
        scrollBehavior: const MaterialScrollBehavior(),
        pageSnapping: true,
        onPageChanged:(index) {
          navigationShell.goBranch(index);
        },
        itemCount: children.length,
        itemBuilder: (context, index) {
          return children[index];
        }
      ),
      bottomNavigationBar: AjBottomNavigationBar(
        currentIndex: navigationShell.currentIndex,
        onTap: (int index) {
          if (index != navigationShell.currentIndex) {
            pageController.jumpToPage(index);
            navigationShell.goBranch(index);
          }
        },
      ),
    );
  }
}