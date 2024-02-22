
import 'package:flutter/material.dart';
import '../../helper/icons/CustomIcons.dart';

class CustomBottomBarItem extends StatelessWidget {
    const CustomBottomBarItem({
        super.key,
        required this.label,
        required this.icon,
        required this.color,
        required this.onTap,
    });
    final String label;
    final IconData icon;
    final Color color;
    final void Function() onTap;
    @override
    Widget build(BuildContext context) {
      return InkWell(
          onTap: onTap,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  Icon(icon, color: color),
                  Text(
                      label,
                      style: TextStyle(
                          color: color,
                          fontSize: 12,
                          height: 1.5
                      )
                  ),
              ],
          ),
      );
    }
}
typedef Menu = ({
  String key,
  String label,
  IconData icon,
  IconData activeIcon,
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
    ( label: '首页', key: 'home', icon: CustomIcons.home, activeIcon: CustomIcons.home_fill ),
    ( label: '推荐', key: 'recommend', icon: CustomIcons.news, activeIcon: CustomIcons.news_fill ),
    ( label: '联系人', key: 'contact', icon: CustomIcons.group, activeIcon: CustomIcons.group_fill ),
    ( label: '个人中心', key: 'center', icon: CustomIcons.my, activeIcon: CustomIcons.my_fill )
  ];

  List<Widget> getList() {
    return List.generate(menus.length, (index) => CustomBottomBarItem(
        label: menus[index].label,
        icon:  value == index ? menus[index].activeIcon : menus[index].icon,
        color: value == index ? Colors.blue : Colors.black26,
        onTap: () => onChange(index),
    ));
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mq = MediaQuery.of(context);
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.black12,
            width: 1,
          )
        ),
        color: Colors.white54,
      ),
      height: 54 + mq.padding.bottom,
      child: SizedBox(
        height: 54,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: getList(),
        ),
      )
    );
  }
}
