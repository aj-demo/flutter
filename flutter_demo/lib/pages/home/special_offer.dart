



import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final List<Map<String, dynamic>> tabs = [
  {'title': '首页', 'icon': Icons.home},
  {'title': '搜索', 'icon': Icons.search},
  {'title': '收藏', 'icon': Icons.bookmark},
  {'title': '设置', 'icon': Icons.settings},
  {'title': '通知', 'icon': Icons.notifications},
  {'title': '用户', 'icon': Icons.person},
];

class SpecialOffer extends HookConsumerWidget {
  const SpecialOffer({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        TabBar(tabs: tabs.map((ele) {
          return Tab(
            icon: Icon(ele['icon']),
            text: ele['title'],
          );
        }).toList())
      ],
    );
  }
}