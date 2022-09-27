import 'dart:convert';

import 'package:flutter_demo/helper_manager/socket_manager/socket_constant.dart';
import 'package:flutter_demo/helper_manager/socket_manager/socket_manager.dart';
import 'package:flutter_demo/models/base/response_model.dart';
import 'package:flutter_demo/models/chat/chat_history/chat_history.dart';
import 'package:flutter_demo/models/chat/chat_list/chat_list.dart';
import 'package:flutter_demo/models/chat/user_list/user_list.dart';
import 'package:flutter_demo/util/app_logger.dart';
import 'package:flutter_demo/util/import_export_util.dart';
import 'package:flutter_demo/util/snackbar_util.dart';

import '../../singleton/user_data_singleton.dart';
import 'package:get/get.dart';

class ChatScreenController extends GetxController {
  // var userList = <UserModel>[]. ;
  var chatHistoryList = <ChatHistory>[].obs;
  var chatList = <ChatUser>[].obs;
  var chatHistoryListTemp = <ChatHistory>[].obs;
  UserListResponse? mUserListResponse;
  TextEditingController sendMessageController = TextEditingController();
  var userName = "".obs;
  var lastMessageTime = "".obs;
  var roomId = "".obs;
  var isType = false.obs;
  var isWriting = false.obs;
  var isSelected = true.obs;
  var isFirst = true.obs;

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

  chatListEvent({required context, required pullToRefresh}) {
    Map<String, dynamic> socketParams = {};
    socketParams['userId'] = userDataSingleton.id;
    SocketManager.chatListEvent(socketParams, onChatList: (chatListResponse) {
      if (chatListResponse.status == SocketConstant.statusCodeSuccess) {
        chatList.clear();
        chatList.addAll(chatListResponse?.data ?? []);
        update(chatList);
      }
    }, onError: (message) {
      SnackbarUtil.showSnackbar(
        context: context,
        type: SnackType.error,
        message: message,
      );
    });
  }
}
