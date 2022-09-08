import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_demo/util/app_logger.dart';
import 'bindings/platform_channels_binding.dart';
import 'firebase_options.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/services.dart';

import '../../util/app_common_stuffs/app_routes.dart';
import '../../controllers/app/app_controller.dart';
import '../../language/language_util.dart';
import '../../util/app_common_stuffs/screen_routes.dart';
import '../../util/import_export_util.dart';
import 'package:url_strategy/url_strategy.dart';
import 'dart:async';

import 'fcm/notification_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  Get.put<AppController>(AppController());

  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await NotificationService().getFCMToken();
  NotificationHelper.initNotification();
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  runApp(
    MyApp(currentLocale: await LanguageUtil.loadCurrentLanguage()),
  );
}

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await NotificationService().setupFlutterNotifications();
  Logger().d("💣 😀 =====> onBackgroundMessage: $message");
  NotificationService().displayNotificationView(message);
}

class NotificationHelper {
  static void initNotification() {
    AwesomeNotifications().initialize(
        'resource://drawable/app_icon',
        [
          NotificationChannel(
              channelGroupKey: 'basic_channel_group',
              channelKey: 'basic_channel',
              channelName: 'Basic notifications',
              channelDescription: 'Notification channel for basic tests',
              defaultColor: const Color(0xFF9D50DD),
              ledColor: Colors.white)
        ],
        // Channel groups are only visual and are not required
        channelGroups: [
          NotificationChannelGroup(
              channelGroupkey: 'basic_channel_group',
              channelGroupName: 'Basic group')
        ],
        debug: true);

    AwesomeNotifications()
        .actionStream
        .listen((ReceivedNotification receivedNotification) {
      Logger().d("💣 😀 =====> AwesomeNotifications -> click");
      var mReceivedNotification = receivedNotification.toMap().toString();
      Logger().d("💣 😀 =====> AwesomeNotifications -> $mReceivedNotification");
    });
  }
}

class MyApp extends StatelessWidget {
  Locale currentLocale;

  MyApp({Key? key, required this.currentLocale}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (controller) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          getPages: AppRoutes.routes,
          // initialBinding: PlatformChannelsBinding(),
          // initialRoute: ScreenRoutesConstant.loginScreen,
          initialRoute: ScreenRoutesConstant.homeScreen,
          translations: LanguageUtil(),
          locale: currentLocale,
          fallbackLocale: LanguageUtil.fallbackLocale,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
        );
      },
    );
  }
}
