import 'package:drone_sprayer/widgets/drawer.dart';
import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(
        title: const Text('Settings'),
        ),
      body: const SingleChildScrollView(),
    );
  }
}
