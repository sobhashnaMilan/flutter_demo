import 'dart:math';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

import '../ui/notification/notification_screen.dart';
import '../util/app_logger.dart';

class NotificationService extends Object {
  static final NotificationService _singleton = NotificationService._internal();
  late FirebaseMessaging _fireBaseMessaging;
  String _fcmToken = "";
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  bool isFlutterLocalNotificationsInitialized = false;

  AndroidNotificationChannel channel = const AndroidNotificationChannel(
    'channelId', // id
    'channelId', // title
    description:
        'This channel is used for important notifications.', // description
    importance: Importance.high,
  );

  factory NotificationService() {
    return _singleton;
  }

  NotificationService._internal() {
    Logger().d( "💣 😀 =====> Firebase Messaging instance created");
    _fireBaseMessaging = FirebaseMessaging.instance;
    _fireBaseMessaging.setAutoInitEnabled(true);
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    firebaseCloudMessagingListeners();
  }

  Future<void> firebaseCloudMessagingListeners() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      Logger().d( "💣 😀 =====> onMessageOpenedApp: $message");
      displayNotificationView(message);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      Logger().d( "💣 😀 =====> onMessageOpenedApp: $message");
      displayNotificationView(message);
    });
  }

  Future<void> setupFlutterNotifications() async {
    if (isFlutterLocalNotificationsInitialized) {
      return;
    }

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    /// Create an Android Notification Channel.
    ///
    /// We use this channel in the `AndroidManifest.xml` file to override the
    /// default FCM channel to enable heads up notifications.
    await flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    /// Update the iOS foreground notification presentation options to allow
    /// heads up notifications.
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    isFlutterLocalNotificationsInitialized = true;
  }

  Future<String?> getFCMToken() async {
    try {
      String? token = await _fireBaseMessaging.getToken();
      if (token != null && token.isNotEmpty) {
        Logger().d( "💣 😀 =====> FCM Token :: $token");
        _fcmToken = token;
      }
      return _fcmToken;
    } catch (e) {
      Logger().d( "💣 😀 =====> Error :: ${e.toString()}");
      return null;
    }
  }

  void displayNotificationView(RemoteMessage? message) {
    String title = "title";
    String body = "body";

    if (message == null) {
      return;
    }

    if (message.data.isNotEmpty) {
      Map<String, dynamic> notificationData = message.data;
      title = notificationData['title'] ?? title;
      body = notificationData['body'] ?? body;
    } else {
      RemoteNotification? notification = message.notification;
      if (notification == null) {
        return;
      }
      title = notification.title ?? title;
      body = notification.body ?? body;
    }

    Logger().d( "💣 😀 =====> Display notification view");
    Logger().d( "💣 😀 =====> channel id ${channel.id}");

    flutterLocalNotificationsPlugin.show(
        generateRandom(),
        title,
        body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            channel.id,
            channel.name,
            color: Colors.blue,
            icon: "@mipmap/ic_launcher",
          ),
        ));
    flutterLocalNotificationsPlugin.initialize(
      const InitializationSettings(
          android: AndroidInitializationSettings('app_icon'),
          iOS: IOSInitializationSettings()),
      onSelectNotification: (payload) {
        Logger().d( "💣 😀 =====> arguments -> $payload");
        Get.to(const NotificationScreen(), arguments: [body]);
      },
    );
  }

  int generateRandom() {
    return Random().nextInt(9999);
  }
}
