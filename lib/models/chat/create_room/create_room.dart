// To parse this JSON data, do
//
//     final createRoomResponse = createRoomResponseFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

CreateRoomResponse createRoomResponseFromJson(String str) => CreateRoomResponse.fromJson(json.decode(str));

String createRoomResponseToJson(CreateRoomResponse data) => json.encode(data.toJson());

class CreateRoomResponse {
  CreateRoomResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  int status;
  String message;
  Room data;

  factory CreateRoomResponse.fromJson(Map<String, dynamic> json) => CreateRoomResponse(
    status: json["status"],
    message: json["message"],
    data: Room.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class Room {
  Room({
    required this.roomId,
  });

  String? roomId;

  factory Room.fromJson(Map<String, dynamic> json) => Room(
    roomId: json["roomId"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "roomId": roomId,
  };
}
