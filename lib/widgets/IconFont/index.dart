
import 'package:flutter/material.dart';

class IconFont extends StatelessWidget {

    final String data;
    final double? fontSize;
    final Color? color;
    final double? height;

    const IconFont(this.data, {
      super.key,
      this.fontSize,
      this.color,
      this.height,
    });

    @override
    Widget build(BuildContext context)  {
      return Text(
          data,
          style: TextStyle(
            color: color,
            fontSize: fontSize,
            height: height,
            fontFamily: 'IconFont',
          ),
      );
    }
    static const String home = '\uE7d5';
    static const String homeFill = '\uE7da';
}
