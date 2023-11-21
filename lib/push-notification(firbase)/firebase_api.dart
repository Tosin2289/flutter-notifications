import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_notifications/main.dart';

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;
  Future<void> initNotification() async {
    await _firebaseMessaging.requestPermission();
    final fcmToken = await _firebaseMessaging.getToken();
    print(fcmToken);
    initPushNotifications();
  }

  void handleMeddage(RemoteMessage? message) {
    if (message == null) return;
    navigatorKey.currentState
        ?.pushNamed('/notification_screen', arguments: message);
  }

  Future initPushNotifications() async {
    FirebaseMessaging.instance.getInitialMessage().then(handleMeddage);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMeddage);
  }
}
