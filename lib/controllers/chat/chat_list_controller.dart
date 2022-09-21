import 'dart:convert';

import 'package:flutter_demo/helper_manager/socket_manager/socket_constant.dart';
import 'package:flutter_demo/helper_manager/socket_manager/socket_manager.dart';
import 'package:flutter_demo/models/base/response_model.dart';
import 'package:flutter_demo/models/chat/user_list/user_list.dart';
import 'package:flutter_demo/util/app_logger.dart';

import '../../singleton/user_data_singleton.dart';
import 'package:get/get.dart';

class ChatListController extends GetxController {
  // var userList = <UserModel>[]. ;
  var isDataLoading = false.obs, userList = <ChatUser>[].obs;
  UserListResponse? mUserListResponse;

  updateLoadingFlag() {
    isDataLoading.value = !isDataLoading.value;
    update();
  }

  getUserList({required pullToRefresh}) {
    if (!pullToRefresh) updateLoadingFlag();
    Map<String, dynamic> socketParams = {};
    socketParams['userId'] = userDataSingleton.id;
    SocketManager.chatListEvent(socketParams, onChatList: (chatListResponse) {
      if (chatListResponse.status == SocketConstant.statusCodeSuccess) {
        if (!pullToRefresh) updateLoadingFlag();
        userList.clear();
        userList.addAll(chatListResponse?.data ?? []);
        update(userList);
      }
    });
  }
}
