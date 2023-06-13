import 'package:drone_sprayer/screens/help.dart';
import 'package:drone_sprayer/screens/homepage.dart';
import 'package:drone_sprayer/screens/map.dart';
import 'package:drone_sprayer/screens/settings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../auth/auth.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.teal,
      child: ListView(
        children: [
          const DrawerHeader(
            padding: EdgeInsets.zero,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.amber,
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: AssetImage('asset/images/man.png'),
                ),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.home_filled,
              color: Colors.white,
            ),
            title: const Text(
              'Home Page',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            onTap: () {
              Get.offAll(const HomePage());
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.location_on,
              color: Colors.white,
            ),
            title: const Text(
              'Map',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            onTap: () {
              Get.offAll(const HomePage());
              Get.to(() => const Location());
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.person,
              color: Colors.white,
            ),
            title: const Text(
              'Profile',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            onTap: () {
              Get.offAll(const HomePage());
              Get.to(() => const Settings());
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.logout_rounded,
              color: Colors.white,
            ),
            title: const Text(
              'Log Out',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            onTap: () {
              Get.offAll(const AuthPage());
              FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),
    );
  }
}
