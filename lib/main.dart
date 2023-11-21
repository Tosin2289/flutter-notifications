import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_notifications/push-notification(firbase)/firebase_api.dart';
import 'package:flutter_notifications/push-notification(firbase)/phome_page.dart';

import 'awesome_notifications/awesome_home_page.dart';
import 'firebase_options.dart';
import 'push-notification(firbase)/noti_page.dart';

final navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await FirebaseApi().initNotification();
  AwesomeNotifications().initialize(
    null,
    [
      NotificationChannel(
          channelKey: 'Basic_channel',
          channelName: 'Basic notifications',
          channelDescription: 'Notification channel for basic tests')
    ],
    debug: true,
  );
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PHomePage(),
      navigatorKey: navigatorKey,
      routes: {
        "/notification_screen": (context) => const NotiPage(),
      },
    );
  }
}
