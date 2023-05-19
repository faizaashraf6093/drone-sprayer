import 'package:drone_sprayer/screens/help.dart';
import 'package:drone_sprayer/screens/homepage.dart';
import 'package:drone_sprayer/screens/settings.dart';
import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';

class HiddenDrawer extends StatefulWidget {
  const HiddenDrawer({super.key});

  @override
  State<HiddenDrawer> createState() => _HiddenDrawerState();
}

class _HiddenDrawerState extends State<HiddenDrawer> {
  List<ScreenHiddenDrawer> _pages = [];

  final TextStyle _selectedStyle = const TextStyle(
    fontSize: 20,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );

  final TextStyle _baseStyle = const TextStyle(
    fontSize: 14,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );

  @override
  void initState() {
    super.initState();

    _pages = [
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: 'Homepage',
          baseStyle: _baseStyle,
          selectedStyle: _selectedStyle,
          colorLineSelected: Colors.white,
        ),
        const HomePage(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: 'Settings',
          baseStyle: _baseStyle,
          selectedStyle: _selectedStyle,
          colorLineSelected: Colors.white,
        ),
        const Settings(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: 'Help',
          baseStyle: _baseStyle,
          selectedStyle: _selectedStyle,
          colorLineSelected: Colors.white,
        ),
        const Help(),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      initPositionSelected: 0,
      screens: _pages,
      backgroundColorMenu: const Color.fromARGB(255, 32, 116, 107),
    );
  }
}
