import '../../helper_manager/network_manager/api_constant.dart';
import '../../helper_manager/network_manager/app_interceptors.dart';
import 'package:dio/dio.dart';

Dio initDio() {
  Dio dio = Dio(
    BaseOptions(
      baseUrl: ApiConstant.baseDomain + ApiConstant.prefixVersion,
      connectTimeout: ApiConstant.timeoutDurationNormalAPIs,
      receiveTimeout: ApiConstant.timeoutDurationNormalAPIs,
    ),
  );

  dio.interceptors.add(AppInterceptors());

  return dio;
}
