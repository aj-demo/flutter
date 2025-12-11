

import 'package:flutter/material.dart';
import 'package:flutter_demo/components/upstairs/index.dart';
import 'package:flutter_demo/providers/global_provider.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BaseLayout extends HookConsumerWidget {
  const BaseLayout({super.key, required this.navigationShell, required this.children});
  final StatefulNavigationShell navigationShell;
  final List<Widget> children;
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageController = usePageController();
    final selectTab = useCallback((int index) {
      if (
        index != navigationShell.currentIndex
        && index >= 0
        && index < appTabs.length
      ) {
        pageController.jumpToPage(index);
      }
    }, [pageController, navigationShell]);

    final brancheIndex = ref.watch(globalProvider.select((global) => global.brancheIndex));
    // useEffect(() {
    //   ref.read(globalProvider.notifier).changeBranche(navigationShell.currentIndex);
    //   return () => {};
    // }, [navigationShell.currentIndex]);

    useEffect(() {
      navigationShell.goBranch(brancheIndex);
      return () => {};
    }, [brancheIndex]);

    return Upstairs(child: Scaffold(
      backgroundColor: Colors.white,
      body: PageView.builder(
        controller: pageController,
        physics: NeverScrollableScrollPhysics(), // ClampingScrollPhysics(),
        onPageChanged:(index) {
          ref.read(globalProvider.notifier).changeBranche(index);
        },
        itemCount: children.length,
        // 构建每个页面
        itemBuilder: (context, index) {
          return children[index];
        }
      ),
      bottomNavigationBar: BaseBottomNavigationBar(
        currentIndex: brancheIndex,
        onSelectTab: selectTab,
      ),
    ));
  }
}

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

final List<Map> appTabs = const [
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
class BaseBottomNavigationBar extends StatelessWidget {
  const BaseBottomNavigationBar({super.key, required this.currentIndex, required this.onSelectTab});
  final int currentIndex;
  final ValueChanged<int> onSelectTab;
  @override
  Widget build(BuildContext context) {
    final current = appTabs[currentIndex]; 
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      iconSize: 24,
      currentIndex: currentIndex,
      unselectedItemColor: Colors.grey,
      selectedItemColor: current['color'],
      unselectedFontSize: 12,
      selectedFontSize: 12,
      onTap: onSelectTab,
      items: _buildItems(),
    );
  }
  List<BottomNavigationBarItem> _buildItems() {
    return appTabs.map(_buidItem).toList();
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