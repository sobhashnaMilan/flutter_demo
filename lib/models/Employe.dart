import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Emplpye {
  /// The generated code assumes these values exist in JSON.
  final String firstName, lastName;

  Emplpye({required this.firstName, required this.lastName});

  /// Connect the generated [_$PersonFromJson] function to the `fromJson`
  /// factory.
  factory Emplpye.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$PersonToJson(this);
}

