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