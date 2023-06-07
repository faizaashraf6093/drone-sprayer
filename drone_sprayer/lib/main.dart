import 'package:drone_sprayer/auth/auth.dart';
import 'package:drone_sprayer/auth/verify_email.dart';
import 'package:drone_sprayer/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:drone_sprayer/screens/homepage.dart';
import 'package:drone_sprayer/screens/help.dart';
import 'package:drone_sprayer/screens/map.dart';
import 'package:drone_sprayer/screens/settings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const AuthPage()),
        GetPage(name: '/home', page: () => const HomePage()),
        GetPage(name: '/map', page: () => const Location()),
        GetPage(name: '/setting', page: () => const Settings()),
        GetPage(name: '/help', page: () => const Help()),
      ],
      title: 'Drone Sprayer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.teal,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.teal,
            elevation: 0.0,
            // centerTitle: true,
          )),
      home: const AuthPage(),
    );
  }
}
