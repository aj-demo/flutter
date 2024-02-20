
import 'package:flutter/material.dart';

class IconFont extends StatelessWidget {

  final String data;
  TextStyle style;
  IconFont(this.data, {
    super.key,
    this.style = const TextStyle(),
  });

  @override
  Widget build(BuildContext context)  {
    return Text(
        data,
        style: const TextStyle(fontFamily: 'IconFont'),
    );
  }
}
