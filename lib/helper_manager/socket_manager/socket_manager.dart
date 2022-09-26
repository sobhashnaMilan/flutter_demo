import 'package:flutter_demo/controllers/chat/chat_controller.dart';
import 'package:flutter_demo/helper_manager/socket_manager/socket_constant.dart';
import 'package:flutter_demo/models/base/empty_response.dart';
import 'package:flutter_demo/models/base/response_model.dart';
import 'package:flutter_demo/models/chat/chat_history/chat_history.dart';
import 'package:flutter_demo/models/chat/chat_list/chat_list.dart';
import 'package:flutter_demo/models/chat/send_message/send_message.dart';
import 'package:flutter_demo/models/chat/typeing/typeing.dart';
import 'package:flutter_demo/models/chat/user_list/user_list.dart';
import 'package:flutter_demo/singleton/user_data_singleton.dart';
import 'package:flutter_demo/util/app_logger.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart';

class SocketManager {
  static late final Socket _socket;

  static final String _serverUrl = SocketConstant.baseDomainSocket + SocketConstant.prefixVersion;

  static final _optionBuilder = OptionBuilder().setTransports(['websocket']).disableAutoConnect().build();

  static void connectToServer({required onError, required onConnectManager}) {
    try {
      Logger().i("Connecting to $_serverUrl...");

      _socket = io(_serverUrl, _optionBuilder).connect();

      _socket.onConnect((data) {
        Logger().i("onConnect(): Connected to $_serverUrl");
        onConnectManager("onConnect");
        receiveMessageEvent();
        serverMessageStatusEvent();
        startTypeEvent();
        stopTypeEvent();
      });

      _socket.onError((data) {
        Logger().e("onError(): Socket onError $data");
        onError("onError");
      });

      _socket.onConnectError((data) {
        Logger().e("onConnectError(): $data");
        _socket.disconnect();
        onError("onConnectError");
      });

      _socket.onConnectTimeout((_) {
        Logger().e("onConnectTimeout(): Connection timed out! ($_serverUrl)");
        onError("onConnectTimeout");
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
          Logger().d("userListEvent() : response -> $data");
          var dataResponse = ResponseModel<List<User>>.fromJson(Map<String, dynamic>.from(data));
          if (dataResponse.status == 200) {
            Logger().d("userListEvent() : response -> $dataResponse");
            onUserList(dataResponse);
          } else {
            Logger().d("userListEvent() : error -> ${dataResponse.message}");
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

  // base response
  static Future<dynamic> chatListEvent(Map<String, dynamic> socketParams, {required onChatList, required onError}) async {
    if (_socket.connected) {
      Logger().i("chatListEvent(): socketParams -> $socketParams");

      try {
        _socket.emitWithAck(SocketConstant.getEvent(EventType.chatList), socketParams, ack: (data) {
          Logger().d("chatListEvent() : response -> $data");
          var dataResponse = ResponseModel<List<ChatUser>>.fromJson(Map<String, dynamic>.from(data));
          if (dataResponse.status == 200) {
            Logger().d("chatListEvent() : response -> $dataResponse");
            onChatList(dataResponse);
          } else {
            Logger().d("chatListEvent() : error -> ${dataResponse.message}");
            onError(dataResponse.message);
          }
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

  static Future<dynamic> chatHistoryEvent(Map<String, dynamic> socketParams, {required onChatHistory, required onError}) async {
    if (_socket.connected) {
      Logger().i("chatHistoryEvent(): socketParams -> $socketParams");

      try {
        _socket.emitWithAck(SocketConstant.getEvent(EventType.chatHistory), socketParams, ack: (data) {
          Logger().d("chatHistoryEvent() : response -> $data");
          var dataResponse = ResponseModel<List<ChatHistory>>.fromJson(Map<String, dynamic>.from(data));
          if (dataResponse.status == 200) {
            Logger().d("chatHistoryEvent() : response -> $dataResponse");
            onChatHistory(dataResponse);
          } else {
            Logger().d("chatHistoryEvent() : error -> ${dataResponse.message}");
            onError(dataResponse.message);
          }
        });
      } catch (e) {
        Logger().e("chatHistoryEvent(): On catch $e");
        return null;
      }
    } else {
      Logger().e("chatHistoryEvent(): Unable to get user list");
      return null;
    }
  }

  static Future<dynamic> sendMessageEvent(Map<String, dynamic> socketParams, {required onSend, required onError}) async {
    if (_socket.connected) {
      Logger().i("sendMessageEvent(): socketParams -> $socketParams");

      try {
        _socket.emitWithAck(SocketConstant.getEvent(EventType.sendMessage), socketParams, ack: (data) {
          Logger().d("sendMessageEvent() : response -> $data");
          var dataResponse = ResponseModel<ChatHistory>.fromJson(Map<String, dynamic>.from(data));
          if (dataResponse.status == 200) {
            Logger().d("sendMessageEvent() : response -> $dataResponse");
            onSend(dataResponse);
          } else {
            Logger().d("sendMessageEvent() : error -> ${dataResponse.message}");
            onError(dataResponse.message);
          }
        });
      } catch (e) {
        Logger().e("sendMessageEvent(): On catch $e");
        return null;
      }
    } else {
      Logger().e("sendMessageEvent(): Unable to get user list");
      return null;
    }
  }

  static Future<dynamic> userTypingEvent(Map<String, dynamic> socketParams, {required onError}) async {
    if (_socket.connected) {
      Logger().i("userTypingEvent(): socketParams -> $socketParams");

      try {
        _socket.emitWithAck(SocketConstant.getEvent(EventType.userTyping), socketParams, ack: (data) {
          Logger().d("userTypingEvent() : response -> $data");
          var dataResponse = ResponseModel<UserType>.fromJson(Map<String, dynamic>.from(data));
          if (dataResponse.status == 200) {
            Logger().d("userTypingEvent() : response -> $dataResponse");
          } else {
            Logger().d("userTypingEvent() : error -> ${dataResponse.message}");
            onError(dataResponse.message);
          }
        });
      } catch (e) {
        Logger().e("userTypingEvent(): On catch $e");
        return null;
      }
    } else {
      Logger().e("userTypingEvent(): Unable to get user list");
      return null;
    }
  }

  static Future<dynamic> messageStatusEvent(Map<String, dynamic> socketParams, {required onError}) async {
    if (_socket.connected) {
      Logger().i("messageStatusEvent(): socketParams -> $socketParams");

      try {
        _socket.emitWithAck(SocketConstant.getEvent(EventType.messageStatus), socketParams, ack: (data) {
          Logger().d("messageStatusEvent() : response -> $data");
          var dataResponse = ResponseModel<EmptyData>.fromJson(Map<String, dynamic>.from(data));
          if (dataResponse.status == 200) {
            Logger().d("messageStatusEvent() : response -> $dataResponse");
          } else {
            Logger().d("messageStatusEvent() : error -> ${dataResponse.message}");
            onError(dataResponse.message);
          }
        });
      } catch (e) {
        Logger().e("messageStatusEvent(): On catch $e");
        return null;
      }
    } else {
      Logger().e("messageStatusEvent(): Unable to get user list");
      return null;
    }
  }

  static Future<dynamic> receiveMessageEvent() async {
    if (_socket.connected) {
      Logger().i("receiveMessageEvent():");
      try {
        _socket.on(SocketConstant.getEvent(EventType.receiveMessage), (data) {
          Logger().d("receiveMessageEvent() : response -> $data");

          var dataResponse = ChatHistory.fromJson(Map<String, dynamic>.from(data));
          Logger().d("receiveMessageEvent() : response -> $dataResponse");
          if (dataResponse != null) {
            ChatScreenController controller = Get.put(ChatScreenController());

            // change message status read
            Map<String, dynamic> socketParams = {};
            socketParams['userId'] = userDataSingleton.id;
            socketParams['roomId'] = dataResponse.messageStatusOfParticipants[0].roomId;
            messageStatusEvent(socketParams, onError: (message) {
              Logger().e("receiveMessageEvent(): message status $message");
            });
            controller.chatHistoryList.insert(0, dataResponse);
            Logger().d("receiveMessageEvent() : response -> $dataResponse");
          } else {}
        });
      } catch (e) {
        Logger().e("receiveMessageEvent(): On catch $e");
        return null;
      }
    } else {
      Logger().e("receiveMessageEvent(): Unable to get user list");
      return null;
    }
  }

  static Future<dynamic> startTypeEvent() async {
    if (_socket.connected) {
      Logger().i("startTypeEvent():");
      try {
        _socket.on(SocketConstant.getEvent(EventType.startTyping), (data) {
          ChatScreenController controller = Get.put(ChatScreenController());
          controller.isType.value = true;
        });
      } catch (e) {
        Logger().e("startTypeEvent(): On catch $e");
        return null;
      }
    } else {
      Logger().e("startTypeEvent(): Unable to get user list");
      return null;
    }
  }

  static Future<dynamic> stopTypeEvent() async {
    if (_socket.connected) {
      Logger().i("stopTypeEvent():");
      try {
        _socket.on(SocketConstant.getEvent(EventType.stopTyping), (data) {
          ChatScreenController controller = Get.put(ChatScreenController());
          controller.isType.value = false;
        });
      } catch (e) {
        Logger().e("stopTypeEvent(): On catch $e");
        return null;
      }
    } else {
      Logger().e("receiveMessageEvent(): Unable to get user list");
      return null;
    }
  }

  static Future<dynamic> serverMessageStatusEvent() async {
    if (_socket.connected) {
      Logger().i("serverMessageStatusEvent():");
      try {
        _socket.on(SocketConstant.getEvent(EventType.serverMessageStatus), (data) {
          Logger().e("serverMessageStatusEvent(): response -> $data");
        });
      } catch (e) {
        Logger().e("serverMessageStatusEvent(): On catch $e");
        return null;
      }
    } else {
      Logger().e("serverMessageStatusEvent(): Unable to get user list");
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
      connectToServer(onError: () {}, onConnectManager: () {});
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
