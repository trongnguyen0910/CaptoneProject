import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:myapp/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Garden/garden.dart';
import 'GetX/GardenGetX.dart';
import 'Notification/firebaseconfig.dart';
import 'Notification/pushnotification_provider.dart';
import 'SignIn/SignIn.dart';

PushNotificationsProvider pushNotificationsProvider =
    PushNotificationsProvider();
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call initializeApp before using other Firebase services.
  print('Recibiendo notificacion en segundo plano ${message.messageId}');
  // pushNotificationsProvider.showNotification(message);
}

Future<void> initializeFirebase() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Firebase and wait for it to complete
  await Firebase.initializeApp(
    name: 'capstonep-30015',
    options: FirebaseConfig.currentPlatform,
  );

  // Get the Firebase Messaging token and write it to storage
  final token = await FirebaseMessaging.instance.getToken();
  // if (token != null) {
  //   final prefs = await SharedPreferences.getInstance();
  //   await prefs.setString('token', token);
  // }
  print('getToken: $token');

  // Set the onBackgroundMessage handler and initialize push notifications
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  pushNotificationsProvider.initPushNotifications();
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  Get.put(GardenController());
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('vi_VN', null);
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await Firebase.initializeApp();
  await FirebaseMessaging.instance.getInitialMessage();
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  messaging.requestPermission();
  FirebaseMessaging.instance.subscribeToTopic('7');

  messaging.getToken().then((token) async {
    print("TokenDevice: $token");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token!);
  });

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print("Received message: $message");
  });

// If application is in Background
  FirebaseMessaging.onMessageOpenedApp.listen(
    (RemoteMessage message) {
      print("onMessageOpenApp: $message");
      //    Navigator.push(
      //    navigatorKey.currentState!.context,
      //     MaterialPageRoute(
      //      builder: (context) => HomeNoti(message: json.encode(message.data)),
      // ),
      //     );
    },
  );

// If app is closed
  FirebaseMessaging.instance.getInitialMessage().then(
    (RemoteMessage? message) {
      if (message != null) {
        //       Navigator.push(
        //   navigatorKey.currentState!.context,
        //   MaterialPageRoute(
        //     builder: (context) => HomeNoti(message: json.encode(message.data)),
        //   ),
        // );
      }
    },
  );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
   @override
  void initState(){
     super.initState();
    pushNotificationsProvider.onMessageListener(context as BuildContext);
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter',
      debugShowCheckedModeBanner: false,
      scrollBehavior: MyCustomScrollBehavior(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Login(),
    );
  }
}
