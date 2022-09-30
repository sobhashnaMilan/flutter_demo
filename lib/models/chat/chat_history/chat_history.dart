// To parse this JSON data, do
//
//     final chatHistoryResponse = chatHistoryResponseFromJson(jsonString);
import 'dart:convert';

ChatHistoryResponse chatHistoryResponseFromJson(String str) => ChatHistoryResponse.fromJson(json.decode(str));

String chatHistoryResponseToJson(ChatHistoryResponse data) => json.encode(data.toJson());

class ChatHistoryResponse {
  ChatHistoryResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  int status;
  String message;
  List<ChatHistory> data;

  factory ChatHistoryResponse.fromJson(Map<String, dynamic> json) => ChatHistoryResponse(
        status: json["status"],
        message: json["message"],
        data: List<ChatHistory>.from(json["data"].map((x) => ChatHistory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class ChatHistory {
  ChatHistory({
    required this.messageStatusOfParticipants,
    required this.id,
    required this.content,
    required this.type,
    required this.createdAt,
    required this.updatedAt,
    required this.roomId,
    required this.senderId,
    required this.mediaId,
  });

  List<MessageStatusOfParticipant> messageStatusOfParticipants;
  String id;
  String content;
  String type;
  DateTime createdAt;
  DateTime updatedAt;
  String roomId;
  SenderId senderId;
  MediaId? mediaId;

  factory ChatHistory.fromJson(Map<String, dynamic> json) => ChatHistory(
        messageStatusOfParticipants: List<MessageStatusOfParticipant>.from(json["message_status_of_participants"].map((x) => MessageStatusOfParticipant.fromJson(x))),
        id: json["_id"] ?? "",
        content: json["content"] ?? "",
        type: json["type"] ?? "",
        createdAt: DateTime.parse(json["createdAt"]) ?? DateTime.now(),
        updatedAt: DateTime.parse(json["updatedAt"]) ?? DateTime.now(),
        roomId: json["room_id"] ?? "",
        senderId: SenderId.fromJson(json["sender_id"]),
        mediaId: json["media_id"] == null ? null : MediaId.fromJson(json["media_id"]),
      );

  Map<String, dynamic> toJson() => {
        "message_status_of_participants": List<dynamic>.from(messageStatusOfParticipants.map((x) => x.toJson())),
        "_id": id,
        "content": content,
        "type": type,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "room_id": roomId,
        "sender_id": senderId.toJson(),
        "media_id": mediaId,
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
        id: json["_id"] ?? "",
        status: json["status"] ?? "",
        createdAt: DateTime.parse(json["createdAt"]) ?? DateTime.now(),
        updatedAt: DateTime.parse(json["updatedAt"]) ?? DateTime.now(),
        historyId: json["history_id"] ?? "",
        senderId: json["sender_id"] ?? "",
        receiverId: json["receiver_id"] ?? "",
        roomId: json["room_id"] ?? "",
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

class MediaId {
  MediaId({
    required this.id,
    required this.media,
    required this.type,
    required this.createdAt,
    required this.updatedAt,
  });

  String id;
  String media;
  String type;
  DateTime createdAt;
  DateTime updatedAt;

  factory MediaId.fromJson(Map<String, dynamic> json) => MediaId(
    id: json["_id"],
    media: json["media"],
    type: json["type"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "media": media,
    "type": type,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}

class SenderId {
  SenderId({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.bio,
    this.countryCode,
    this.userSignUpLevel,
    this.profilePicture,
    this.birthday,
    this.skillPoints,
    this.totalAttended,
    this.totalOrganized,
    this.facebookId,
    this.googleId,
    this.appleId,
    this.subscriptionEndDate,
    this.resetToken,
    this.isSubscribed,
    this.isFreeUser,
    this.selectedSportIds,
    this.finishSteps,
    this.socketIds,
    this.location,
    this.isActive,
    this.isDeleted,
    this.referralCode,
    this.referralBy,
    this.lastUsedAt,
    this.selectedSportId,
    this.accessToken,
  });

  String? id;
  String? email;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? bio;
  String? countryCode;
  int? userSignUpLevel;
  String? profilePicture;
  String? birthday;
  int? skillPoints;
  int? totalAttended;
  int? totalOrganized;
  String? facebookId;
  String? googleId;
  String? appleId;
  String? subscriptionEndDate;
  String? resetToken;
  bool? isSubscribed;
  bool? isFreeUser;
  List<String>? selectedSportIds;
  bool? finishSteps;
  List<String>? socketIds;
  Location? location;
  bool? isActive;
  bool? isDeleted;
  String? referralCode;
  String? referralBy;
  DateTime? lastUsedAt;
  String? selectedSportId;
  String? accessToken;

  factory SenderId.fromJson(Map<String, dynamic> json) => SenderId(
        id: json["_id"],
        email: json["email"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        phoneNumber: json["phoneNumber"],
        bio: json["bio"] ?? "",
        countryCode: json["countryCode"],
        userSignUpLevel: json["userSignUpLevel"],
        profilePicture: json["profilePicture"],
        birthday: json["birthday"],
        skillPoints: json["skillPoints"],
        totalAttended: json["totalAttended"],
        totalOrganized: json["totalOrganized"],
        facebookId: json["facebookId"],
        googleId: json["googleId"],
        appleId: json["appleId"],
        subscriptionEndDate: json["subscriptionEndDate"],
        resetToken: json["resetToken"],
        isSubscribed: json["isSubscribed"],
        isFreeUser: json["isFreeUser"],
        selectedSportIds: json["selectedSportIds"] != null ? List<String>.from(json["selectedSportIds"].map((x) => x)) : [],
        finishSteps: json["finishSteps"],
        socketIds: List<String>.from(json["socketIds"].map((x) => x)),
        location: json["location"] != null && json["location"] != 0 ? Location.fromJson(json["location"]) : null,
        isActive: json["isActive"],
        isDeleted: json["isDeleted"],
        referralCode: json["referralCode"],
        referralBy: json["referralBy"],
        lastUsedAt: DateTime.parse(json["lastUsedAt"]),
        selectedSportId: json["selectedSportId"] ?? "",
        accessToken: json["accessToken"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "email": email,
        "firstName": firstName,
        "lastName": lastName,
        "phoneNumber": phoneNumber,
        "bio": bio,
        "countryCode": countryCode,
        "userSignUpLevel": userSignUpLevel,
        "profilePicture": profilePicture,
        "birthday": birthday,
        "skillPoints": skillPoints,
        "totalAttended": totalAttended,
        "totalOrganized": totalOrganized,
        "facebookId": facebookId,
        "googleId": googleId,
        "appleId": appleId,
        "subscriptionEndDate": subscriptionEndDate,
        "resetToken": resetToken,
        "isSubscribed": isSubscribed,
        "isFreeUser": isFreeUser,
        "selectedSportIds": List<String>.from(selectedSportIds!.map((x) => x)),
        "finishSteps": finishSteps,
        "socketIds": List<String>.from(socketIds!.map((x) => x)),
        "location": location!.toJson(),
        "isActive": isActive,
        "isDeleted": isDeleted,
        "referralCode": referralCode,
        "referralBy": referralBy,
        "lastUsedAt": lastUsedAt!.toIso8601String(),
        "selectedSportId": selectedSportId,
        "accessToken": accessToken,
      };
}

class Location {
  Location({
    this.type,
    this.index,
    this.coordinates,
  });

  String? type;
  String? index;
  List<double>? coordinates;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        type: json["type"] ?? "",
        index: json["index"] ?? "",
        coordinates: json["coordinates"] == null ? [] : List<double>.from(json["coordinates"].map((x) => x.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "index": index,
        "coordinates": List<dynamic>.from(coordinates!.map((x) => x)),
      };
}
