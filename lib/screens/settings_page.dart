import 'package:flutter/material.dart';
import 'package:walleto/shared/theme.dart';

class SettingsPage extends StatefulWidget {
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isON = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pengaturan',
            style: whiteTextStyle.copyWith(
                fontSize: 18, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: kBlueColor,
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Pengingat', style: blackTextStyle.copyWith(
                fontSize: 16, fontWeight: FontWeight.bold)),
            trailing: Switch(
                value: isON,
                onChanged: (newValue) {
                  isON = newValue;
                  setState(() {});
                },
                ),
          )
        ],
      ),
    );
  }
}
