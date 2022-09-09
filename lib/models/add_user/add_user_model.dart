import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'add_user_model.g.dart';

@JsonSerializable()
class AddUser extends Equatable{
  const AddUser({
    required this.name,
    required this.job,
    required this.id,
    required this.createdAt,
  });

  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "job")
  final String job;
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "createdAt")
  final DateTime createdAt;

  factory AddUser.fromJson(Map<String, dynamic> json) =>
      _$AddUserFromJson(json);

  // (
  //     name: json["name"] ?? "",
  //     job: json["job"] ?? "",
  //     id: json["id"] ?? "",
  //     createdAt: DateTime.parse(json["createdAt"] ?? ""),
  //   );

  Map<String, dynamic> toJson() => _$AddUserToJson(this);

  @override
  List<Object?> get props => throw UnimplementedError();
// {
//   "name": name,
//   "job": job,
//   "id": id,
//   "createdAt": createdAt.toIso8601String(),
// };
}
