
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
    super.initState();
    login = LoginHelper.isLogin();
  }
  void onPressed() {
    GoRouter gr = GoRouter.of(context);
    LoginHelper.isLogin().then((value) {
      gr.goNamed('home');
      // gr.pop();
      // gr.pushNamed('home');
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: FutureBuilder(future: login, builder: (context, snapshot) {
          return ElevatedButton(onPressed: onPressed, child: Text(snapshot.data != null ? 'ok' : 'err'));
        }),
      ),
    );
  }
}

