import '../../models/home_model.dart';
import '../../models/user_model.dart';

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
    if (T == UserModel) {
      return UserModel.fromJson(json) as T;
    } else if (T == HomeModel) {
      return HomeModel.fromJson(json) as T;
    } else {
      throw Exception('Unknown class');
    }
  }
}
