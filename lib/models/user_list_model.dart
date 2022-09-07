class HomeModelCustom {
  HomeModelCustom({
    this.data,
  });

  List<UserListModel>? data;

  factory HomeModelCustom.fromJson(json) => HomeModelCustom(
    data: List<UserListModel>.from(json.map((x) => UserListModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class UserListModel {
  UserListModel({
    this.id,
    this.name,
    this.email,
    this.gender,
    this.status,});

  int? id;
  String? name;
  String? email;
  String? gender;
  String? status;
  List<UserListModel>? list;

  UserListModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    gender = json['gender'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['gender'] = gender;
    map['status'] = status;
    return map;
  }

}