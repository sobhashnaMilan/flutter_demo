import 'dart:async';

import '../../singleton/user_data_singleton.dart';
import 'package:dio/dio.dart';

class AppInterceptors extends Interceptor {
  @override
  FutureOr<dynamic> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (userDataSingleton.accessToken.isNotEmpty) {
      options.headers.addAll(
        {"Authorization": userDataSingleton.accessToken},
      );
      handler.next(options);
      return options;
    } else {
      handler.next(options);
    }
  }

  @override
  FutureOr<dynamic> onResponse(
      Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
    return response;

    /// TODO -: handle response according to requirements
  }

  @override
  FutureOr<dynamic> onError(DioError err, ErrorInterceptorHandler handler) {
    return err;

    /// TODO -: handle errors according to requirements
  }
}
