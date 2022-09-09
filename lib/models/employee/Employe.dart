import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'Employe.g.dart';

@JsonSerializable()
class Employee {
  /// The generated code assumes these values exist in JSON.

  @JsonKey(name: "firstName")
  final String fName;
  @JsonKey(name: "lastName")
  final String lName;

  Employee({required this.fName, required this.lName});

  /// Connect the generated [_$PersonFromJson] function to the `fromJson`
  /// factory.
  factory Employee.fromJson(Map<String, dynamic> json) =>
      _$EmployeeFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeToJson(this);
}
