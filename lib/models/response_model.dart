import 'package:flutter_demo/models/add_user_model.dart';
import 'package:flutter_demo/models/user_list_model.dart';

class ResponseModel<T> {
  ResponseModel({required this.status, required this.message, this.data});

  late int status;
  late String message;
  T? data;

  ResponseModel.fromJson(Map<String, dynamic> json, int? statusCode) {
    status = json['status'];
    message = json['message'];
    data = (json['data'] == null || json["data"].length == 0)
        ? null
        : _handleClasses(
            json['data'],
          );
  }

  T _handleClasses(json) {
    if (T == HomeModelCustom) {
      return HomeModelCustom.fromJson(json) as T;
    } else if (T == AddUser) {
      return AddUser.fromJson(json) as T;
    } else {
      throw Exception('Unknown class');
    }
  }
}
