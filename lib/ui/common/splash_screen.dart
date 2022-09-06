import 'dart:async';

import '../../singleton/user_data_singleton.dart';
import '../../util/import_export_util.dart';

import '../../util/app_common_stuffs/screen_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    /// No need to use SplashScreen for login verification, Using native splash screen
    /// Using AppController instead with GetBuilder wrapping GetMaterialApp in main.dart
    /// This replaces AppModel with ChangeNotifier from Bloc structure
    initUserData();
  }

  void initUserData() async {
    if (await UserDataSingleton.isLoginVerified()) {
      await userDataSingleton.loadUserDetails();
    }
    startTime();
  }

  void startTime() {
    Timer(const Duration(seconds: 2), navigateScreen);
  }

  void navigateScreen() async {
    if (await UserDataSingleton.isLoginVerified()) {
      Get.offAndToNamed(ScreenRoutesConstant.homeScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              StringConstant.getXDemo.tr,
              style: black100Medium18TextStyle(context),
            ),
            Text(
              StringConstant.helloWorldLabel.tr,
              style: black100Medium18TextStyle(context),
            ),
          ],
        ),
      ),
    );
  }
}
