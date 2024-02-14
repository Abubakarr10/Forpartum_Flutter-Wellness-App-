import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class notify {
  static Future initialize(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    var androidInitialize =
    const AndroidInitializationSettings('mipmap/ic_launcher');
    var IOSInitialize = const DarwinInitializationSettings();

    var initializationSettings = InitializationSettings(
        android: androidInitialize, iOS: IOSInitialize);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  static Future showAndStoreNotification({
    required int id,
    required String title,
    required String body,
    required FlutterLocalNotificationsPlugin fln,
    required String userId, // Add the user ID parameter
    required FirebaseFirestore firestore, // Add the Firestore parameter
    required Map<String, dynamic> userData, // Add the user data parameter
  }) async {
    // Show the notification
    await showNotification(id: id, title: title, body: body, fln: fln);

    // Store notification data in Firestore
    await storeNotificationData(userId: userId, firestore: firestore, body: body);
  }

  static Future showNotification({
    required int id,
    required String title,
    required String body,
    required FlutterLocalNotificationsPlugin fln,
  }) async {
    AndroidNotificationDetails androidPlatformchannelSpecifics =
    const AndroidNotificationDetails('NewId', 'channelname',
        playSound: true,
        sound: UriAndroidNotificationSound('assests/tunes/notify.mp3'),
        importance: Importance.max,
        priority: Priority.high);

    var noti = NotificationDetails(
        android: androidPlatformchannelSpecifics,
        iOS: const DarwinNotificationDetails());

    // Show the notification
    await fln.show(id, title, body, noti);
  }

  static Future storeNotificationData({
    required String userId,
    required FirebaseFirestore firestore,
    required String body,
  }) async {
    // Create a map to represent the notification data
    String notificationTitle = "Account Created";
    DateTime now = DateTime.now();
    String date = DateFormat('yyyy-MM-dd').format(now);
    String time = DateFormat('hh:mm a').format(now);

    var notificationDocumentId = firestore
        .collection("Users")
        .doc(userId)
        .collection("Notifications")
        .doc()
        .id;

    Map<String, dynamic> notificationData = {
      'title': notificationTitle,
      'message': body, // Use the body parameter for the notification message
      'notificationId': notificationDocumentId,
      'date': date,
      'time': time,
    };

    // Reference to the user's document in Firestore
    DocumentReference userDocRef = firestore.collection('Users').doc(userId);

    try {
      await userDocRef.collection('Notifications').doc(notificationDocumentId).set(notificationData);
      // Notification data has been successfully stored
      // You can add any additional logic here.
    } catch (error) {
      // Handle errors if storing notification data fails
      print("Error storing notification data: $error");
    }
  }
}
