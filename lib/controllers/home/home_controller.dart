import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter_demo/ui/firebase_deep_linking/deep_link_firebase.dart';
import 'package:flutter_demo/util/app_logger.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  /// get initState
  @override
  Future<void> onInit() async {
    super.onInit();

    /// app Terminated State
    final PendingDynamicLinkData? initialLink =
        await FirebaseDynamicLinks.instance.getInitialLink();
    if (initialLink != null) initDynamicLinks(initialLink);

    /// app Background / Foreground State
    FirebaseDynamicLinks.instance.onLink.listen((dynamicLinkData) {
      if (initialLink != null) initDynamicLinks(dynamicLinkData);
      Logger().d("Error :: deepLink Url");
    }).onError((error) {
      Logger().d('onLink error');
      Logger().d(error.message);
    });

    Logger().d( "on Init");
  }

  @override
  void onReady() {
    super.onReady();
    Logger().d( "on Ready");
  }

  void initDynamicLinks(PendingDynamicLinkData initialLink) {
    final Uri deepLink = initialLink.link;
    Logger().d( "deepLink" + deepLink.toString());
    Map<String, String> params = deepLink.queryParameters;
    String name = params['name'] ?? '';
    Logger().d( 'userId $name');
    Get.to(const DeepLinkFirebase(), arguments: name);
  }

}
