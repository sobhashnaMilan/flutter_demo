// To parse this JSON data, do
//
//     final typeResponse = typeResponseFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

TypeResponse typeResponseFromJson(String str) => TypeResponse.fromJson(json.decode(str));

String typeResponseToJson(TypeResponse data) => json.encode(data.toJson());

class TypeResponse {
  TypeResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  int status;
  String message;
  UserType data;

  factory TypeResponse.fromJson(Map<String, dynamic> json) => TypeResponse(
    status: json["status"],
    message: json["message"],
    data: UserType.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class UserType {
  UserType({
    required this.userId,
    required this.typing,
    required this.roomId,
  });

  String userId;
  String typing;
  String roomId;

  factory UserType.fromJson(Map<String, dynamic> json) => UserType(
    userId: json["user_id"],
    typing: json["typing"],
    roomId: json["roomId"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "typing": typing,
    "roomId": roomId,
  };
}
