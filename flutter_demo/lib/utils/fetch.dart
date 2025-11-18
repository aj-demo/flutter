/*
 * @Author: apathyjade <apathyjade@outlook.com>
 * @Version: 0.0.1
 * @Date: 2020-01-21 10:14:19
 * @Last Modified by:   apathyjade
 * @Last Modified Time: 2020-01-21 10:14:19
 */

import 'package:dio/dio.dart';
import './mock_interceptor.dart';
import './env.dart';

final mockValue = const String.fromEnvironment("MOCK_ENABLED");

final baseOptions = BaseOptions(
  baseUrl: apiBaseUrl,
  contentType: Headers.jsonContentType,
  responseType: ResponseType.json,
  headers: {},
  connectTimeout: Duration(seconds: 5),
  receiveTimeout: Duration(seconds: 10),
);
Dio initDio() {
  final dio = Dio();
  final mockInterceptor = MockInterceptor();
  if (mockEnabled.toLowerCase() == 'true') {
    dio.interceptors.add(mockInterceptor);
  }
  return dio;
}
final dio =initDio();


