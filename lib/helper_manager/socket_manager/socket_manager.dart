
import 'package:flutter_demo/helper_manager/network_manager/api_constant.dart';
import 'package:flutter_demo/util/app_logger.dart';
import 'package:socket_io_client/socket_io_client.dart';

class SocketManager {
  static late final Socket _socket;

  static final String _serverUrl = ApiConstant.baseDomainSocket;

  static final _optionBuilder = OptionBuilder().setTransports(['websocket']).disableAutoConnect().build();

  static void connectToServer() {
    try {
      Logger().i("Connecting to $_serverUrl...");

      _socket = io(_serverUrl, _optionBuilder).connect();

      _socket.onConnect((data) {
        Logger().i("onConnect(): Connected to $_serverUrl");

        // _socket.emit('userConnect');
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
      connectToServer();
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
