import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:fluwx/fluwx.dart' as fluwx;
void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  _initFluwx() async {
    // await fluwx.register(
    //     appId: "wxd930ea5d5a258f4f",
    //     doOnAndroid: true,
    //     doOnIOS: true,
    //     enableMTA: false);
    var result = await fluwx.isWeChatInstalled();
    print("is installed $result");
  }
  @override
  Widget build(BuildContext context) {
    this._initFluwx();
    // fluwx.register(appId:"wxd930ea5d5a258f4f");r
    // fluwx.pay(WeChatPayModel(
    //   appId: 'wxd930ea5d5a258f4f', 
    //   partnerId: '1900000109',
    //   prepayId: '1101000000140415649af9fc314aa427',
    //   packageValue: 'Sign=WXPay',
    //   nonceStr: '1101000000140429eb40476f8896f4c9',
    //   timeStamp: '1398746574',
    //   sign: '7FFECB600D7157C5AA49810D2D8F28BC2811827B',
    //   signType: '选填',
    //   extData: '选填'
    // ));

    return Scaffold(
      backgroundColor: Color(0xff333333),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: new WebView(
        initialUrl: 'https://www.baidu.com/', // 加载的url
        // onWebViewCreated: (WebViewController web) {
        //   // webview 创建调用，
          
        // },
        // onPageFinished: (String value) {
        //   // webview 页面加载调用
        // },
      ),
    );
  }
}