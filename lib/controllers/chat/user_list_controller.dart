import 'dart:convert';

import 'package:flutter_demo/helper_manager/network_manager/api_constant.dart';
import 'package:flutter_demo/helper_manager/network_manager/remote_services.dart';
import 'package:flutter_demo/helper_manager/socket_manager/socket_constant.dart';
import 'package:flutter_demo/helper_manager/socket_manager/socket_manager.dart';
import 'package:flutter_demo/models/base/response_model.dart';
import 'package:flutter_demo/models/chat/create_room/create_room.dart';
import 'package:flutter_demo/models/chat/user_list/user_list.dart';
import 'package:flutter_demo/util/app_logger.dart';
import 'package:flutter_demo/util/snackbar_util.dart';

import '../../singleton/user_data_singleton.dart';
import 'package:get/get.dart';

class UserListController extends GetxController {
  // var userList = <UserModel>[]. ;
  var isDataLoading = false.obs, userList = <User>[].obs;
  UserListResponse? mUserListResponse;
  var roomId = "".obs;
  var selectedIndex = 0.obs;

  updateLoadingFlag() {
    isDataLoading.value = !isDataLoading.value;
    update();
  }

  getUserList({required pullToRefresh, required context}) {
    if (!pullToRefresh) updateLoadingFlag();
    Map<String, dynamic> socketParams = {};
    socketParams['userId'] = userDataSingleton.id;
    SocketManager.userListEvent(socketParams, onUserList: (userListResponse) {
      if (userListResponse.status == SocketConstant.statusCodeSuccess) {
        if (!pullToRefresh) updateLoadingFlag();
        userList.clear();
        userList.addAll(userListResponse?.data ?? []);
        update(userList);
      }
    }, onError: (message) {
      SnackbarUtil.showSnackbar(
        context: context,
        type: SnackType.error,
        message: message,
      );
    });
  }

  createRoomAPICall({required dynamic requestParams, required onError}) async {
    // updateLoggingFlag();

    // ResponseModel<UserModel> loginAPIResponse = await sharedServiceManager.createPostRequest(endPoint: APIConstants.userLoginEndPoint, requestParams: requestParams);
    ResponseModel<Room> createRoomAPIResponse = await sharedServiceManager.createPostRequest(typeOfEndPoint: ApiType.createRoom, params: requestParams);

    // updateLoggingFlag();

    if (createRoomAPIResponse.status == ApiConstant.statusCodeSuccess) {
      Logger().d("createRoomAPIResponse : -> ${createRoomAPIResponse.data?.roomId}");
      roomId.value = createRoomAPIResponse.data?.roomId ?? "";
      return true;
    } else {
      onError(createRoomAPIResponse.message);
      return false;
    }
  }
}
