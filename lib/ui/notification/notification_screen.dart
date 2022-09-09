import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/service/fcm/notification_service.dart';
import 'package:flutter_demo/ui/style/style.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

import '../../util/app_common_stuffs/colors.dart';
import '../../util/app_common_stuffs/string_constants.dart';
import '../../util/app_logger.dart';
import '../../util/responsive_util.dart';
import '../style/components/app_bar_component.dart';
import '../style/components/button_component.dart';
import '../style/text_styles.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  var arguments = Get.arguments;

  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  AndroidNotificationChannel channel = const AndroidNotificationChannel(
    'channelId', // id
    'channelId', // title
    description:
        'This channel is used for important notifications.', // description
    importance: Importance.high,
  );

  @override
  void initState() {
    super.initState();
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        // This is just a basic example. For real apps, you must show some
        // friendly dialog box before call the request method.
        // This is very important to not harm the user experience
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
    if (arguments != null) {
      Logger().d("💣 😀 =====> arguments -> ${arguments[0].toString()}");
    }
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()!
        .requestPermission();
  }

  void onSelectNotification(String payload) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: const Text("Hello Everyone"),
              content: Text(payload),
            ));
  }

  @override
  Widget build(BuildContext context) {
    DeviceType deviceType = ResponsiveUtil.isMobile(context)
        ? DeviceType.mobile
        : DeviceType.desktop;

    return Scaffold(
      appBar: AppBarComponent.buildAppbar(
        titleWidget: Text(
          StringConstant.btnNotification.tr,
          style: deviceType == DeviceType.mobile
              ? white100Medium24TextStyle(context)
              : white100Medium10TextStyle(context),
        ),
      ),
      body: Container(
        width: Get.width,
        height: Get.height,
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ButtonComponent(
              context: context,
              text: "local notification",
              backgroundColor: AppColors.blueColor,
              onPressed: () => notificationDefaultSound(),
            ),
            CommonStyle.verticalSpace(context, 0.025),
            ButtonComponent(
              context: context,
              backgroundColor: AppColors.blueColor,
              onPressed: () => showAwesomeNotification(),
              text: "Awesome notification",
            ),
          ],
        ),
      ),
    );
  }

  Future notificationDefaultSound() async {
    flutterLocalNotificationsPlugin.show(
        NotificationService().generateRandom(),
        'New Alert',
        'How to show Local Notification',
        const NotificationDetails(
            android: AndroidNotificationDetails(
              'high_importance_channel',
              'high_importance_channel',
              importance: Importance.max,
              priority: Priority.high,
            ),
            iOS: IOSNotificationDetails()),
        payload: 'Default Sound');

    flutterLocalNotificationsPlugin.initialize(
      const InitializationSettings(
          android: AndroidInitializationSettings('app_icon'),
          iOS: IOSInitializationSettings()),
      onSelectNotification: (payload) {
        onSelectNotification(payload!);
      },
    );
  }

  showAwesomeNotification() {
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: NotificationService().generateRandom(),
        channelKey: 'basic_channel',
        title: 'Simple Notification',
        body: 'Simple body',
        notificationLayout: NotificationLayout.BigPicture,
        displayOnBackground: true,
        displayOnForeground: true,
        color: Colors.red,
        backgroundColor: Colors.brown,
        largeIcon:
            'https://protocoderspoint.com/wp-content/uploads/2021/05/Monitize-flutter-app-with-google-admob-min-741x486.png',
        bigPicture:
            'https://protocoderspoint.com/wp-content/uploads/2021/05/Monitize-flutter-app-with-google-admob-min-741x486.png',
      ),
      actionButtons: [
        NotificationActionButton(
            key: 'reply',
            label: 'Reply',
            enabled: true,
            buttonType: ActionButtonType.InputField,
            autoDismissible: true,
            showInCompactView: true,
            icon: "resource://drawable/app_icon")
      ],
    );
  }
}
