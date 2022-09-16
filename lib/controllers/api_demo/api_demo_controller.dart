import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:flutter_demo/helper_manager/network_manager/api_constant.dart';
import 'package:flutter_demo/helper_manager/network_manager/remote_services.dart';
import 'package:flutter_demo/models/add_user/add_user_model.dart';
import 'package:flutter_demo/models/base/response_model.dart';
import 'package:flutter_demo/models/user_list/user_list_model.dart';
import 'package:flutter_demo/util/app_logger.dart';
import 'package:get/get.dart';

class ApiDemoController extends GetxController {
  // var userList = <UserModel>[]. ;
  var isDataLoading = false.obs, homeDataList = <UserListModel>[].obs;
  HomeModelCustom? homeModel;
  AddUser? addUser;

  var name = "agile".obs, job = "dev".obs;

  updateLoadingFlag() {
    isDataLoading.value = !isDataLoading.value;
    update();
  }

  homeDataAPICall({
    required BuildContext mContext,
    required requestParams,
    required onError,
    required pullToRefresh,
  }) async {
    if (!pullToRefresh) updateLoadingFlag();

    // ResponseModel<HomeModel> homeAPIResponse = await sharedServiceManager.createPostRequest(endPoint: APIConstants.homeScreenDataEndPoint, requestParams: requestParams);
    dio.Response? response = await sharedServiceManager.createCustomRequest(
        baseUrl: ApiConstant.baseUrl + ApiConstant.prefixVersionN,
        mContext: mContext,
        typeOfMethod: MethodType.get,
        typeOfEndPoint: ApiType.userList,
        params: requestParams);

    if (!pullToRefresh) updateLoadingFlag();
    if (response != null) {
      var d = {"data": response.data, "status": 200, "message": "good"};
      var data =
          ResponseModel<HomeModelCustom>.fromJson(d, response.statusCode!);
      Logger().d("TAG Data = > $data");
      if (data.status == ApiConstant.statusCodeSuccess) {
        homeDataList.clear();
        homeModel = data.data;
        homeDataList.addAll(homeModel?.data! ?? []);
        update(homeDataList);
      }
    }
  }

  homeAddDataAPICall({
    required BuildContext mContext,
    required requestParams,
    required onError,
    required pullToRefresh,
  }) async {
    if (!pullToRefresh) updateLoadingFlag();

    Map<String, dynamic> requestParams = {};

    requestParams['name'] = name.value;
    requestParams['job'] = job.value;

    // ResponseModel<HomeModel> homeAPIResponse = await sharedServiceManager.createPostRequest(endPoint: APIConstants.homeScreenDataEndPoint, requestParams: requestParams);
    dio.Response? response = await sharedServiceManager.createCustomRequest(
        baseUrl: ApiConstant.baseUrlNew + ApiConstant.prefixApi,
        mContext: mContext,
        typeOfEndPoint: ApiType.addUser,
        typeOfMethod: MethodType.post,
        params: requestParams);

    if (!pullToRefresh) updateLoadingFlag();
    if (response != null) {
      var mData = {"data": response.data, "status": 200, "message": "good"};
      var data = ResponseModel<AddUser>.fromJson(mData, response.statusCode!);
      Logger().d("TAG Data = > $data");
      if (data.status == ApiConstant.statusCodeSuccess) {
        addUser = data.data;
        homeDataList.add(UserListModel(
            id: int.parse(addUser!.id ?? ""),
            name: addUser!.name,
            email: "${addUser!.name}@gmail.com",
            status: addUser!.id,
            gender: "gender"));
        update(homeDataList);
      }
    }
  }

}
