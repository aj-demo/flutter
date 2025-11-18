import 'package:flutter/material.dart';
import 'package:flutter_demo/providers/auth_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('登陆'),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              GoRouter.of(context).goNamed('home');
            },
          ),
        ],
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            if (GoRouter.of(context).canPop()) {
              GoRouter.of(context).pop();
            } else {
              GoRouter.of(context).goNamed('home');
            }
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 邮箱输入框
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: '邮箱或手机号',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || !value.contains('@')) {
                    return '请输入有效的邮箱地址';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              
              // 密码输入框
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: '密码',
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(_obscurePassword ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                ),
                obscureText: _obscurePassword,
                validator: (value) {
                  if (value == null || value.length < 6) {
                    return 'Password must be at least 6 characters long';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // 登录按钮
              SizedBox(
                width: double.infinity,
                height: 36,
                child: ElevatedButton(
                  onPressed: authProvider.authStatus == AuthStatus.loading
                    ? null // 请求中，按钮禁用
                    : () async {
                        if (_formKey.currentState!.validate()) {
                          // 调用 Provider 的登录方法
                          await authProvider.login(
                            _emailController.text.trim(),
                            _passwordController.text,
                          );
                          // 登录成功后的处理
                          if (authProvider.isAuthenticated) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Login Successful!')),
                            );
                            GoRouter.of(context).goNamed('home');
                          }
                        }
                      },
                  child: authProvider.authStatus == AuthStatus.loading
                    ? const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 10),
                          Text('登陆中...'),
                        ],
                      )
                    : const Text('登陆'),
                ),
              ),
              const SizedBox(height: 16),

              // 显示错误信息
              if (authProvider.authStatus == AuthStatus.error)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    authProvider.errorMessage,
                    style: const TextStyle(color: Colors.red, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
