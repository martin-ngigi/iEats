
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:i_eats/controllers/auth_controller.dart';

class NotificationHelper{
  static Future<void> initialize(FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin)async {
    var androidInitialize = const AndroidInitializationSettings('notification_icon');
    // var iOSInitialize = const IOSInitializationSettings();/// found in the old dependecies
    var iOSInitialize = const DarwinInitializationSettings();
    var initializationSettings = InitializationSettings(android: androidInitialize, iOS: iOSInitialize);


    /**
    flutterLocalNotificationsPlugin.initialize(initializationSettings, onSelectNotification: (String? payload){
      try{
        if(payload != null && payload.isNotEmpty){

        }
        else{

        }
      }
      catch(e){
        if(kDebugMode){
          print("-------> [NotificationHelper] Error: ${e}");
        }
      }
      return;
    });
    **/
    flutterLocalNotificationsPlugin.initialize(initializationSettings);

    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true
    );

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("------------onMessage--------");
      print("--------->onMessage: ${message.notification?.title}/"
          "${message.notification?.body}"
          "/${message.notification?.titleLocKey}");

      NotificationHelper.showNotification(message, flutterLocalNotificationsPlugin);
      if(Get.find<AuthController>().userLoggedIn()){

      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {

      print("--------->onOpenApp: ${message.notification?.title}/"
          "${message.notification?.body}"
          "/${message.notification?.titleLocKey}");

      try{

        if(message.notification?.title != null){

        }
        else{

        }
      }
      catch(e){
        print("-------> [NotificationHelper] onOpenApp Error: ${e}");
      }
    });
  }

  static Future<void> showNotification(RemoteMessage msg, FlutterLocalNotificationsPlugin fln) async {
    BigTextStyleInformation bigTextStyleInformation = BigTextStyleInformation(
      msg.notification!.body!, htmlFormatBigText: true,
      contentTitle: msg.notification!.title, htmlFormatContentTitle: true
    );

    AndroidNotificationDetails androidPlatformChannelSpecifies = AndroidNotificationDetails(
        'channel_id_1',
        'iEats',
      importance: Importance.high,
      styleInformation: bigTextStyleInformation, priority: Priority.high,
      playSound: true,
    );
    NotificationDetails platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifies,
      // iOS: IOSNotificationDetails()
      iOS: DarwinNotificationDetails()
    );
    await fln.show(0, msg.notification!.title, msg.notification!.body, platformChannelSpecifics);
  }
}
