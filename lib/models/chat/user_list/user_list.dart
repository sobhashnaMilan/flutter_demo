// To parse this JSON data, do
//
//     final userListResponse = userListResponseFromJson(jsonString);
import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'user_list.g.dart';

UserListResponse userListResponseFromJson(String str) => UserListResponse.fromJson(json.decode(str));

String userListResponseToJson(UserListResponse data) => json.encode(data.toJson());

@JsonSerializable()
class UserListResponse {
  UserListResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  @JsonKey(name: "status")
  int status;
  @JsonKey(name: "message")
  String message;
  @JsonKey(name: "data")
  List<ChatUser> data;

  factory UserListResponse.fromJson(Map<String, dynamic> json) => _$UserListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserListResponseToJson(this);
}

class ChatUser {
  ChatUser({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.profilePicture,
  });

  String id;
  String email;
  String firstName;
  String lastName;
  String phoneNumber;
  String profilePicture;

  factory ChatUser.fromJson(Map<String, dynamic> json) => ChatUser(
        id: json['id'] ?? "",
        email: json['email'] ?? "",
        firstName: json['firstName'] ?? "",
        lastName: json['lastName'] ?? "",
        phoneNumber: json['phoneNumber'] ?? "",
        profilePicture: json['profilePicture'] ?? "",
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'email': email,
        'firstName': firstName,
        'lastName': lastName,
        'phoneNumber': phoneNumber,
        'profilePicture': profilePicture,
      };
}
