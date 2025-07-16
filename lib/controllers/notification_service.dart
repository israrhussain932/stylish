import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationService {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  Future<void> initNotifications() async {
    // Permission lelo
    NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
      // Token lelo
      String? token = await _messaging.getToken();
      print('FCM Token: $token');

      // Foreground message handler
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        print('Received foreground message: ${message.notification?.title}');
        // Yahan local notification bhi dikha sakte ho
      });

      // App open from background
      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
        print('App opened from background message: ${message.notification?.title}');
      });
    } else {
      print('User declined or has not accepted permission');
    }
  }
}
