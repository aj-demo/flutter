
import 'package:flutter/material.dart';
import '../../widgets/IconFont/index.dart';

class CustomBottomBarItem extends StatelessWidget {
  const CustomBottomBarItem({
    super.key,
    required this.label,
    required this.icon,
    required this.onTap,
  });
  final String label;
  final Icon icon;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Center(
        child: Column(
          children: [
            const IconFont("\uE74c"),
            Text(
                label,
                style: const TextStyle(
                  fontSize: 12,
                )
            ),
          ],
        ),
      ),
    );
  }
}
typedef Menu = ({
  String key,
  String label,
  Icon icon,
});
class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({
    super.key,
    required this.value,
    required this.onChange
  });
  final int value;
  final void Function(int) onChange;

  final List<Menu> menus = const [
    (label: '首页', key: 'home', icon: Icon(Icons.access_alarm)),
    (label: '推荐', key: 'recommend', icon: Icon(Icons.abc_sharp)),
    (label: '联系人', key: 'contact', icon: Icon(Icons.abc)),
    (label: '个人中心', key: 'center', icon: Icon(Icons.access_time))
  ];

  List<Widget> getList() {
    return menus
      .asMap()
      .entries
      .map((entry) => CustomBottomBarItem(
          label: entry.value.label,
          icon: entry.value.icon,
          onTap: () => onChange(entry.key),
      ))
      .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.redAccent,
      ),
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: getList(),
      ),
    );
  }
}
