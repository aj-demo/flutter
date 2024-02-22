
import 'package:flutter/material.dart';
import '../../helper/login/LoginHelper.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({ super.key });
  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  late Future<bool> login;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    login = LoginHelper().isLogin();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: FutureBuilder(future: login, builder: (context, snapshot) {
          return Text(snapshot.data == true ? 'ok' : 'false');
        }),
      ),
    );
  }
}

