import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static void initialize() {
    print(
        'LocalNotificationService>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>');

    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: AndroidInitializationSettings("@mipmap/ic_launcher"));

    _notificationsPlugin.initialize(initializationSettings);
    print('initialize>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>');
  }

  static void display(RemoteMessage message) async {
    print('display>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>');
    try {
      final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      final NotificationDetails notificationDetails = NotificationDetails(
          android: AndroidNotificationDetails("mychannel", "my channel",
              importance: Importance.max, priority: Priority.high));
      await _notificationsPlugin.show(id, message.notification.title,
          message.notification.title, notificationDetails);
      print('display finished>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>');
    } on Exception catch (e) {
      // TODO
      print(e);
    }
  }
}
