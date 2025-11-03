/*
 * @Author: apathyjade <apathyjade@outlook.com>
 * @Version: 0.0.1
 * @Date: 2020-01-21 10:14:19
 * @Last Modified by:   apathyjade
 * @Last Modified Time: 2020-01-21 10:14:19
 */

import 'package:dio/dio.dart';
// import 'package:dio/adapter.dart';
var baseOptions = BaseOptions(
  baseUrl: "https://www.jianshu.com",
  contentType: Headers.jsonContentType,
  responseType: ResponseType.json,
  headers: {
    "Referer": "https://www.jianshu.com"
  }
);

final dio = Dio();