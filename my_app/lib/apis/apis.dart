/*
 * @Author: apathyjade <apathyjade@outlook.com>
 * @Version: 0.0.1
 * @Date: 2020-01-21 16:14:12
 * @Last Modified by:   apathyjade
 * @Last Modified Time: 2020-01-21 16:14:12
 */

import '../utils/fetch.dart';

Fetch fetch = new Fetch();

Future getLogininfo ({
  params, cancelToken, onReceiveProgress
}) async {
  return fetch.post(
    "https://www.jianshu.com/shakespeare/notes/45938563/included_collections?page=1&count=7", 
    params: params,
    cancelToken: cancelToken,
    onReceiveProgress: onReceiveProgress
  );
}

Future getBaidu ({
  params, cancelToken, onReceiveProgress
}) async {
  return fetch.get(
    "https://www.baidu.com", 
    params: params,
    cancelToken: cancelToken,
    onReceiveProgress: onReceiveProgress
  );
}