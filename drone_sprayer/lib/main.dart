import 'package:drone_sprayer/widgets/drawer.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Drone Sprayer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.teal,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.teal,
            elevation: 0.0,
            centerTitle: true,
          )),
      home: const HiddenDrawer(),
    );
  }
}
