import 'package:debounce_throttle/debounce_throttle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
import 'package:permission_handler/permission_handler.dart';

import '../../singleton/user_data_singleton.dart';
import 'package:get/get.dart';

class ChatListController extends GetxController {
  TextEditingController sendMessageController = TextEditingController();
  final debounceText = Debouncer<String>(const Duration(milliseconds: 5000), initialValue: '');

  /// common
  var hasType = false.obs;
  var hasFirst = true.obs;
  var hasChatList = true.obs; // check select user list or chat list
  var hasChatSelected = false.obs; // check select chat
  var roomId = "".obs;
  var imageId = "".obs;
  var userName = "".obs;
  var platform = const MethodChannel('flutter.native/helper');
  var hasPermission = false.obs;

  /// chat list
  var chatList = <ChatUser>[].obs;

  /// user list
  var userList = <User>[].obs;
  var selectedUserIndex = 0.obs;

  /// chat
  var chatHistoryList = <ChatHistory>[].obs;
  var chatHistoryListTemp = <ChatHistory>[].obs;
  UserListResponse? mUserListResponse;

  @override
  void onInit() {
    super.onInit();

    /// check user typing or not

    debounceText.values.listen((search) {
      userTyping(typeId: "0");
    });
  }

  /// chat list event

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

  /// user list event

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

  /// create room api
  createRoomAPICall({required dynamic requestParams, required onError}) async {
    ResponseModel<Room> createRoomAPIResponse = await sharedServiceManager.createPostRequest(typeOfEndPoint: ApiType.createRoom, params: requestParams);
    if (createRoomAPIResponse.status == ApiConstant.statusCodeSuccess) {
      Logger().d("createRoomAPIResponse : -> ${createRoomAPIResponse.data?.roomId}");
      roomId.value = createRoomAPIResponse.data?.roomId ?? "";
      return true;
    } else {
      onError(createRoomAPIResponse.message);
      return false;
    }
  }

  /// upload media
  uploadFileAPICall({required dynamic requestParams, required onError, required List<AppMultiPartFile> file, required context}) async {
    ResponseModel<ImagesData> uploadImageAPIResponse = await sharedServiceManager.uploadRequest(ApiType.fileUpload, arrFile: file);
    if (uploadImageAPIResponse.status == ApiConstant.statusCodeSuccess) {
      Logger().d("uploadFileAPICall : -> ${uploadImageAPIResponse.data?.images}");
      imageId.value = uploadImageAPIResponse.data?.images ?? "";
      sendMessage(context: context, message: "", imageId: uploadImageAPIResponse.data?.images ?? "");
      return true;
    } else {
      onError(uploadImageAPIResponse.message);
      return false;
    }
  }

  /// chat history event

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

  /// send message event

  sendMessage({required context, required message, required String imageId}) {
    Map<String, dynamic> socketParams = {};
    socketParams['userId'] = userDataSingleton.id;
    socketParams['roomId'] = roomId.value;
    socketParams['message'] = message;
    socketParams['mediaId'] = imageId;
    SocketManager.sendMessageEvent(socketParams, onSend: (sendMessageResponse) {
      userTyping(typeId: "0");
      chatHistoryList.insert(0, sendMessageResponse.data);
    }, onError: (message) {
      SnackbarUtil.showSnackbar(
        context: context,
        type: SnackType.error,
        message: message,
      );
    });
  }

  /// user typing event

  userTyping({required typeId}) {
    Map<String, dynamic> socketParams = {};
    socketParams['user_id'] = userDataSingleton.id;
    socketParams['roomId'] = roomId.value;
    socketParams['typing'] = typeId;
    SocketManager.userTypingEvent(socketParams, onError: (message) {});
  }
}
