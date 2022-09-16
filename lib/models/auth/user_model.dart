class UserModel {
  UserModel({
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

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
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
        selectedSportIds:
            json["selectedSportIds"] != null ? List<String>.from(json["selectedSportIds"].map((x) => x)) : [],
        finishSteps: json["finishSteps"],
        socketIds: List<String>.from(json["socketIds"].map((x) => x)),
        location: Location.fromJson(json["location"]),
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
        type: json["type"],
        index: json["index"],
        coordinates: List<double>.from(json["coordinates"].map((x) => x.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "index": index,
        "coordinates": List<dynamic>.from(coordinates!.map((x) => x)),
      };
}
