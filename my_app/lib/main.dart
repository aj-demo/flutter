import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluwx/fluwx.dart' as fluwx;

void main() => runApp(new MyApp());

class ADialog extends StatelessWidget {
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
                Navigator.of(context).pop(1).pop(1);
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
      },
      color: Colors.blueAccent,
      child: Text('ClickButton'),
    );
  }
}

class MyApp extends StatelessWidget {
  _initFluwx() async {
    await fluwx.register(
        appId: "wxd67167d6c21fbe7b",
        doOnAndroid: true,
        doOnIOS: true,
        enableMTA: false);
    var result = await fluwx.isWeChatInstalled();
    print("----- ----- is installed $result");
  }
  onError(e) {
    print("onError: $e");
  }
  @override
  Widget build(BuildContext context) {
    this._initFluwx();

    return new MaterialApp(
      title: 'Welcome to Flutter',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Welcome to Flutter2'),
        ),
        body: new Center(
          child: new Column(
            children: [
              new Text('data5'),
              new IconButton(
              icon: new Icon(Icons.star),
              color: Colors.red[500],
              onPressed: () {

                // "timeStamp": "1562576237",
                // "packageValue": "Sign=WXPay",
                // "appId": "wxd67167d6c21fbe7b",
                // "sign": "DRYGvwejm3wtKuSx71+Igkbzk+O3yfvqEGRkQ8BL8F2j0ph1vRcopRYN06MMw7QDwdbkYl4IaFm9y+XIMjY9QE9qh4Dm/pv7/pij/yGx29NDp89rg6HIzUstvBc8bDxqxTcx7x+5xPKSuAZ3JkBlGRRHFKzpKN+edaEXpR+cVnvhSPcaAXLkw0l9dh3qo/53bHPmG1NjR6FX629j7Csaf2r2hm0Hf1G/oByneHPFZJd02mLSfdsc+h1EPPMSwtsAX0W9wwPKrx6nbixerJgQsZ5zeHhpsrupCeis4I5B4C5TUZgqnf7+s515ybx2P9guI5//xTJbyVfyeWYNgqxmww==",
                // "partnerId": "1372469902",
                // "prepayId": "wx0816571718211054de33d91f1238208700",
                // "nonceStr": "2ffbaM6J5iXLP0p6QGmPmk14WEEiXno2"
                
                fluwx.pay(
                  appId: 'wxd67167d6c21fbe7b', 
                  partnerId: '1372469902',
                  prepayId: 'wx0816571718211054de33d91f1238208700',
                  packageValue: 'Sign=WXPay',
                  nonceStr: '2ffbaM6J5iXLP0p6QGmPmk14WEEiXno2',
                  timeStamp: 1562576237,
                  sign: 'DRYGvwejm3wtKuSx71+Igkbzk+O3yfvqEGRkQ8BL8F2j0ph1vRcopRYN06MMw7QDwdbkYl4IaFm9y+XIMjY9QE9qh4Dm/pv7/pij/yGx29NDp89rg6HIzUstvBc8bDxqxTcx7x+5xPKSuAZ3JkBlGRRHFKzpKN+edaEXpR+cVnvhSPcaAXLkw0l9dh3qo/53bHPmG1NjR6FX629j7Csaf2r2hm0Hf1G/oByneHPFZJd02mLSfdsc+h1EPPMSwtsAX0W9wwPKrx6nbixerJgQsZ5zeHhpsrupCeis4I5B4C5TUZgqnf7+s515ybx2P9guI5//xTJbyVfyeWYNgqxmww==',
                  // signType: '选',
                  // extData: '选填'
                ).then((data) {
                  print("-----------------------------------");
                  print("---》$data");
                  print("-----------------end------------------");
                }).catchError((this.onError));
              },
              )
            ]
          ),
        ),
        floatingActionButton: new ADialog()
      ),
    );
  }
}