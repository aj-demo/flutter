/*
 * @Author: apathyjade <apathyjade@outlook.com>
 * @Version: 0.0.1
 * @Date: 2020-01-21 16:14:12
 * @Last Modified by:   apathyjade
 * @Last Modified Time: 2020-01-21 16:14:12
 */

// import 'package:flutter_demo/models/res_api.dart';
import 'package:flutter_demo/utils/fetch.dart';

Future fetchLogin ({
  data, cancelToken, onReceiveProgress
}) async {
  return dio.post(
    "/account/login", 
    data: data,
    cancelToken: cancelToken,
    onReceiveProgress: onReceiveProgress
  );
}
