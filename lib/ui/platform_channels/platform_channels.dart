import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo/ui/style/components/button_component.dart';
import 'package:flutter_demo/ui/style/components/outline_button_component.dart';
import 'package:flutter_demo/ui/style/style.dart';
import 'package:flutter_demo/util/app_common_stuffs/colors.dart';
import 'package:flutter_demo/util/app_common_stuffs/string_constants.dart';
import 'package:get/get.dart';

import '../../controllers/platform_channels/PlatformChannelsController.dart';
import '../../util/app_logger.dart';
import '../../util/responsive_util.dart';
import '../style/components/app_bar_component.dart';
import '../style/text_styles.dart';

class PlatformChannelsScreen extends StatefulWidget {
  const PlatformChannelsScreen({Key? key}) : super(key: key);

  @override
  State<PlatformChannelsScreen> createState() => _PlatformChannelsScreenState();
}

class _PlatformChannelsScreenState extends State<PlatformChannelsScreen> {
  PlatformChannelsController controller =
      Get.find<PlatformChannelsController>();

  @override
  void initState() {
    super.initState();
    Logger().d(controller.name.value);
  }

  @override
  Widget build(BuildContext context) {
    DeviceType deviceType = ResponsiveUtil.isMobile(context)
        ? DeviceType.mobile
        : DeviceType.desktop;

    return Scaffold(
      appBar: AppBarComponent.buildAppbar(
        titleWidget: Text(
          StringConstant.btnPlatformChannels.tr,
          style: deviceType == DeviceType.mobile
              ? white100Medium24TextStyle(context)
              : white100Medium10TextStyle(context),
        ),
      ),
      body: Container(
        width: Get.width,
        height: Get.height,
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      onChanged: controller.textField,
                      decoration: const InputDecoration(
                        labelText: 'Enter Value',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: Obx(
                          () => Text(controller.namePlatformChannels.value)),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              child: Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: OutlineButtonComponent(
                          onPressed: printLog,
                          context: context,
                          text: 'Print Log',
                          backgroundColor: AppColors.blueColor,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: OutlineButtonComponent(
                          onPressed: openDialog,
                          context: context,
                          text: 'Show Dialog',
                          backgroundColor: AppColors.blueColor,
                        ),
                      ),
                    ],
                  ),
                  CommonStyle.verticalSpace(context, 0.01),
                  SizedBox(
                    width: double.infinity,
                    child: ButtonComponent(
                      onPressed: () => getData(controller.textField.value),
                      context: context,
                      text: 'Get Data',
                      backgroundColor: AppColors.blueColor,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> getData(String value) async {
    try {
      final String result =
          await controller.platform.invokeMethod('getValue', {"text": value});
      controller.namePlatformChannels.value = result;
      Logger().d(result);
    } on PlatformException catch (e) {
      controller.namePlatformChannels.value =
          "Failed to Invoke: '${e.message}'.";
    }
  }

  void printLog() async {
    try {
      final String result = await controller.platform.invokeMethod('printLog');
      controller.namePlatformChannels.value = result;
      Logger().d(result);
    } on PlatformException catch (e) {
      controller.namePlatformChannels.value =
          "Failed to Invoke: '${e.message}'.";
    }
  }

  void openDialog() async {
    try {
      final String result =
          await controller.platform.invokeMethod('openDialog');
      controller.namePlatformChannels.value = result;
      Logger().d(result);
    } on PlatformException catch (e) {
      controller.namePlatformChannels.value =
          "Failed to Invoke: '${e.message}'.";
    }
  }
}
