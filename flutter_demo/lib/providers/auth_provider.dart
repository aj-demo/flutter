
import 'package:flutter/material.dart';
import 'package:flutter_demo/apis/apis.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:flutter_demo/models/user.dart';
// import 'package:flutter_login/services/api_service.dart';
enum AuthStatus {
  initial,
  loading,
  authenticated,
  unauthenticated,
  error
}
final tokenKey = 'auth_token';
final refreshTokenKey = 'auth_refresh_token';

class AuthProvider with ChangeNotifier {
  // 使用 flutter_secure_storage 实例
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  // 用户信息
  User? _user;
  String? _token;
  String? _refreshToken;
  AuthStatus _authStatus = AuthStatus.initial;
  String _errorMessage = '';

  // Getters
  User? get user => _user;
  String? get token => _token;
  String? get refreshToken => _refreshToken;
  AuthStatus get authStatus => _authStatus;
  String get errorMessage => _errorMessage;


  bool get isAuthenticated => _authStatus == AuthStatus.authenticated;

  void _reset() {
    _user = null;
    _token = null;
    _refreshToken = null;
    _authStatus = AuthStatus.unauthenticated;
    _errorMessage = '';
  }

  // 构造函数
  AuthProvider() {
    // App 启动时，检查本地是否有 token
    _checkForExistingToken();
  }

  // --- 核心方法 ---

  // 1. 检查本地 Token
  Future<void> _checkForExistingToken() async {
    final token = await secureStorage.read(key: tokenKey);
    if (token != null) {
      // 假设 token 有效，可以设置用户信息（这里为了简化，只设置状态）
      // 实际项目中，你可能需要用 token 获取最新的用户信息
      _user = User(id: '0', displayName: 'Cached User', avatar: '', email: '');
      _authStatus = AuthStatus.authenticated;
    } else {
      _authStatus = AuthStatus.unauthenticated;
    }
    notifyListeners();
  }

  // 2. 登录方法
  Future<void> login(String account, String password) async {
    _authStatus = AuthStatus.loading;
    _errorMessage = '';
    notifyListeners();
    final res = (await fetchLogin(data: {account: account, password: password})).data;
    final data = res['data'];
    await secureStorage.write(key: tokenKey, value: data['token']);
    await secureStorage.write(key: refreshTokenKey, value: data['refreshToken']);
    _user = User.fromJson(data);
    _token = data['token'];
    _refreshToken = data['refreshToken'];
    _authStatus = AuthStatus.authenticated;
    notifyListeners();

    // try {
    //   final loggedInUser = await ApiService.login(email, password);

    //   // 3. 存储 Token
    //   await _secureStorage.write(key: _accessTokenKey, value: loggedInUser.token);

    //   _user = loggedInUser;
    //   _authStatus = AuthStatus.authenticated;
    //   notifyListeners();
    // } catch (e) {
    //   _authStatus = AuthStatus.error;
    //   _errorMessage = e.toString().replaceAll('Exception: ', '');
    //   notifyListeners();
    // }
  }

  // 4. 登出方法
  Future<void> logout() async {
    // 清除本地存储的 Token
    await secureStorage.delete(key: tokenKey);
    // 重置本地状态
    _reset();
    notifyListeners();
  }
}
