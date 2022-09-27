import 'package:flutter/material.dart';
import 'package:flutter_demo/ui/chat/login_screen.dart';
import 'package:flutter_demo/ui/style/components/app_bar_component.dart';
import 'package:flutter_demo/ui/style/components/button_component.dart';
import 'package:flutter_demo/ui/style/text_styles.dart';
import 'package:flutter_demo/util/app_common_stuffs/string_constants.dart';
import 'package:flutter_demo/util/import_export_util.dart';
import 'package:flutter_demo/util/responsive_util.dart';
import 'package:get/get.dart';
import '../../controllers/platform_channels/PlatformChannelsController.dart';
import '../../controllers/home/home_controller.dart';
import '../../util/app_common_stuffs/screen_routes.dart';
import '../api_demo/api_demo.dart';
import '../equatable/equatable_demo.dart';
import '../firebase_authentication/auth_firebase.dart';
import '../firebase_deep_linking/deep_link_firebase.dart';
import '../location/location.dart';
import '../multi_language_support/multi_language.dart';
import '../navigator/navigator_one.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DeviceType deviceType = ResponsiveUtil.isMobile(context) ? DeviceType.mobile : DeviceType.desktop;

    return GetBuilder(
        init: HomeController(),
        builder: (controller) {
          /// app bar with textField
          /*CustomAppBar(chkText: (value){
            flutterPrint(msg: value);
          })*/

          return Scaffold(
              appBar: AppBarComponent.buildAppbarForHome(
                titleWidget: Text(
                  "Home Screen".tr,
                  textDirection: TextDirection.ltr,
                  style: deviceType == DeviceType.mobile ? white100Medium22TextStyle(context) : white100Medium10TextStyle(context),
                ),
              ),
              body: homeView(deviceType, controller));
        });
  }

  Widget homeView(DeviceType deviceType, HomeController controller) {
    return Container(
      width: Get.width,
      height: Get.height,
      color: Colors.brown,
      padding: const EdgeInsets.all(16),
      child: GridView.extent(
        crossAxisSpacing: 10,
        mainAxisSpacing: 30,
        childAspectRatio: 8,
        maxCrossAxisExtent: deviceType == DeviceType.mobile ? 900.0 : 400.0,
        primary: false,
        children: <Widget>[
          ButtonComponent(
            backgroundColor: AppColors.blueColor,
            context: context,
            onPressed: () {
              Get.to(const FireBaseAuth());
            },
            text: StringConstant.btnFirebaseOtp,
          ),
          ButtonComponent(
              backgroundColor: AppColors.blueColor,
              context: context,
              onPressed: () {
                Get.to(const ApiDemo());
              },
              text: StringConstant.btnApiDemo),
          ButtonComponent(
              backgroundColor: AppColors.blueColor,
              context: context,
              onPressed: () => Get.to(const DeepLinkFirebase()),
              text: StringConstant.btnDeepLink),
          ButtonComponent(
              backgroundColor: AppColors.blueColor,
              context: context,
              onPressed: () => Get.to(const MultiLanguage()),
              text: StringConstant.btnMultiLanguage),
          ButtonComponent(
              backgroundColor: AppColors.blueColor,
              context: context,
              onPressed: () => Get.to(const LocationService()),
              text: StringConstant.btnLocationService),
          ButtonComponent(
              backgroundColor: AppColors.blueColor,
              context: context,
              onPressed: () =>
                  Get.toNamed(ScreenRoutesConstant.platformChannelsScreen),
              text: StringConstant.btnPlatformChannels),
          ButtonComponent(
              backgroundColor: AppColors.blueColor,
              context: context,
              onPressed: () =>
                  Get.toNamed(ScreenRoutesConstant.notificationScreen),
              text: StringConstant.btnNotification),
          ButtonComponent(
              backgroundColor: AppColors.blueColor,
              context: context,
              onPressed: () => Get.to(const NavigatorOne()),
              text: StringConstant.btnNavigator),
          ButtonComponent(
              backgroundColor: AppColors.blueColor,
              context: context,
              onPressed: () => Get.to(const EquatableDemo()),
              text: StringConstant.btnEquatableDemo),
          ButtonComponent(
              backgroundColor: AppColors.blueColor,
              context: context,
              onPressed: () => controller.checkUserLogin(deviceType),
              text: StringConstant.btnChat),
        ],
      ),
    );
  }

  PreferredSizeWidget homeAppBar() {
    return AppBar(
      title: const Text(StringConstant.appName),
    );
  }
}

class CustomButton extends StatelessWidget {
  final VoidCallback onPress;
  final String text;

  const CustomButton({Key? key, required this.onPress, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: ElevatedButton(
            child: Text(text),
            onPressed: onPress,
          ),
        )
      ],
    );
  }
}
