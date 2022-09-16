import 'package:flutter/material.dart';
import 'package:flutter_demo/helper_manager/network_manager/api_constant.dart';
import 'package:flutter_demo/helper_manager/network_manager/remote_services.dart';
import 'package:flutter_demo/models/auth/user_model.dart';
import 'package:flutter_demo/models/base/response_model.dart';
import 'package:flutter_demo/singleton/user_data_singleton.dart';
import 'package:get/get.dart';

class LoginController<T> extends GetxController {
  var isPasswordVisible = false.obs, isLoggingIn = false.obs;
  TextEditingController emailTextController = TextEditingController(), passwordTextController = TextEditingController();
  RxBool isTermsRead = false.obs;

  updatePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
    update();
  }

  updateLoggingFlag() {
    isLoggingIn.value = !isLoggingIn.value;
    update();
  }

  loginUserAPICall({required dynamic requestParams, required onError}) async {
    updateLoggingFlag();

    // ResponseModel<UserModel> loginAPIResponse = await sharedServiceManager.createPostRequest(endPoint: APIConstants.userLoginEndPoint, requestParams: requestParams);
    ResponseModel<UserModel> loginAPIResponse = await sharedServiceManager.createPostRequest(typeOfEndPoint: ApiType.login, params: requestParams);

    updateLoggingFlag();

    if (loginAPIResponse.status == ApiConstant.statusCodeSuccess) {
      await userDataSingleton.updateValue(
        loginAPIResponse.data?.toJson() ?? <String, dynamic>{},
      );
      await UserDataSingleton.saveIsLoginVerified();
      return true;
    } else {
      onError(loginAPIResponse.message);
      return false;
    }
  }

  @override
  void dispose() {
    emailTextController.dispose();
    passwordTextController.dispose();
    super.dispose();
  }
}
