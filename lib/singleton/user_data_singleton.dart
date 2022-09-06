import 'dart:convert';

import '../../util/app_common_stuffs/preference_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

var userDataSingleton = UserDataSingleton.singleton;

class UserDataSingleton {
  UserDataSingleton._internal();

  static final UserDataSingleton singleton = UserDataSingleton._internal();

  factory UserDataSingleton() {
    return singleton;
  }

  String id = '';
  String email = '';
  String firstName = '';
  String lastName = '';
  String phoneNumber = '';
  String bio = '';
  String countryCode = '';
  int userSignUpLevel = 0;
  String profilePicture = '';
  String birthday = '';
  int skillPoints = 0;
  int totalAttended = 0;
  int totalOrganized = 0;
  String facebookId = '';
  String googleId = '';
  String appleId = '';
  String subscriptionEndDate = '';
  String resetToken = '';
  bool isSubscribed = false;
  bool isFreeUser = false;
  List<String> selectedSportIds = [];
  bool finishSteps = false;
  List<String> socketIds = [];
  Location location = Location();
  bool isActive = false;
  bool isDeleted = false;
  String referralCode = '';
  String referralBy = '';
  DateTime lastUsedAt = DateTime.now();
  String selectedSportId = '';
  String accessToken = '';

  Future<void> updateValue(Map<String, dynamic> json) async {
    if (json.isNotEmpty) {
      id = json['_id'] ?? "";
      email = json["email"] ?? "";
      firstName = json["firstName"] ?? "";
      lastName = json["lastName"] ?? "";
      phoneNumber = json["phoneNumber"] ?? "";
      bio = json["bio"] ?? "";
      countryCode = json["countryCode"] ?? "";
      userSignUpLevel = json["userSignUpLevel"] ?? 0;
      profilePicture = json["profilePicture"] ?? "";
      birthday = json["birthday"] ?? "";
      skillPoints = json["skillPoints"] ?? 0;
      totalAttended = json["totalAttended"] ?? 0;
      totalOrganized = json["totalOrganized"] ?? 0;
      facebookId = json["facebookId"] ?? "";
      googleId = json["googleId"] ?? "";
      appleId = json["appleId"] ?? "";
      subscriptionEndDate = json["subscriptionEndDate"] ?? "";
      resetToken = json["resetToken"] ?? "";
      isSubscribed = json["isSubscribed"] ?? false;
      isFreeUser = json["isFreeUser"] ?? false;
      selectedSportIds = List<String>.from(
        json["selectedSportIds"] ?? [].map((x) => x),
      );
      finishSteps = json["finishSteps"] ?? false;
      socketIds = List<String>.from(json["socketIds"] ?? [].map((x) => x));
      location = json['location'] != null
          ? Location.fromJson(json["location"])
          : Location();
      isActive = json["isActive"] ?? false;
      isDeleted = json["isDeleted"] ?? false;
      referralCode = json["referralCode"] ?? "";
      referralBy = json["referralBy"] ?? "";
      lastUsedAt = DateTime.parse(json["lastUsedAt"]);
      selectedSportId = json["selectedSportId"] ?? "";
      accessToken = json["accessToken"] ?? "";

      saveUserDetails();
    }
  }

  Future<void> saveUserDetails() async {
    final dictOfUserDetails = toJson();
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(
        PreferenceKeys.prefKeyUserData, json.encode(dictOfUserDetails));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> dict = <String, dynamic>{};
    dict['_id'] = id;
    dict['email'] = email;
    dict['firstName'] = firstName;
    dict['lastName'] = lastName;
    dict['phoneNumber'] = phoneNumber;
    dict['bio'] = bio;
    dict['countryCode'] = countryCode;
    dict['userSignUpLevel'] = userSignUpLevel;
    dict['profilePicture'] = profilePicture;
    dict['birthday'] = birthday;
    dict['skillPoints'] = skillPoints;
    dict['totalAttended'] = totalAttended;
    dict['totalOrganized'] = totalOrganized;
    dict['facebookId'] = facebookId;
    dict['googleId'] = googleId;
    dict['appleId'] = appleId;
    dict['subscriptionEndDate'] = subscriptionEndDate;
    dict['resetToken'] = resetToken;
    dict['isSubscribed'] = isSubscribed;
    dict['isFreeUser'] = isFreeUser;
    dict['selectedSportIds'] = List<String>.from(
      selectedSportIds.map((x) => x),
    );
    dict['finishSteps'] = finishSteps;
    dict['socketIds'] = List<String>.from(
      socketIds.map((x) => x),
    );
    dict['location'] = location.toJson();
    dict['isActive'] = isActive;
    dict['isDeleted'] = isDeleted;
    dict['referralCode'] = referralCode;
    dict['referralBy'] = referralBy;
    dict['lastUsedAt'] = lastUsedAt.toIso8601String();
    dict['selectedSportId'] = selectedSportId;
    dict['accessToken'] = accessToken;

    return dict;
  }

  static Future<void> saveIsLoginVerified() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool(PreferenceKeys.prefKeyIsLoginVerified, true);
  }

  static Future<bool> isLoginVerified() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool(PreferenceKeys.prefKeyIsLoginVerified) ?? false;
  }

  Future<void> clearPreference() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.clear();
  }

  Future<void> loadUserDetails() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String jsonStoredUserDetails = preferences.getString(PreferenceKeys.prefKeyUserData) ?? "";
    if (jsonStoredUserDetails.isNotEmpty) {
      Map<String, dynamic> jsonValue = json.decode(jsonStoredUserDetails);
      await updateValue(jsonValue);
    }
  }
}

class Location {
  Location({
    this.type = '',
    this.index = '',
    this.coordinates = const [],
  });

  String type = '';
  String index = '';
  List<double> coordinates = <double>[];

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        type: json["type"],
        index: json["index"],
        coordinates: List<double>.from(
          json["coordinates"].map(
            (x) => x.toDouble(),
          ),
        ),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "index": index,
        "coordinates": List<double>.from(coordinates.map((x) => x)),
      };
}
