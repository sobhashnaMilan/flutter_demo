import 'package:json_annotation/json_annotation.dart';

part 'user_list_model.g.dart';

class HomeModelCustom {
  HomeModelCustom({
    this.data,
  });

  List<UserListModel>? data;

  factory HomeModelCustom.fromJson(json) => HomeModelCustom(
        data: List<UserListModel>.from(
            json.map((x) => UserListModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

@JsonSerializable()
class UserListModel {
  UserListModel({
    required this.id,
    required this.name,
    required this.email,
    required this.gender,
    required this.status,
  });

  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "email")
  String email;
  @JsonKey(name: "gender")
  String gender;
  @JsonKey(name: "status")
  String status;

  factory UserListModel.fromJson(dynamic json) => _$UserListModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserListModelToJson(this);
}
