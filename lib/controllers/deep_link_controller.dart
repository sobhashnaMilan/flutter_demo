import 'package:get/get.dart';

import '../util/app_common_stuffs/string_constants.dart';

class DeepLinkController extends GetxController {
  /// variable
  var deepLinkParameters = "".obs;
  var deepLinkQueryValue = "Params Value".obs;
  var linkMessage = "".obs;

  var message = StringConstant();

  @override
  void onInit() {
    var argumentsUri = Get.arguments;
    if (argumentsUri != null) {
      deepLinkQueryValue.value = argumentsUri;
    }
    else{
      deepLinkQueryValue.value = "Query value";
    }
    super.onInit();
  }
}
