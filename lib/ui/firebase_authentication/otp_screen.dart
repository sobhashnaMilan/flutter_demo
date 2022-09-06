import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/auth_controller.dart';
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
    Logger().d( "number -> ${arguments[0]}");
    authController.number.value = arguments[0];
    _verifyNumber();
  }

  /// auth verify PhoneNumber

  Future<void> _verifyNumber() async {
    await auth.verifyPhoneNumber(
      phoneNumber: authController.number.value,
      verificationCompleted: (PhoneAuthCredential credential) async {
        Logger().d( 'verificationCompleted ----------------->');

        /// auto verify PhoneNumber in android only

        await auth
            .signInWithCredential(credential)
            .then((value) => _logIn())
            .catchError((e) => Logger().d( "error -> $e"));
      },
      verificationFailed: (FirebaseAuthException e) {
        Logger().d( 'FirebaseAuthException -> $e');
      },
      codeSent: (String verificationId, int? resendToken) {
        authController.verificationId.value = verificationId;
        authController.resendToken.value = resendToken!;
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        Logger().d( 'Timeout -> $verificationId');
      },
    );
  }

  /// ReSend code

  Future<void> _reSend() async {
    await auth.verifyPhoneNumber(
      phoneNumber: authController.number.value,
      verificationCompleted: (PhoneAuthCredential credential) async {
        Logger().d( 'verificationCompleted -----------> ');

        /// auto verify PhoneNumber in android only

        await auth
            .signInWithCredential(credential)
            .then((value) => _logIn())
            .catchError((e) => Logger().d( "error -> $e"));
      },
      verificationFailed: (FirebaseAuthException e) {
        Logger().d( 'FirebaseAuthException -> $e');
      },
      codeSent: (String verificationId, int? resendToken) {
        authController.verificationId.value = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        Logger().d( 'Timeout -> $verificationId');
      },
    );
  }

  /// check otp [submit otp]

  Future<void> _submitOTP(String smsCode) async {
    Logger().d( "otp -> $smsCode");

    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: authController.verificationId.value, smsCode: smsCode);

    await auth
        .signInWithCredential(credential)
        .then((value) => _logIn())
        .catchError((e) => Logger().d( "error -> $e"));
  }

  /// get current user

  void _logIn() async {
    var user = auth.currentUser;
    Logger().d( "login check -> ${user?.phoneNumber}");
    Get.off(const OtpLogin());
  }

  @override
  Widget build(BuildContext context) {
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
            ElevatedButton(
                onPressed: () {
                  _submitOTP(authController.otpController.text.isNotEmpty
                      ? authController.otpController.text
                      : StringConstant.msgEmptyOtp);
                },
                child: const Text(StringConstant.btnVerify)),
            ElevatedButton(
                onPressed: () {
                  _reSend();
                },
                child: const Text(StringConstant.btnResend))
          ],
        ),
      ),
    );
  }
}
