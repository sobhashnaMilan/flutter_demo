import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter_demo/helper_manager/socket_manager/socket_manager.dart';
import 'package:flutter_demo/singleton/user_data_singleton.dart';
import 'package:flutter_demo/ui/firebase_deep_linking/deep_link_firebase.dart';
import 'package:flutter_demo/util/app_common_stuffs/screen_routes.dart';
import 'package:flutter_demo/util/app_logger.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  bool isLoggedIn = false;

  /// get initState
  @override
  Future<void> onInit() async {
    super.onInit();

    //check user login or not
    initUserData();

    /// app Terminated State
    final PendingDynamicLinkData? initialLink = await FirebaseDynamicLinks.instance.getInitialLink();
    if (initialLink != null) initDynamicLinks(initialLink);

    /// app Background / Foreground State
    FirebaseDynamicLinks.instance.onLink.listen((dynamicLinkData) {
      if (initialLink != null) initDynamicLinks(dynamicLinkData);
      Logger().d("Error :: deepLink Url");
    }).onError((error) {
      Logger().d('onLink error');
      Logger().d(error.message);
    });

    Logger().d("on Init");
  }

  @override
  void onReady() {
    super.onReady();
    Logger().d("on Ready");
  }

  void initUserData() async {
    isLoggedIn = await UserDataSingleton.isLoginVerified();
    if (isLoggedIn) {
      await userDataSingleton.loadUserDetails();
    }
    update();
  }

  void initDynamicLinks(PendingDynamicLinkData initialLink) {
    final Uri deepLink = initialLink.link;
    Logger().d("deepLink" + deepLink.toString());
    Map<String, String> params = deepLink.queryParameters;
    String name = params['name'] ?? '';
    Logger().d('userId $name');
    Get.to(const DeepLinkFirebase(), arguments: name);
  }

  void checkUserLogin() async {
    isLoggedIn = await UserDataSingleton.isLoginVerified();
    if (isLoggedIn) {
      await userDataSingleton.loadUserDetails();
      Map<String, dynamic> socketParams = {};
      socketParams['userId'] = userDataSingleton.id;
      SocketManager.userConnectEvent(socketParams, onConnect: (data) {
        Get.offNamed(ScreenRoutesConstant.chatListScreen);
      });
    } else {
      Get.toNamed(ScreenRoutesConstant.loginScreen);
    }
  }
}
