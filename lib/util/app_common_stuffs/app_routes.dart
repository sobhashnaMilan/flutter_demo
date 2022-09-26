import 'package:flutter_demo/bindings/authentication/login_binding.dart';
import 'package:flutter_demo/bindings/authentication/signup_binding.dart';
import 'package:flutter_demo/bindings/chat/chat_list/chat_list_screen.dart';
import 'package:flutter_demo/bindings/chat/chat_screen/chat_screen_binding.dart';
import 'package:flutter_demo/bindings/chat/user_list/user_list_binding.dart';
import 'package:flutter_demo/ui/chat/chat_list_screen.dart';
import 'package:flutter_demo/ui/chat/chat_screen.dart';
import 'package:flutter_demo/ui/chat/signup_screen.dart';
import 'package:flutter_demo/ui/chat/user_list_screen.dart';
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
      name: ScreenRoutesConstant.userListScreen,
      page: () => const UserListScreen(),
      binding: UserListBinding()
    ),
    GetPage(
      name: ScreenRoutesConstant.chatScreen,
      page: () => const ChatScreen(),
      binding: ChatScreenBinding()
    ),
    GetPage(
      name: ScreenRoutesConstant.chatListScreen,
      page: () => const ChatListScreen(),
      binding: ChatListBinding()
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
