
import 'package:flutter/material.dart';

class AjDialog extends StatelessWidget {
  const AjDialog({super.key});

  // AlertDialog d;
  _showMyMaterialDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('是否确定？'),
          content: Text('删除后无法恢复，请确定？'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('取消'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('确定'),
            ),
          ],
        );
      }
    );
  }
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        _showMyMaterialDialog(context);
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Text('ClickButton'),
    );
  }
}