
import 'package:flutter/material.dart';
import 'package:flutter_demo/components/PageTransitionsBuilder/index.dart';
import 'package:flutter_demo/providers/global_provider.dart';
// import 'package:flutter_demo/pages/home/special_offer.dart';
import 'package:flutter_demo/utils/my_router.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

// import 'package:flutter_demo/components/appBar/index.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final List<Map<String, dynamic>> tabs = [
  {'title': '特价', 'icon': Icons.home},
  {'title': '首页', 'icon': Icons.search},
  {'title': '秒送', 'icon': Icons.bookmark},
  {'title': '新品', 'icon': Icons.settings},
];

class PageHome extends HookConsumerWidget  {
  const PageHome({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routerState = GoRouterState.of(context);
    final slidWidth = MediaQuery.of(context).size.width * 1;
    // final slidHeight = MediaQuery.of(context).size.height;

    final ctr = useAnimationController(
      duration: Duration(milliseconds: 300),
      reverseDuration: Duration(milliseconds: 300)
    );

    final animation = useAnimation(
      Tween(begin: 0, end: slidWidth).animate(CurvedAnimation(
        parent: ctr,
        curve: Curves.easeIn,
        reverseCurve: Curves.easeOut,
      ))
    );

    final tabCtl = useTabController(initialLength: 4);



    return Scaffold(
      key: routerState.pageKey,
      appBar: AppBar(
        backgroundColor: Colors.red,
        leadingWidth: 0,
        toolbarHeight: 48,
        centerTitle: false,
        leading: Container(),
        title: TabBar(
          padding: EdgeInsets.zero,
          tabAlignment: TabAlignment.start,
          isScrollable: true,
          controller: tabCtl,
          automaticIndicatorColorAdjustment: false,
          dividerHeight: 0,
          labelColor: Colors.white,
          labelStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          unselectedLabelColor: Colors.white70,
          unselectedLabelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          indicatorColor: Colors.white,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorWeight: 2,
          indicatorPadding: EdgeInsetsGeometry.fromLTRB(0, 16, 0, 0),
          overlayColor: null,
          splashBorderRadius: BorderRadius.circular(0),
          tabs: tabs.map((it) {
            return Text(it['title']);
          }).toList(),
        ),
      ),
      backgroundColor: Colors.white,
      // drawer: Drawer(
      //   child: ListView(
      //     padding: EdgeInsets.zero,
      //     children: const <Widget>[
      //       DrawerHeader(
      //         decoration: BoxDecoration(
      //           color: Colors.blue,
      //         ),
      //         child: Text(
      //           'Drawer Header',
      //           style: TextStyle(
      //             color: Colors.white,
      //             fontSize: 24,
      //           ),
      //         ),
      //       ),
      //       ListTile(
      //         leading: Icon(Icons.message),
      //         title: Text('Messages'),
      //       ),
      //       ListTile(
      //         leading: Icon(Icons.account_circle),
      //         title: Text('Profile'),
      //       ),
      //       ListTile(
      //         leading: Icon(Icons.settings),
      //         title: Text('Settings'),
      //         subtitle: Text('subtitle'),
      //         selected: true,
      //         selectedColor: Colors.blue,
      //         focusColor: Colors.blue,
      //         hoverColor: Colors.blueAccent,
      //       ),
      //     ],
      //   ),
      // ),
      body: TabBarView(
        controller: tabCtl,
        children: tabs.map((tabData) {
          return ListView.builder(
            physics: const ClampingScrollPhysics(),
            itemCount: 60,
            itemBuilder: (BuildContext ctx, int index) {
              return Text('${tabData['title']} --- $index');
            },
          );
        }).toList(),
      ),
    );
  }
  void gotoNext(BuildContext context) {
    final rh = RouterHelper.of(context);
    rh.pushNamed("detail", extra: { 'transition_type':  TransitionType.slideFromBottom});
  }
}