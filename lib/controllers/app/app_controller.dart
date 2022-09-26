import 'package:flutter_demo/helper_manager/socket_manager/socket_manager.dart';
import 'package:flutter_demo/util/app_common_stuffs/screen_routes.dart';
import 'package:flutter_demo/util/snackbar_util.dart';

import '../../singleton/user_data_singleton.dart';
import 'package:get/get.dart';

class AppController extends GetxController {
  bool isLoggedIn = false;

  void initUserData() async {
    isLoggedIn = await UserDataSingleton.isLoginVerified();
    if (isLoggedIn) {
      await userDataSingleton.loadUserDetails();
    }
    SocketManager.connectToServer(
        onConnectManager: (message) {},
        onError: (message) {});
    update();
  }

  @override
  void onInit() {
    initUserData();
    super.onInit();
  }
}
