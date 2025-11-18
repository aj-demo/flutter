/*
 * @Author: apathyjade <apathyjade@outlook.com>
 * @Version: 0.0.1
 * @Date: 2020-01-03 15:26:09
 * @Last Modified by:   apathyjade
 * @Last Modified Time: 2020-01-03 15:26:09
 */

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AjAppBar extends StatefulWidget implements PreferredSizeWidget {
  const AjAppBar({super.key});

  @override
  State createState() => AjAppBarState();
  @override
  Size get preferredSize => Size.fromHeight(160);
}

class AjAppBarState extends State<AjAppBar> {
  @override
  Widget build(BuildContext context) {
    final routerState = GoRouterState.of(context);
    return AppBar(
      key: routerState.pageKey,
      backgroundColor: Colors.grey[300],
      title: Text(
        '微信',
        style: TextStyle(
          color: Colors.black,
          fontSize: 18.0,
        ),
        textAlign: TextAlign.center,
      ),
      centerTitle: true,
      actions: <Widget> [
        Icon(Icons.add, color: Colors.black54),
        Icon(Icons.macro_off, color: Colors.black54),
      ],
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.grey[300]!,
              Colors.grey[100]!,
            ],
          ),
        ),
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(20),
        child: Container(
          margin: EdgeInsets.fromLTRB(16, 8, 16, 8),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.black12,
              width: 1
            )
          ),
          child: TextField(
            key: routerState.pageKey,
            decoration: InputDecoration(
              hintText: "搜索",
            ),
            style: TextStyle(
              color: Colors.black38
            ),
          )
        )
      )
    );
  }
}