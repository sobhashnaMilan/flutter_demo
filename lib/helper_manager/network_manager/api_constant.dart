import 'dart:io';

import '../../singleton/user_data_singleton.dart';
import '../../util/app_logger.dart';
import 'package:tuple/tuple.dart';

enum ApiType {
  login,
  userList,
  addUser,
  createRoom,
  fileUpload,
  none,
}

enum MethodType {
  get,
  post,
  put,
  delete,
}

class ApiConstant {
  //change when live url
  static bool get isLiveURl => true;

  static String get googlePlacesKey => '';

  static String get googlePlaceDetail =>
      'https://maps.googleapis.com/maps/api/place/details/json';

  static String get supportEmail => "support@ezsection.com";

  static const int statusCodeSuccess = 200;
  static const int statusCodeCreated = 201;
  static const int statusCodeNotFound = 404;
  static const int statusCodeServiceNotAvailable = 503;
  static const int statusCodeBadGateway = 502;
  static const int statusCodeServerError = 500;

  static const int timeoutDurationNormalAPIs = 30000;

  /// 30 seconds
  static const int timeoutDurationMultipartAPIs = 120000;

  /// 120 seconds

  ///default Location
  static String mapStyle = "assets/map_style.txt";
  static String privacypolicy = "assets/privacypolicy.txt";
  static String termscondition = "assets/termscondition.txt";
  static double staticLatitude = 33.78151350894746;
  static double staticLongitude = -84.41362900386731;

  // static String get baseDomain => 'http://202.131.117.92:7147/'; // Agile Local
  // static String get baseDomain => 'https://dev-api.ezsection.com/'; // Client Staging
  // static String get baseDomain => 'https://api.ezsection.com/'; // Client Live
  static String get baseDomain => 'http://202.131.117.92:7100/'; // Client Live
  static String get baseDomainSocket => 'http://202.131.117.92:7100/';
  static String get baseUrl => "https://gorest.co.in/";
  static String get baseUrlNew => "https://reqres.in/";

  static String get prefixVersion => "v6/";

  static String get prefixVersionN => "public/v2/";

  static String get prefixAuth => "auth";

  static String get prefixApi => "api/";

  static String getValue(ApiType type) {
    switch (type) {
      case ApiType.login:
        return '$prefixAuth/login';
      case ApiType.createRoom:
        return '$prefixAuth/createRoom';
      case ApiType.fileUpload:
        return '$prefixAuth/fileUpload';
      case ApiType.userList:
        return 'users';
      case ApiType.addUser:
        return 'users';
      default:
        return "";
    }
  }

  /*
  * Tuple Sequence
  * - Url
  * - Header
  * - params
  * - files
  * */
  static Tuple4<String, Map<String, String>, Map<String, dynamic>,
          List<AppMultiPartFile>>
      requestParamsForSync(ApiType type,
          {Map<String, dynamic>? params,
          List<AppMultiPartFile> arrFile = const [],
          String? urlParams}) {
    String apiUrl = ApiConstant.baseDomain +
        ApiConstant.prefixVersion +
        ApiConstant.getValue(type);

    if (urlParams != null) apiUrl = apiUrl + urlParams;

    Map<String, dynamic> paramsFinal = params ?? <String, dynamic>{};

    Map<String, String> headers = <String, String>{};
    if (userDataSingleton.accessToken.isNotEmpty) {
      headers['Authorization'] = userDataSingleton.accessToken;
    }

    Logger().d("Request Url :: $apiUrl");
    Logger().d("Request Params :: $paramsFinal");
    Logger().d("Request headers :: $headers");

    return Tuple4(apiUrl, headers, paramsFinal, arrFile);
  }

  /// custom
  static Tuple4<String, Map<String, String>, Map<String, dynamic>,
          List<AppMultiPartFile>>
      requestParamsForSyncCustom(String url, ApiType type,
          {Map<String, dynamic>? params,
          List<AppMultiPartFile> arrFile = const [],
          String? urlParams}) {
    String apiUrl = url + ApiConstant.getValue(type);

    if (urlParams != null) apiUrl = apiUrl + urlParams;

    Map<String, dynamic> paramsFinal = params ?? <String, dynamic>{};

    Map<String, String> headers = <String, String>{};
    if (userDataSingleton.accessToken.isNotEmpty) {
      headers['Authorization'] = userDataSingleton.accessToken;
    }

    Logger().d("Request Url :: $apiUrl");
    Logger().d("Request Params :: $paramsFinal");
    Logger().d("Request headers :: $headers");

    return Tuple4(apiUrl, headers, paramsFinal, arrFile);
  }
}

class AppMultiPartFile {
  List<File>? localFiles;
  String? key;

  AppMultiPartFile({this.localFiles, this.key});

  AppMultiPartFile.fromType({this.localFiles, this.key});
}
