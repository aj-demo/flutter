/*
 * @Author: apathyjade <apathyjade@outlook.com>
 * @Version: 0.0.1
 * @Date: 2020-01-03 15:26:09
 * @Last Modified by:   apathyjade
 * @Last Modified Time: 2020-01-03 15:26:09
 */

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AjAppBar extends StatefulWidget implements PreferredSizeWidget {
  @override
  _State createState() => _State();
  @override
  Size get preferredSize => Size.fromHeight(160);
}

class _State extends State<AjAppBar> {
  @override
  Widget build(BuildContext context) {
    return new AppBar(
      backgroundColor: Colors.grey[300],
      title: new Text(
        '微信',
        style: TextStyle(
          color: Colors.black,
          fontSize: 18.0,
        ),
        textAlign: TextAlign.center,
      ),
      actions: <Widget> [
        
      ],
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(20),
        child: new Container(
          margin: new EdgeInsets.fromLTRB(20, 20, 20, 20),
          decoration: BoxDecoration(
            color: Colors.white,
            
            border: Border.all(
              color: Colors.grey[200],
              width: 1
            )
          ),
          child: TextField(
            decoration: InputDecoration(
              hintText: '请输入搜索条件',
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