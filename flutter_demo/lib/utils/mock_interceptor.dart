import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart' show rootBundle;
// import 'package:flutter_demo/utils/env.dart';

class MockInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // 获取完整的请求 URL
    final url = options.uri.toString();

    // final baseApi = apiBaseUrl;
    final mockDir = "lib/assets/mock";


      // 读取本地 mock 数据
    final mockData = await rootBundle.loadString('$mockDir$url.json');
    final jsonData = json.decode(mockData);

    // 直接构造一个 Response 对象返回，不再发起网络请求
    // options.uri 是请求的URL
    // statusCode 是状态码
    // data 是响应体数据
    handler.resolve(
      Response(
        data: jsonData,
        statusCode: 200,
        requestOptions: options,
      ),
    );
  }
}
