
import 'package:flutter/material.dart';

class AjDialog extends StatelessWidget {
  // AlertDialog d;
  _showMyMaterialDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('是否确定？'),
          content: Text('删除后无法恢复，请确定？'),
          actions: <Widget>[
            FlatButton(
              child: Text('确定'),
              onPressed: () {
                Navigator.of(context).pop(1);
              },
            ),
            FlatButton(
              child: Text('取消'),
              onPressed: () {

              },
            )
          ],
        );
      }
    );
  }
  Widget build(BuildContext context) {
    return new RaisedButton(
      onPressed: () {
        this. _showMyMaterialDialog(context);
        FocusScope.of(context).requestFocus(FocusNode());
      },
      color: Colors.blueAccent,
      child: Text('ClickButton'),
    );
  }
}