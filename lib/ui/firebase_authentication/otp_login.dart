import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/ui/style/components/button_component.dart';
import 'package:flutter_demo/ui/style/style.dart';
import 'package:flutter_demo/util/app_common_stuffs/colors.dart';
import 'package:get/get.dart';

import '../../controllers/auth_controller.dart';
import '../../util/app_common_stuffs/string_constants.dart';

class OtpLogin extends StatefulWidget {
  const OtpLogin({Key? key}) : super(key: key);

  @override
  State<OtpLogin> createState() => _OtpLoginState();
}

class _OtpLoginState extends State<OtpLogin> {
  var authController = Get.put(AuthController());
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringConstant.appName),
      ),
      body: Container(
        width: Get.width,
        height: Get.height,
        padding: EdgeInsets.fromLTRB(
          CommonStyle.setDynamicWidth(context: context, value: 0.02),
          CommonStyle.setDynamicHeight(context: context, value: 0.02),
          CommonStyle.setDynamicWidth(context: context, value: 0.02),
          CommonStyle.setDynamicHeight(context: context, value: 0.02),
        ),
        child: Center(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Text(
              "Sign In ${auth.currentUser?.phoneNumber}",
              style: const TextStyle(fontSize: 30),
            ),
            CommonStyle.verticalSpace(context, 0.02),
            ButtonComponent(
                onPressed: () {
                  auth.signOut();
                  Get.back();
                },
                context: context,
                backgroundColor: AppColors.blueColor,
                text: "Sign Out")
          ]),
        ),
      ),
    );
  }
}
