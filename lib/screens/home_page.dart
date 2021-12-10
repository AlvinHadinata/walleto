import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:walleto/screens/settings_page.dart';
import 'package:walleto/screens/target/saving_add_page.dart';
import 'package:walleto/screens/wallet/wallet_add_page.dart';
import 'package:walleto/shared/theme.dart';
import 'main_menu_page.dart';
import 'notes/notes_page.dart';
import 'dart:math' as math;

class HomePage extends StatefulWidget {
  static const routeName = '/home_page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // int index = 0;
  // final inactiveColor = Colors.black;

  int _bottomNavIndex = 0;

  final List<Widget> _listWidget = [
    MainMenuPage(),
    NotesPage(),
    SettingsPage(),
  ];

  void _onBottomNavTapped(int index) {
    setState(() {
      _bottomNavIndex = index;
    });
  }

  final _items = <Widget>[
    const Icon(
      Icons.dashboard_rounded,
      size: 30,
    ),
    const Icon(
      Icons.notes_rounded,
      size: 30,
    ),
    const Icon(
      Icons.settings_rounded,
      size: 30,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _listWidget[_bottomNavIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          iconTheme: const IconThemeData(color: kWhiteColor),
        ),
        child: CurvedNavigationBar(
          color: kBlueColor,
          buttonBackgroundColor: kBlueColor,
          backgroundColor: Colors.transparent,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 400),
          height: 60,
          items: _items,
          index: _bottomNavIndex,
          onTap: _onBottomNavTapped,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
