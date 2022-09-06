import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_demo/util/import_export_util.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {

  /// variable
  var otp = "".obs;
  var verificationId = "".obs;
  var resendToken = 0.obs;
  var number = "".obs;
  var deepLinkParameters = "".obs;

  var textController = TextEditingController();
  var otpController = TextEditingController();

  late PhoneAuthCredential phoneAuthCredential;
  late AuthCredential authCredential;
  late UserCredential userCredential;


  RxBool validation(BuildContext context) {
    if (textController.text.isEmpty) {
      SnackbarUtil.showSnackbar(context: context, type: SnackType.error, message: StringConstant.msgEmptyNumber);
      return false.obs;
    } else if (textController.text.length != 10) {
      SnackbarUtil.showSnackbar(context: context, type: SnackType.error, message: StringConstant.msgValidNumber);
      return false.obs;
    } else {
      return true.obs;
    }
  }
}
