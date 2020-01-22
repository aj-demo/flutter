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

class Fetch {
  Dio dio;
  Fetch () {
    dio = new Dio(baseOptions);
    // (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client) {
    //     // config the http client
    //     client.findProxy = (uri) {
    //         //proxy all request to localhost:8888
    //         return "PROXY 192.168.130.91:8888";
    //     };
    // };
  }
  Future get(String url, {Map<String, dynamic> params, Options opts, CancelToken cancelToken, Function onReceiveProgress}) async {
    return dio.get(
      url, 
      queryParameters: params,
      options: opts,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress
    );
  }
  Future post(String url, {Map<String, dynamic> params, Options opts, CancelToken cancelToken, Function onReceiveProgress}) async {
    return dio.post(
      url,
      queryParameters: params,
      options: opts,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress
    );
  }
}