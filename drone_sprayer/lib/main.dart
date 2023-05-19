import 'package:drone_sprayer/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Drone Sprayer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.teal,
          appBarTheme: const AppBarTheme(
            backgroundColor:  Color.fromARGB(255, 3, 174, 157),
            elevation: 0.0,
            // centerTitle: true,
          )),
      home: const HiddenDrawer(),
    );
  }
}
