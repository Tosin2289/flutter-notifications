import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

class AwesomeHomePage extends StatefulWidget {
  const AwesomeHomePage({super.key});

  @override
  State<AwesomeHomePage> createState() => _AwesomeHomePageState();
}

class _AwesomeHomePageState extends State<AwesomeHomePage> {
  @override
  void initState() {
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
    super.initState();
  }

  triggerNotification() {
    AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: 1,
            channelKey: 'Basic_channel',
            title: 'Simple Notification',
            body: 'Simple Button'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notification"),
      ),
      body: Center(
          child: ElevatedButton(
        onPressed: triggerNotification,
        child: const Text('Trigger Notification'),
      )),
    );
  }
}
