import 'dart:convert';

import 'package:flutter_demo/helper_manager/network_manager/api_constant.dart';
import 'package:flutter_demo/helper_manager/socket_manager/socket_constant.dart';
import 'package:flutter_demo/models/base/response_model.dart';
import 'package:flutter_demo/models/chat/user_list/user_list.dart';
import 'package:flutter_demo/singleton/user_data_singleton.dart';
import 'package:flutter_demo/util/app_logger.dart';
import 'package:socket_io_client/socket_io_client.dart';

class SocketManager {
  static late final Socket _socket;

  static final String _serverUrl = SocketConstant.baseDomainSocket + SocketConstant.prefixVersion;

  static final _optionBuilder = OptionBuilder().setTransports(['websocket']).disableAutoConnect().build();

  static void connectToServer({required onError}) {
    try {
      Logger().i("Connecting to $_serverUrl...");

      _socket = io(_serverUrl, _optionBuilder).connect();

      _socket.onConnect((data) {
        Logger().i("onConnect(): Connected to $_serverUrl");
        onError("connect");
      });

      _socket.onError((data) {
        Logger().e("onError(): Socket onError $data");
      });

      _socket.onConnectError((data) {
        Logger().e("onConnectError(): $data");
        _socket.disconnect();
      });

      _socket.onConnectTimeout((_) {
        Logger().e("onConnectTimeout(): Connection timed out! ($_serverUrl)");
      });

      /*   _socket.onDisconnect((_) {
        Logger().i("onDisconnect(): Disconnected");
        _socket.close();
      }); */
    } catch (e) {
      Logger().e("OnCatch(): Error while connecting to $_serverUrl $e");
    }
  }

  static void disconnectFromServer() {
    try {
      _socket.onDisconnect((_) {
        Logger().i("onDisconnect(): Disconnected");
        _socket.close();
      });
    } catch (e) {
      Logger().e('OnCatch(): Error wile disconnecting from server');
    }
  }

  static void userConnectEvent(Map<String, dynamic> socketParams, {required onConnect}) {
    if (_socket.connected) {
      Logger().i("userConnectEvent(): socketParams -> $socketParams");

      try {
        // _socket.emit("message", messagePayload);
        _socket.emitWithAck(SocketConstant.getEvent(EventType.connect), socketParams, ack: (data) {
          Logger().i("userConnectEvent() : Response -> $data");
          onConnect(data);
        });
      } catch (e) {
        Logger().e("userConnectEvent(): On catch $e");
      }
    } else {
      Logger().e("userConnectEvent(): Unable to connect user");
    }
  }

  static Future<dynamic> userListEvent(Map<String, dynamic> socketParams, {required onUserList, required onError}) async {
    if (_socket.connected) {
      Logger().i("userListEvent(): socketParams -> $socketParams");

      try {
        _socket.emitWithAck(SocketConstant.getEvent(EventType.userList), socketParams, ack: (data) {
          var d = Map<String, dynamic>.from(data);
          var dataResponse = UserListResponse.fromJson(d);
          Logger().i("userListEvent(): Response -> $dataResponse");
          if (dataResponse.status == SocketConstant.statusCodeSuccess) {
            onUserList(dataResponse);
          } else {
            onError(dataResponse.message);
          }
        });
      } catch (e) {
        Logger().e("userListEvent(): On catch $e");
        onError(e);
        return null;
      }
    } else {
      Logger().e("userListEvent(): Unable to get user list");
      onError("socket not connect");
      return null;
    }
  }

  static Future<dynamic> chatListEvent(Map<String, dynamic> socketParams, {required onChatList}) async {
    if (_socket.connected) {
      Logger().i("chatListEvent(): socketParams -> $socketParams");

      try {
        _socket.emitWithAck(SocketConstant.getEvent(EventType.userList), socketParams, ack: (data) {
          var dataResponse = UserListResponse.fromJson(Map<String, dynamic>.from(data));
          Logger().d(" Data = > $dataResponse");
          onChatList(dataResponse);
        });
      } catch (e) {
        Logger().e("chatListEvent(): On catch $e");
        return null;
      }
    } else {
      Logger().e("chatListEvent(): Unable to get user list");
      return null;
    }
  }

  static void performClientUserConnectedEvent() {}

  static void sendMessage({required String message}) {
    if (_socket.connected) {
      Map<String, String> messagePayload = {
        "id": _socket.id ?? "",
        "message": message,
        "timestamp": DateTime.now().millisecondsSinceEpoch.toString(),
        "from_id": "from_id",
        "to_id": "to_id",
      };

      Logger().i("sendMessage(): Message payload -> $messagePayload");

      try {
        // _socket.emit("message", messagePayload);

        _socket.emitWithAck("message", messagePayload, ack: (response) {
          Logger().i("sendMessage(): Response -> $response");
          Logger().i("sendMessage(): Sent message ID -> ${response['id']}");
        });
      } catch (e) {
        Logger().e("sendMessage(): On catch $e");
      }
    } else {
      Logger().e("sendMessage(): Unable to send a message, please connect socket to send a message");
    }
  }

  static void sendTyping({required bool typing}) async {
    if (_socket.connected) {
      Map<String, String> typingPayload = {"id": _socket.id!, "typing": typing.toString()};

      Logger().i("sendTyping(): Typing payload -> $typingPayload");

      try {
        _socket.emit("typing", typingPayload);
      } catch (e) {
        Logger().e("sendTyping(): On catch $e");
      }
    } else {
      Logger().e("sendTyping(): Unable to send typing, please connect socket to send typing");
      connectToServer(onError: () {});
      if (!_socket.connected) return;
      sendTyping(typing: true);
    }
  }

  static void getMessage({required Function handleMessage}) {
    if (_socket.connected) {
      try {
        _socket.on("message", (data) => handleMessage);
      } catch (e) {
        Logger().e("getMessage(): On catch $e");
      }
    } else {
      Logger().e("getMessage(): Unable to send typing, please connect socket to get message");
    }
  }
}
