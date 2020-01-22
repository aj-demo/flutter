

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import './next.dart';
import '../../apis/apis.dart';

class PageHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PageHomeState();
}
class PageHomeState extends State with AutomaticKeepAliveClientMixin  {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return new MaterialApp(
      title: 'Welcome to Flutter',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: new Column(
            children: <Widget>[
              Text('homePage'),
              IconButton(
                onPressed: () => gotoNext(context),
                icon: Icon(Icons.warning)
              ),
              Tee()
            ]
          ),
        ),
      ),
    );
  }
  void gotoNext (BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return PageHomeNext();
    }));
  }
}

class Tee extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TeeState();
}
class  TeeState extends State with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  int i = 0;
  void cI () {
    setState(() => i = i + 1);
  }
  initState() {
    super.initState();
    getLogininfo().then((data) {
      print(data);
    });
  }
  @override
  Widget build(BuildContext context) {
    super.build(context);
    // print(this == context);
    return Column(
      children: <Widget>[
        Text(
          'id' + i.toString()
        ),
        IconButton(
          onPressed: cI,
          icon: Icon(Icons.warning)
        ),
        // Container(
        //   width: 1000,
        //   height: 2000,
        //   child: FutureBuilder<dynamic>(
        //     future: getLogininfo,
        //     builder: (BuildContext context, AsyncSnapshot snapshot) {
        //       return Text(
        //         'ididididididididididididid'
        //       );
        //     }
        //   )
        // )
      ],
    );
  }
}