import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

import '../../helper_manager/network_manager/api_constant.dart';
import '../../helper_manager/network_manager/init_dio.dart';
import '../../models/base/response_model.dart';
import '../../util/app_common_stuffs/string_constants.dart';
import '../../util/app_logger.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart';

import '../../util/network_util.dart';
import '../../util/snackbar_util.dart';

var sharedServiceManager = RemoteServices.singleton;

class RemoteServices {
  static var dio = initDio();

  RemoteServices._internal();

  static final RemoteServices singleton = RemoteServices._internal();

  factory RemoteServices() {
    return singleton;
  }

  ///  Custom requests
  Future<Response?> createCustomRequest<T>(
      {required String baseUrl,required BuildContext mContext,
      required ApiType typeOfEndPoint,
      required MethodType typeOfMethod,
      Map<String, dynamic>? params,
      String? urlParam}) async {

    if (await NetworkUtil.isNetworkConnected()) {
      final requestFinal = ApiConstant.requestParamsForSyncCustom(
          baseUrl, typeOfEndPoint,
          params: params, urlParams: urlParam);
      var mDio = mInitDio(baseUrl);
      try {
        Response response;
        switch (typeOfMethod) {
          case MethodType.get:
            response = await mDio.get(requestFinal.item1,
                options: Options(headers: requestFinal.item2));
            break;
          case MethodType.post:
            response = await dio.post(requestFinal.item1,
                data: requestFinal.item3,
                options: Options(headers: requestFinal.item2));
            break;
          case MethodType.put:
            response = await mDio.put(requestFinal.item1,
                options: Options(headers: requestFinal.item2));
            break;
          case MethodType.delete:
            response = await mDio.delete(requestFinal.item1,
                options: Options(headers: requestFinal.item2));
            break;
        }

        return response;
      } on DioError catch (e) {
        SnackbarUtil.showSnackbar(
          context: mContext,
          type: SnackType.error,
          message: e.message,
        );
        return null;
      }
    } else {
      SnackbarUtil.showSnackbar(
        context: mContext,
        type: SnackType.error,
        message: StringConstant.noInternetMsg,
      );
      return null;
    }
  }

  /// GET requests
  Future<ResponseModel<T>> createGetRequest<T>(
      {required ApiType typeOfEndPoint,
      Map<String, dynamic>? params,
      String? urlParam}) async {
    if (await NetworkUtil.isNetworkConnected()) {
      final requestFinal = ApiConstant.requestParamsForSync(typeOfEndPoint,
          params: params, urlParams: urlParam);

      try {
        Response response = await dio.get(requestFinal.item1,
            options: Options(headers: requestFinal.item2));
        final Map<String, dynamic> responseJson =
            json.decode(response.data.toString());
        return ResponseModel<T>.fromJson(responseJson);
      } on DioError catch (e) {
        return createErrorResponse(
            status: ApiConstant.statusCodeBadGateway, message: e.message);
      }
    } else {
      return createErrorResponse(
          status: ApiConstant.statusCodeServiceNotAvailable,
          message: StringConstant.noInternetMsg);
    }
  }

  /// GET requests custom
  /*Future<ResponseModel<T>> createGetRequestCustom<T>(
      {required ApiType typeOfEndPoint,
      Map<String, dynamic>? params,
      String? urlParam}) async {
    if (await NetworkUtil.isNetworkConnected()) {
      final requestFinal = ApiConstant.requestParamsForSyncCustomList(
          typeOfEndPoint,
          params: params,
          urlParams: urlParam);

      try {
        var mDio = mInitDio();
        Response response = await mDio.get(requestFinal.item1,
            options: Options(headers: requestFinal.item2));
        // var d = ResponseModel(status: 2,message: "good",data: response.data);
        // final Map<String, dynamic> responseJson = json.decode(d.data.toString());
        var d = {"data": response.data, "status": 200, "message": "good"};
        return ResponseModel<T>.fromJson(d, response.statusCode!);
      } on DioError catch (e) {
        return createErrorResponse(
            status: ApiConstant.statusCodeBadGateway, message: e.message);
      }
    } else {
      return createErrorResponse(
          status: ApiConstant.statusCodeServiceNotAvailable,
          message: StringConstant.noInternetMsg);
    }
  }*/

  /// POST requests
  Future<ResponseModel<T>> createPostRequest<T>(
      {required ApiType typeOfEndPoint,
      Map<String, dynamic>? params,
      String? urlParam}) async {
    if (await NetworkUtil.isNetworkConnected()) {
      final requestFinal = ApiConstant.requestParamsForSync(typeOfEndPoint,
          params: params, urlParams: urlParam);
      /*
      * item1 => API End-Point
      * item2 => Header
      * item3 => Request Param
      * item4 => Multipart file
      * */
      try {
        // Response response = await dio.post(requestFinal.item1, data: requestFinal.item3, options: Options(headers: requestFinal.item2));
        Response response = await dio.post(requestFinal.item1,
            data: requestFinal.item3,
            options: Options(headers: requestFinal.item2));

        return ResponseModel<T>.fromJson(response.data);
      } on DioError catch (e) {
        return createErrorResponse(
            status: ApiConstant.statusCodeBadGateway, message: e.message);
      }
    } else {
      return createErrorResponse(
          status: ApiConstant.statusCodeServiceNotAvailable,
          message: StringConstant.noInternetMsg);
    }
  }

/*
  /// POST requests
  Future<UserListModel> createPostRequestCustomList<T>({required ApiType typeOfEndPoint, Map<String, dynamic>? params, String? urlParam}) async {
    if (await NetworkUtil.isNetworkConnected()) {
      final requestFinal = ApiConstant.requestParamsForSyncCustomList(typeOfEndPoint, params: params, urlParams: urlParam);
      */ /*
      * item1 => API End-Point
      * item2 => Header
      * item3 => Request Param
      * item4 => Multipart file
      * */ /*
      try {
        Response response = await dio.post(requestFinal.item1, data: requestFinal.item3, options: Options(headers: requestFinal.item2));

        return UserListModel.fromJson(response.data);
      } on DioError catch (e) {
        return createErrorResponseCustom(status: ApiConstant.statusCodeBadGateway, message: e.message);
      }
    } else {
      return createErrorResponseCustom(status: ApiConstant.statusCodeBadGateway, message: "message");
    }
  }

  UserListModel createErrorResponseCustom<T>({required int status, required String message}) {
    return UserListModel(id: 0,email: "null",gender: "null",name: "null",status: "null");
  }*/

  /// PUT requests
  Future<ResponseModel<T>> createPutRequest<T>(
      {required ApiType typeOfEndPoint,
      Map<String, dynamic>? params,
      String? urlParam}) async {
    if (await NetworkUtil.isNetworkConnected()) {
      final requestFinal = ApiConstant.requestParamsForSync(typeOfEndPoint,
          params: params, urlParams: urlParam);
      /*
      * item1 => API End-Point
      * item2 => Header
      * item3 => Request Param
      * item4 => Multipart file
      * */
      try {
        Response response = await dio.put(requestFinal.item1,
            data: requestFinal.item3,
            options: Options(headers: requestFinal.item2));

        return ResponseModel<T>.fromJson(
            json.decode(response.data.toString()));
      } on DioError catch (e) {
        return createErrorResponse(
            status: ApiConstant.statusCodeBadGateway, message: e.message);
      }
    } else {
      return createErrorResponse(
          status: ApiConstant.statusCodeServiceNotAvailable,
          message: StringConstant.noInternetMsg);
    }
  }

  /// DELETE requests
  Future<ResponseModel<T>> createDeleteRequest<T>(
      {required ApiType typeOfEndPoint,
      Map<String, dynamic>? params,
      String? urlParam}) async {
    if (await NetworkUtil.isNetworkConnected()) {
      final requestFinal = ApiConstant.requestParamsForSync(typeOfEndPoint,
          params: params, urlParams: urlParam);
      /*
      * item1 => API End-Point
      * item2 => Header
      * item3 => Request Param
      * item4 => Multipart file
      * */
      try {
        Response response = await dio.delete(requestFinal.item1,
            data: requestFinal.item3,
            options: Options(headers: requestFinal.item2));

        return ResponseModel<T>.fromJson(
            json.decode(response.data.toString()));
      } on DioError catch (e) {
        return createErrorResponse(
            status: ApiConstant.statusCodeBadGateway, message: e.message);
      }
    } else {
      return createErrorResponse(
          status: ApiConstant.statusCodeServiceNotAvailable,
          message: StringConstant.noInternetMsg);
    }
  }

  ResponseModel<T> createErrorResponse<T>(
      {required int status, required String message}) {
    return ResponseModel(status: status, message: message, data: null);
  }

  Future<ResponseModel<T>> uploadRequest<T>(ApiType apiType,
      {Map<String, dynamic>? params,
      List<AppMultiPartFile>? arrFile,
      String? urlParam}) async {
    if (await NetworkUtil.isNetworkConnected()) {
      final requestFinal = ApiConstant.requestParamsForSync(apiType,
          params: params, arrFile: arrFile ?? []);

      Map<String, dynamic> other = <String, dynamic>{};
      other.addAll(requestFinal.item3);

      /* Adding File Content */
      for (AppMultiPartFile partFile in requestFinal.item4) {
        List<MultipartFile> uploadFiles = [];
        for (File file in partFile.localFiles ?? []) {
          String filename = basename(file.path);

          /// PDF Media
          if (filename.toLowerCase().contains(".pdf")) {
            MultipartFile mFile =
                await MultipartFile.fromFile(file.path, filename: filename);
            uploadFiles.add(mFile);
          }

          /// Video Media
          else if (filename.toLowerCase().contains(".mp4") ||
              filename.toLowerCase().contains(".mov") ||
              filename.toLowerCase().contains(".mkv")) {
            MultipartFile mFile = await MultipartFile.fromFile(file.path,
                filename: filename,
                contentType: MediaType('video', filename.split(".").last));
            uploadFiles.add(mFile);
          }

          /// Image Media
          else {
            MultipartFile mFile = await MultipartFile.fromFile(file.path,
                filename: filename,
                contentType: MediaType('image', filename.split(".").last));
            uploadFiles.add(mFile);
          }
        }
        if (uploadFiles.isNotEmpty) {
          other[partFile.key ?? ""] =
              (uploadFiles.length == 1) ? uploadFiles.first : uploadFiles;
        }
      }

      FormData formData = FormData.fromMap(other);
      final option = Options(headers: requestFinal.item2);

      try {
        final response = await dio.post(
          requestFinal.item1,
          data: formData,
          options: option,
          onSendProgress: (sent, total) {
            var progress = sent / total;
            Logger().v("uploadFile $progress");
          },
        );

        return ResponseModel<T>.fromJson(response.data);
      } on DioError catch (error) {
        return createErrorResponse(
            status: ApiConstant.statusCodeBadGateway, message: error.message);
      }
    } else {
      return createErrorResponse(
          status: ApiConstant.statusCodeServiceNotAvailable,
          message: StringConstant.noInternetMsg);
    }
  }
}
