// To parse this JSON data, do
//
//     final chatListResponse = chatListResponseFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ChatListResponse chatListResponseFromJson(String str) => ChatListResponse.fromJson(json.decode(str));

String chatListResponseToJson(ChatListResponse data) => json.encode(data.toJson());

class ChatListResponse {
  ChatListResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  int status;
  String message;
  List<ChatUser> data;

  factory ChatListResponse.fromJson(Map<String, dynamic> json) => ChatListResponse(
        status: json["status"],
        message: json["message"],
        data: List<ChatUser>.from(json["data"].map((x) => ChatUser.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}
class CustomChatListResponse {
  CustomChatListResponse({
    required this.data,
  });

  List<ChatUser> data;

  factory CustomChatListResponse.fromJson(Map<String, dynamic> json) => CustomChatListResponse(
        data: List<ChatUser>.from(json['data'].map((x) => ChatUser.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class ChatUser {
  ChatUser({
    required this.history,
    required this.participants,
    required this.id,
    required this.isGroup,
    required this.lastMessageAt,
    required this.isDelete,
    required this.createdAt,
    required this.updatedAt,
    required this.authorId,
    required this.groupId,
    required this.count,
  });

  List<History> history;
  List<Participant> participants;
  String id;
  int isGroup;
  DateTime lastMessageAt;
  bool isDelete;
  DateTime createdAt;
  DateTime updatedAt;
  String authorId;
  dynamic groupId;
  int count;

  factory ChatUser.fromJson(Map<String, dynamic> json) => ChatUser(
        history: List<History>.from(json["history"].map((x) => History.fromJson(x))),
        participants: List<Participant>.from(json["participants"].map((x) => Participant.fromJson(x))),
        id: json["_id"],
        isGroup: json["is_group"],
        lastMessageAt: DateTime.parse(json["last_message_at"] ?? DateTime.now().toString()),
        isDelete: json["isDelete"],
        createdAt: DateTime.parse(json["createdAt"] ?? DateTime.now().toString()),
        updatedAt: DateTime.parse(json["updatedAt"] ?? DateTime.now().toString()),
        authorId: json["author_id"],
        groupId: json["group_id"],
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "history": List<dynamic>.from(history.map((x) => x.toJson())),
        "participants": List<dynamic>.from(participants.map((x) => x.toJson())),
        "_id": id,
        "is_group": isGroup,
        "last_message_at": lastMessageAt == null ? null : lastMessageAt.toIso8601String(),
        "isDelete": isDelete,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "author_id": authorId,
        "group_id": groupId,
        "count": count,
      };
}

class History {
  History({
    required this.id,
    required this.content,
    required this.type,
    required this.createdAt,
    required this.updatedAt,
    required this.roomId,
    required this.senderId,
    required this.mediaId,
  });

  String id;
  String content;
  String type;
  DateTime createdAt;
  DateTime updatedAt;
  String roomId;
  String senderId;
  dynamic mediaId;

  factory History.fromJson(Map<String, dynamic> json) => History(
        id: json["_id"],
        content: json["content"],
        type: json["type"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        roomId: json["room_id"],
        senderId: json["sender_id"],
        mediaId: json["media_id"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "content": content,
        "type": type,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "room_id": roomId,
        "sender_id": senderId,
        "media_id": mediaId,
      };
}

class Participant {
  Participant({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.roomId,
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.profilePicture,
  });

  String id;
  DateTime createdAt;
  DateTime updatedAt;
  String roomId;
  String userId;
  String firstName;
  String lastName;
  String profilePicture;

  factory Participant.fromJson(Map<String, dynamic> json) => Participant(
        id: json["_id"] ?? "",
        createdAt: DateTime.parse(json["createdAt"])  ?? DateTime.now(),
        updatedAt: DateTime.parse(json["updatedAt"]) ?? DateTime.now(),
        roomId: json["room_id"] ?? "",
        userId: json["user_id"] ?? "",
        firstName: json["firstName"] ?? "unknown",
        lastName: json["lastName"] ?? "",
        profilePicture: json["profilePicture"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "room_id": roomId,
        "user_id": userId,
        "firstName": firstName,
        "lastName": lastName,
        "profilePicture": profilePicture,
      };
}
