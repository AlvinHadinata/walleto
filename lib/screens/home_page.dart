import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:walleto/screens/settings_page.dart';

import 'detaill_page.dart';
import 'main_menu_page.dart';
import 'notes_page.dart';

class HomePage extends StatefulWidget{
  static const routeName = '/home_page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int index = 0;
  final inactiveColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildPages(),
      bottomNavigationBar: bottomNav(),
    );
  }

  Widget bottomNav(){
    return BottomNavyBar(
      curve: Curves.ease,
      backgroundColor: Colors.white,
      selectedIndex: index,
      onItemSelected: (index) => setState(() => this.index = index),
      items: <BottomNavyBarItem>[
        BottomNavyBarItem(
            icon: Icon(Icons.home),
            title: Text('Beranda'),
            inactiveColor: inactiveColor,
            activeColor: Colors.red),
        BottomNavyBarItem(
            icon: Icon(Icons.attach_money),
            title: Text('Detail'),
            inactiveColor: inactiveColor,
            activeColor: Colors.orange),
        BottomNavyBarItem(
            icon: Icon(Icons.list_alt),
            title: Text('Catatan'),
            inactiveColor: inactiveColor,
            activeColor: Colors.purpleAccent),
        BottomNavyBarItem(
            icon: Icon(Icons.settings),
            title: Text('Pengaturan'),
            inactiveColor: inactiveColor,
            activeColor: Colors.green),

      ]
    );
  }

  Widget buildPages(){
    switch(index){
      case 1:
        return DetailPage();
      case 2:
        return NotesPage();
      case 3:
        return SettingsPage();
      case 0:
      default:
        return MainMenuPage();
    }
  }
}