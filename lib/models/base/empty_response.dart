// To parse this JSON data, do
//
//     final emptyResponse = emptyResponseFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

EmptyResponse emptyResponseFromJson(String str) => EmptyResponse.fromJson(json.decode(str));

String emptyResponseToJson(EmptyResponse data) => json.encode(data.toJson());

class EmptyResponse {
  EmptyResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  int status;
  String message;
  EmptyData data;

  factory EmptyResponse.fromJson(Map<String, dynamic> json) => EmptyResponse(
    status: json["status"],
    message: json["message"],
    data: EmptyData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class EmptyData {
  EmptyData();

  factory EmptyData.fromJson(Map<String, dynamic> json) => EmptyData(
  );

  Map<String, dynamic> toJson() => {
  };
}
