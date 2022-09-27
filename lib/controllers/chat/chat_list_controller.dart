import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_demo/helper_manager/network_manager/api_constant.dart';
import 'package:flutter_demo/helper_manager/network_manager/remote_services.dart';
import 'package:flutter_demo/helper_manager/socket_manager/socket_constant.dart';
import 'package:flutter_demo/helper_manager/socket_manager/socket_manager.dart';
import 'package:flutter_demo/models/base/response_model.dart';
import 'package:flutter_demo/models/chat/chat_history/chat_history.dart';
import 'package:flutter_demo/models/chat/chat_list/chat_list.dart';
import 'package:flutter_demo/models/chat/create_room/create_room.dart';
import 'package:flutter_demo/models/chat/user_list/user_list.dart';
import 'package:flutter_demo/util/app_logger.dart';
import 'package:flutter_demo/util/snackbar_util.dart';

import '../../singleton/user_data_singleton.dart';
import 'package:get/get.dart';

class ChatListController extends GetxController {
  // var userList = <UserModel>[]. ;
  var chatList = <ChatUser>[].obs;
  ChatListResponse? mUserListResponse;
  var isSelected = true.obs;

  // user list
  var userList = <User>[].obs;
  var roomId = "".obs;
  var selectedIndex = 0.obs;


  // chat screen
  var chatHistoryList = <ChatHistory>[].obs;
  var chatHistoryListTemp = <ChatHistory>[].obs;
  TextEditingController sendMessageController = TextEditingController();
  var userName = "".obs;
  var lastMessageTime = "".obs;
  var isType = false.obs;
  var isWriting = false.obs;
  var isFirst = false.obs;

  chatListEvent({required context,required pullToRefresh}) {
    Map<String, dynamic> socketParams = {};
    socketParams['userId'] = userDataSingleton.id;
    SocketManager.chatListEvent(socketParams, onChatList: (chatListResponse) {
      if (chatListResponse.status == SocketConstant.statusCodeSuccess) {
        chatList.clear();
        chatList.addAll(chatListResponse?.data ?? []);
        update(chatList);
      }
    },onError: (message){
      SnackbarUtil.showSnackbar(
        context: context,
        type: SnackType.error,
        message: message,
      );
    });
  }

  /// user list

  // user list

  getUserListEvent({required pullToRefresh, required context}) {
    Map<String, dynamic> socketParams = {};
    socketParams['userId'] = userDataSingleton.id;
    SocketManager.userListEvent(socketParams, onUserList: (userListResponse) {
      if (userListResponse.status == SocketConstant.statusCodeSuccess) {
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

  // create room
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


  /// history


  getChatHistory({required pullToRefresh, required context}) {
    Map<String, dynamic> socketParams = {};
    socketParams['userId'] = userDataSingleton.id;
    socketParams['roomId'] = roomId.value;
    socketParams['skip'] = "0";
    socketParams['limit'] = "1000";
    SocketManager.chatHistoryEvent(socketParams, onChatHistory: (userListResponse) {
      if (userListResponse.status == SocketConstant.statusCodeSuccess) {
        chatHistoryList.clear();
        chatHistoryListTemp.clear();
        chatHistoryListTemp.addAll(userListResponse?.data ?? []);
        chatHistoryList.addAll(chatHistoryListTemp.reversed.toList());
        update(chatHistoryList);
      }
    }, onError: (message) {
      SnackbarUtil.showSnackbar(
        context: context,
        type: SnackType.error,
        message: message,
      );
    });
  }

  sendMessage({required context, required message}) {
    Map<String, dynamic> socketParams = {};
    socketParams['userId'] = userDataSingleton.id;
    socketParams['roomId'] = roomId.value;
    socketParams['message'] = message;
    socketParams['mediaId'] = "";
    SocketManager.sendMessageEvent(socketParams, onSend: (sendMessageResponse) {
      userTyping(context: context, typeId: "0");
      chatHistoryList.insert(0, sendMessageResponse.data);
    }, onError: (message) {
      SnackbarUtil.showSnackbar(
        context: context,
        type: SnackType.error,
        message: message,
      );
    });
  }

  userTyping({required context, required typeId}) {
    Map<String, dynamic> socketParams = {};
    socketParams['user_id'] = userDataSingleton.id;
    socketParams['roomId'] = roomId.value;
    socketParams['typing'] = typeId;
    SocketManager.userTypingEvent(socketParams, onError: (message) {
      SnackbarUtil.showSnackbar(
        context: context,
        type: SnackType.error,
        message: message,
      );
    });
  }

}
