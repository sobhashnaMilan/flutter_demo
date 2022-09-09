import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/ui/style/components/button_component.dart';
import 'package:flutter_demo/ui/style/style.dart';
import 'package:flutter_demo/util/app_common_stuffs/colors.dart';
import 'package:flutter_demo/util/responsive_util.dart';
import 'package:get/get.dart';

import '../../controllers/auth/auth_controller.dart';
import '../../util/app_common_stuffs/string_constants.dart';
import '../../util/app_logger.dart';
import 'otp_login.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  var authController = Get.put(AuthController());
  FirebaseAuth auth = FirebaseAuth.instance;

  /// screen data
  var arguments = Get.arguments;
  var isResend = true;

  @override
  void initState() {
    super.initState();
    Logger().d("number -> ${arguments[0]}");
    authController.number.value = arguments[0];
    _verifyNumber();
  }

  /// auth verify PhoneNumber

  Future<void> _verifyNumber() async {
    await auth.verifyPhoneNumber(
      phoneNumber: authController.number.value,
      verificationCompleted: (PhoneAuthCredential credential) async {
        Logger().d('verificationCompleted ----------------->');

        /// auto verify PhoneNumber in android only

        await auth
            .signInWithCredential(credential)
            .then((value) => _logIn())
            .catchError((e) => Logger().d("error -> $e"));
      },
      verificationFailed: (FirebaseAuthException e) {
        Logger().d('FirebaseAuthException -> $e');
      },
      codeSent: (String verificationId, int? resendToken) {
        authController.verificationId.value = verificationId;
        authController.resendToken.value = resendToken!;
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        Logger().d('Timeout -> $verificationId');
      },
    );
  }

  /// ReSend code

  Future<void> _reSend() async {
    await auth.verifyPhoneNumber(
      phoneNumber: authController.number.value,
      verificationCompleted: (PhoneAuthCredential credential) async {
        Logger().d('verificationCompleted -----------> ');

        /// auto verify PhoneNumber in android only

        await auth
            .signInWithCredential(credential)
            .then((value) => _logIn())
            .catchError((e) => Logger().d("error -> $e"));
      },
      verificationFailed: (FirebaseAuthException e) {
        Logger().d('FirebaseAuthException -> $e');
      },
      codeSent: (String verificationId, int? resendToken) {
        authController.verificationId.value = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        Logger().d('Timeout -> $verificationId');
      },
    );
  }

  /// check otp [submit otp]

  Future<void> _submitOTP(String smsCode) async {
    Logger().d("otp -> $smsCode");

    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: authController.verificationId.value, smsCode: smsCode);

    await auth
        .signInWithCredential(credential)
        .then((value) => _logIn())
        .catchError((e) => Logger().d("error -> $e"));
  }

  /// get current user

  void _logIn() async {
    var user = auth.currentUser;
    Logger().d("login check -> ${user?.phoneNumber}");
    Get.off(const OtpLogin());
  }

  @override
  Widget build(BuildContext context) {
    DeviceType deviceType = ResponsiveUtil.isMobile(context)
        ? DeviceType.mobile
        : DeviceType.desktop;

    return Scaffold(
      appBar: AppBar(
        title: const Text(StringConstant.appName),
      ),
      body: Container(
        padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
        child: Column(
          children: [
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: Get.height * 0.1,
                  ),
                  const Text(
                    StringConstant.txtOtpView,
                    style: TextStyle(fontSize: 30),
                  ),
                  SizedBox(
                    height: Get.height * 0.1,
                  ),
                  TextField(
                    controller: authController.otpController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: StringConstant.hintEnterOtp),
                  ),
                  SizedBox(
                    height: Get.height * 0.1,
                  ),
                ],
              ),
            )),
            deviceType == DeviceType.mobile
                ? buildItemMobile()
                : buildItemWeb(),
          ],
        ),
      ),
    );
  }

  Widget buildItemMobile() {
    return Column(
      children: [
        ButtonComponent(
            onPressed: () {
              _submitOTP(authController.otpController.text.isNotEmpty
                  ? authController.otpController.text
                  : StringConstant.msgEmptyOtp);
            },
            context: context,
            backgroundColor: AppColors.blueColor,
            text: StringConstant.btnVerify),
        CommonStyle.verticalSpace(context, 0.025),
        ButtonComponent(
          onPressed: () {
            _reSend();
          },
          backgroundColor: AppColors.blueColor,
          context: context,
          text: StringConstant.btnResend,
        )
      ],
    );
  }

  Widget buildItemWeb() {
    return Row(
      children: [
        Expanded(
          child: ButtonComponent(
              onPressed: () {
                _submitOTP(authController.otpController.text.isNotEmpty
                    ? authController.otpController.text
                    : StringConstant.msgEmptyOtp);
              },
              context: context,
              backgroundColor: AppColors.blueColor,
              text: StringConstant.btnVerify),
        ),
        CommonStyle.horizontalSpace(context, 0.025),
        Expanded(
          child: ButtonComponent(
            onPressed: () {
              _reSend();
            },
            backgroundColor: AppColors.blueColor,
            context: context,
            text: StringConstant.btnResend,
          ),
        )
      ],
    );
  }
}
