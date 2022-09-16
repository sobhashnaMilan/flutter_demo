import 'package:flutter_demo/bindings/authentication/login_binding.dart';
import 'package:flutter_demo/bindings/authentication/signup_binding.dart';
import 'package:flutter_demo/ui/chat/chat_screen.dart';
import 'package:flutter_demo/ui/chat/signup_screen.dart';
import 'package:get/get.dart';
import '../../bindings/common/home_binding.dart';
import '../../bindings/platform_channels/platform_channels_binding.dart';
import '../../ui/chat/login_screen.dart';
import '../../ui/common/home_screen.dart';
import '../../ui/common/splash_screen.dart';
import '../../ui/notification/notification_screen.dart';
import '../../ui/platform_channels/platform_channels.dart';
import '../../util/app_common_stuffs/screen_routes.dart';

class AppRoutes {
  static List<GetPage> routes = [
    GetPage(
      name: ScreenRoutesConstant.splashScreen,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: ScreenRoutesConstant.loginScreen,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: ScreenRoutesConstant.signupScreen,
      page: () => const SignupScreen(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: ScreenRoutesConstant.chatScreen,
      page: () => const ChatScreen(),
    ),
    GetPage(
      name: ScreenRoutesConstant.homeScreen,
      page: () => const HomeScreen(),
      bindings: [HomeBinding()],
    ),
    GetPage(
      name: ScreenRoutesConstant.platformChannelsScreen,
      page: () => const PlatformChannelsScreen(),
      bindings: [PlatformChannelsBinding()],
    ),
    GetPage(
      name: ScreenRoutesConstant.notificationScreen,
      page: () => const NotificationScreen(),
    ),
  ];
}
