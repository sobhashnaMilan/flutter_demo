class AddUser {
  AddUser({
    required this.name,
    required this.job,
    required this.id,
    required this.createdAt,
  });

  String name;
  String job;
  String id;
  DateTime createdAt;

  factory AddUser.fromJson(Map<String, dynamic> json) => AddUser(
        name: json["name"] ?? "",
        job: json["job"] ?? "",
        id: json["id"] ?? "",
        createdAt: DateTime.parse(json["createdAt"] ?? ""),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "job": job,
        "id": id,
        "createdAt": createdAt.toIso8601String(),
      };
}
