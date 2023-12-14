import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

class FirebaseHelper with WidgetsBindingObserver {
  late final FirebaseMessaging _firebaseMessaging;

  static initialize(){
    FirebaseHelper._create();
  }

  FirebaseHelper._create() {
    WidgetsBinding.instance.addObserver(this);
    initFirebase();
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    switch (state) {
      case AppLifecycleState.detached:
        WidgetsBinding.instance.removeObserver(this);
        break;
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.paused:
        break;
      case AppLifecycleState.resumed:
        break;
    }
  }

  @pragma('vm:entry-point')
  static Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    print("Handling a background message: ${message.messageId}");
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  }

  Future<void> initFirebase() async {
    await AwesomeNotifications().initialize(
        // set the icon to null if you want to use the default app icon
        null,
        [
          NotificationChannel(
              channelKey: 'basic_channel',
              channelName: 'Basic notifications',
              channelDescription: 'Notification channel',
              defaultColor: const Color(0xFF9D50DD),
              ledColor: Colors.white)
        ]);
    await Firebase.initializeApp();
    _firebaseMessaging = FirebaseMessaging.instance;
    await _firebaseMessaging.setAutoInitEnabled(true);
    if (!kIsWeb) {
      await FirebaseMessaging.instance
          .setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );
    }
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print('User granted provisional permission');
    } else {
      print('User declined or has not accepted permission');
    }

    _firebaseMessaging.getToken().then((token) {
      print('Device Token FCM: $token');
    });

    _firebaseMessaging.onTokenRefresh.listen((fcmToken) {
      // TODO: If necessary send token to application server.

      // Note: This callback is fired at each app startup and whenever a new
      // token is generated.
      print('Device Token FCM: $fcmToken');
    }).onError((err) {
      // Error getting token.
      print('Device Token FCM: $err.message');
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      print("onMessageOpenedApp: ${message.data}");
    });

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      print(
          'Message title: ${message.notification?.title}, body: ${message.notification?.body}, data: ${message.data}');
      await AwesomeNotifications().createNotificationFromJsonData(message.data);
    });
  }
}
