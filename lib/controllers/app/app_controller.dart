import '../../singleton/user_data_singleton.dart';
import 'package:get/get.dart';

class AppController extends GetxController {
  bool isLoggedIn = false;

  void initUserData() async {
    isLoggedIn = await UserDataSingleton.isLoginVerified();
    if (isLoggedIn) {
      await userDataSingleton.loadUserDetails();
    }
    update();
  }

  @override
  void onInit() {
    initUserData();
    super.onInit();
  }
}
