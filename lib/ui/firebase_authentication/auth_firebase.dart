import 'package:flutter/material.dart';
import 'package:flutter_demo/util/app_common_stuffs/string_constants.dart';
import 'package:get/get.dart';

import '../../controllers/auth_controller.dart';
import '../../util/responsive_util.dart';
import '../style/components/app_bar_component.dart';
import '../style/text_styles.dart';
import 'otp_screen.dart';

class FireBaseAuth extends StatefulWidget {
  const FireBaseAuth({Key? key}) : super(key: key);

  @override
  State<FireBaseAuth> createState() => _FireBaseAuthState();
}

class _FireBaseAuthState extends State<FireBaseAuth> {
  var authController = Get.put(AuthController());

  @override
  void initState() {
    super.initState();
    authController.textController.text = "1234567890";
  }

  @override
  Widget build(BuildContext context) {
    DeviceType deviceType = ResponsiveUtil.isMobile(context)
        ? DeviceType.mobile
        : DeviceType.desktop;

    return Scaffold(
      appBar: AppBarComponent.buildAppbar(
        titleWidget: Text(
          "Firebase Auth".tr,
          style: deviceType == DeviceType.mobile
              ? white100Medium24TextStyle(context)
              : white100Medium10TextStyle(context),
        ),
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
                    StringConstant.txtEnterNumber,
                    style: TextStyle(fontSize: 30),
                  ),
                  SizedBox(
                    height: Get.height * 0.1,
                  ),
                  TextField(
                    controller: authController.textController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: StringConstant.hintEnterNumber),
                  ),
                  SizedBox(
                    height: Get.height * 0.1,
                  ),
                ],
              ),
            )),
            ElevatedButton(
                onPressed: () {
                  validation();
                },
                child: const Text(StringConstant.btnOk))
          ],
        ),
      ),
    );
  }

  /// check validations

  void validation() {
    if (authController.validation(context).value) {
      var number = "+91" + authController.textController.text;
      Get.to(const OtpScreen(), arguments: [number]);
    }
  }
}
