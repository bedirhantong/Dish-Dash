import 'dart:io';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:dish_dash/view/auth/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  await AwesomeNotifications().initialize(
    null,
    [
      NotificationChannel(
          channelGroupKey: "basic_channel_group",
          channelKey: "basic_channel",
          channelName: "basic notification",
          channelDescription: "basic notification channel"),
    ],
    channelGroups: [
      NotificationChannelGroup(
          channelGroupKey: "basic_channel_group",
          channelGroupName: "Basic Group")
    ],
  );
  bool isAllowedToSendNotification =
      await AwesomeNotifications().isNotificationAllowed();
  if (!isAllowedToSendNotification) {
    AwesomeNotifications().requestPermissionToSendNotifications();
  }
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}
