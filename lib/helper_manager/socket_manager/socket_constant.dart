import 'dart:io';

import '../../singleton/user_data_singleton.dart';
import '../../util/app_logger.dart';
import 'package:tuple/tuple.dart';

enum EventType {
  connect,
  userList,
  userTyping,
  sendMessage,
  chatHistory,
  chatList,
  messageStatus,
  disConnected
}

class SocketConstant {
  //change when live url
  static bool get isLiveURl => true;

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

  static String get baseDomainSocket => 'http://202.131.117.92:7100/';

  static String get prefixVersion => 'v6/chat';

  static String getEvent(EventType type) {
    switch (type) {
      case EventType.connect:
        return 'client-user-connected';
      case EventType.userList:
        return 'client-user-listing';
      case EventType.userTyping:
        return 'client-user-typing';
      case EventType.sendMessage:
        return 'client-send-message';
      case EventType.chatHistory:
        return 'client-chat-history';
      case EventType.chatList:
        return 'client-chat-listing';
      case EventType.messageStatus:
        return 'client-change-message-status-all';
      case EventType.disConnected:
        return 'client-disconnected';
     default:
        return "";
    }
  }


}