
import 'package:flutter/material.dart';

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PageCenter extends StatefulWidget {
  const PageCenter({super.key, required this.title, this.color = Colors.black});

  final String title;
  final Color color;

  @override
  State<PageCenter> createState() => PageCenterState();
}

class PageCenterState extends State<PageCenter> {
  String _batteryLevel = '';
  static const platform = MethodChannel('jade.flutter.dev/battery');

  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final result = await platform.invokeMethod<int>('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: widget.color),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: _getBatteryLevel,
              child: const Text('Get Battery Level'),
            ),
            Text(_batteryLevel),
          ],
        ),
      ),
    );
  }
}
