import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:timezone/timezone.dart' as tz;

class FirebaseService {
  static final FirebaseService _instance = FirebaseService._internal();
  factory FirebaseService() => _instance;
  FirebaseService._internal();

  late FirebaseAnalytics _analytics;
  late FirebaseMessaging _messaging;
  // late FlutterLocalNotificationsPlugin _localNotifications;

  FirebaseAnalytics get analytics => _analytics;
  FirebaseMessaging get messaging => _messaging;
  // FlutterLocalNotificationsPlugin get localNotifications => _localNotifications;

  Future<void> initialize() async {
    try {
      // Initialize Firebase
      await Firebase.initializeApp(
        options: _getFirebaseOptions(),
      );

      // Initialize Analytics
      _analytics = FirebaseAnalytics.instance;
      await _analytics.setAnalyticsCollectionEnabled(true);

      // Initialize Messaging
      _messaging = FirebaseMessaging.instance;
      await _initializeMessaging();

      // Initialize Local Notifications
      // _localNotifications = FlutterLocalNotificationsPlugin();
      // await _initializeLocalNotifications();

      if (kDebugMode) {
        print('Firebase initialized successfully');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Firebase initialization failed: $e');
      }
      rethrow;
    }
  }

  FirebaseOptions _getFirebaseOptions() {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return const FirebaseOptions(
        apiKey: 'your-android-api-key',
        appId: 'your-android-app-id',
        messagingSenderId: 'your-messaging-sender-id',
        projectId: 'your-project-id',
        storageBucket: 'your-project-id.appspot.com',
      );
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      return const FirebaseOptions(
        apiKey: 'your-ios-api-key',
        appId: 'your-ios-app-id',
        messagingSenderId: 'your-messaging-sender-id',
        projectId: 'your-project-id',
        storageBucket: 'your-project-id.appspot.com',
        iosBundleId: 'com.lively.app',
      );
    } else if (defaultTargetPlatform == TargetPlatform.macOS) {
      return const FirebaseOptions(
        apiKey: 'your-macos-api-key',
        appId: 'your-macos-app-id',
        messagingSenderId: 'your-messaging-sender-id',
        projectId: 'your-project-id',
        storageBucket: 'your-project-id.appspot.com',
        iosBundleId: 'com.lively.app',
      );
    } else if (defaultTargetPlatform == TargetPlatform.windows) {
      return const FirebaseOptions(
        apiKey: 'your-windows-api-key',
        appId: 'your-windows-app-id',
        messagingSenderId: 'your-messaging-sender-id',
        projectId: 'your-project-id',
        storageBucket: 'your-project-id.appspot.com',
      );
    }
    throw UnsupportedError('Platform not supported');
  }

  Future<void> _initializeMessaging() async {
    // Request permission for notifications
    await _messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      announcement: false,
    );

    // Handle background messages
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    // Handle foreground messages
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (kDebugMode) {
        print('Received foreground message: ${message.notification?.title}');
      }
      // _showLocalNotification(message);
    });

    // Handle message taps
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      if (kDebugMode) {
        print('Message tapped: ${message.notification?.title}');
      }
      _handleMessageTap(message);
    });

    // Get FCM token
    String? token = await _messaging.getToken();
    if (kDebugMode) {
      print('FCM Token: $token');
    }
  }

  // Future<void> _initializeLocalNotifications() async {
  //   const AndroidInitializationSettings androidSettings = AndroidInitializationSettings(
  //     '@mipmap/ic_launcher',
  //   );

  //   const DarwinInitializationSettings iosSettings = DarwinInitializationSettings(
  //     requestAlertPermission: true,
  //     requestBadgePermission: true,
  //     requestSoundPermission: true,
  //   );

  //   const InitializationSettings initializationSettings = InitializationSettings(
  //     android: androidSettings,
  //     iOS: iosSettings,
  //     macOS: iosSettings,
  //   );

  //   await _localNotifications.initialize(
  //     initializationSettings,
  //     onDidReceiveNotificationResponse: (NotificationResponse response) {
  //       if (kDebugMode) {
  //         print('Local notification tapped: ${response.payload}');
  //       }
  //     },
  //   );
  // }

  // Future<void> _showLocalNotification(RemoteMessage message) async {
  //   const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
  //     'focus_channel',
  //     'Focus Notifications',
  //     channelDescription: 'Notifications for focus sessions and reminders',
  //     importance: Importance.high,
  //     priority: Priority.high,
  //     showWhen: true,
  //   );

  //   const DarwinNotificationDetails iosDetails = DarwinNotificationDetails(
  //     presentAlert: true,
  //     presentBadge: true,
  //     presentSound: true,
  //   );

  //   const NotificationDetails notificationDetails = NotificationDetails(
  //     android: androidDetails,
  //     iOS: iosDetails,
  //     macOS: iosDetails,
  //   );

  //   await _localNotifications.show(
  //     message.hashCode,
  //     message.notification?.title,
  //     message.notification?.body,
  //     notificationDetails,
  //     payload: message.data['payload'],
  //   );
  // }

  void _handleMessageTap(RemoteMessage message) {
    // Handle notification tap navigation
    // This would typically navigate to a specific screen based on the message data
    final String? type = message.data['type'];
    final String? payload = message.data['payload'];
    
    if (kDebugMode) {
      print('Handling message tap: type=$type, payload=$payload');
    }
    
    // TODO: Add navigation logic based on message type
  }

  Future<void> logEvent(String eventName, Map<String, dynamic> parameters) async {
    await _analytics.logEvent(
      name: eventName,
      parameters: parameters,
    );
  }

  Future<void> setUserId(String userId) async {
    await _analytics.setUserId(id: userId);
  }

  Future<void> setUserProperty(String name, String value) async {
    await _analytics.setUserProperty(name: name, value: value);
  }

  Future<String?> getFCMToken() async {
    return await _messaging.getToken();
  }

  Future<void> subscribeToTopic(String topic) async {
    await _messaging.subscribeToTopic(topic);
  }

  Future<void> unsubscribeFromTopic(String topic) async {
    await _messaging.unsubscribeFromTopic(topic);
  }

  // Future<void> scheduleLocalNotification({
  //   required int id,
  //   required String title,
  //   required String body,
  //   required DateTime scheduledTime,
  //   String? payload,
  // }) async {
  //   const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
  //     'scheduled_channel',
  //     'Scheduled Notifications',
  //     channelDescription: 'Scheduled notifications for focus sessions',
  //     importance: Importance.high,
  //     priority: Priority.high,
  //     showWhen: true,
  //   );

  //   const DarwinNotificationDetails iosDetails = DarwinNotificationDetails(
  //     presentAlert: true,
  //     presentBadge: true,
  //     presentSound: true,
  //   );

  //   const NotificationDetails notificationDetails = NotificationDetails(
  //     android: androidDetails,
  //     iOS: iosDetails,
  //     macOS: iosDetails,
  //   );

  //   await _localNotifications.zonedSchedule(
  //     id,
  //     title,
  //     body,
  //     tz.TZDateTime.from(scheduledTime, tz.local),
  //     notificationDetails,
  //     payload: payload,
  //     uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
  //   );
  // }

  // Future<void> cancelNotification(int id) async {
  //   await _localNotifications.cancel(id);
  // }

  // Future<void> cancelAllNotifications() async {
  //   await _localNotifications.cancelAll();
  // }
}

// Background message handler
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  if (kDebugMode) {
    print('Background message: ${message.notification?.title}');
  }
}