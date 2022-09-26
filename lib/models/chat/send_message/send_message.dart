// To parse this JSON data, do
//
//     final sendMessageResponse = sendMessageResponseFromJson(jsonString);

import 'package:flutter_demo/models/chat/chat_history/chat_history.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

SendMessageResponse sendMessageResponseFromJson(String str) => SendMessageResponse.fromJson(json.decode(str));

String sendMessageResponseToJson(SendMessageResponse data) => json.encode(data.toJson());

class SendMessageResponse {
  SendMessageResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  int status;
  String message;
  ChatHistory data;

  factory SendMessageResponse.fromJson(Map<String, dynamic> json) => SendMessageResponse(
    status: json["status"],
    message: json["message"],
    data: ChatHistory.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class DataMessage {
  DataMessage({
    required this.id,
    required this.content,
    required this.type,
    required this.createdAt,
    required this.updatedAt,
    required this.roomId,
    required this.senderId,
    required this.mediaId,
    required this.messageStatusOfParticipants,
  });

  String id;
  String content;
  String type;
  DateTime createdAt;
  DateTime updatedAt;
  String roomId;
  SenderId senderId;
  String mediaId;
  List<MessageStatusOfParticipant> messageStatusOfParticipants;

  factory DataMessage.fromJson(Map<String, dynamic> json) => DataMessage(
    id: json["_id"] ?? "",
    content: json["content"]?? "",
    type: json["type"]?? "",
    createdAt: DateTime.parse(json["createdAt"])?? DateTime.now(),
    updatedAt: DateTime.parse(json["updatedAt"])?? DateTime.now(),
    roomId: json["room_id"] ?? "",
    senderId: SenderId.fromJson(json["sender_id"]),
    mediaId: json["media_id"] ?? "",
    messageStatusOfParticipants: List<MessageStatusOfParticipant>.from(json["message_status_of_participants"].map((x) => MessageStatusOfParticipant.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "content": content,
    "type": type,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "room_id": roomId,
    "sender_id": senderId.toJson(),
    "media_id": mediaId,
    "message_status_of_participants": List<dynamic>.from(messageStatusOfParticipants.map((x) => x.toJson())),
  };
}

class MessageStatusOfParticipant {
  MessageStatusOfParticipant({
    required this.id,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.historyId,
    required this.senderId,
    required this.receiverId,
    required this.roomId,
  });

  String id;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  String historyId;
  String senderId;
  String receiverId;
  String roomId;

  factory MessageStatusOfParticipant.fromJson(Map<String, dynamic> json) => MessageStatusOfParticipant(
    id: json["_id"],
    status: json["status"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    historyId: json["history_id"],
    senderId: json["sender_id"],
    receiverId: json["receiver_id"],
    roomId: json["room_id"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "status": status,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "history_id": historyId,
    "sender_id": senderId,
    "receiver_id": receiverId,
    "room_id": roomId,
  };
}