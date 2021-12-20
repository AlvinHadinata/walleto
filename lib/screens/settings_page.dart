import 'dart:io';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:walleto/notification/custom_dialog.dart';
import 'package:walleto/notification/preference_provider.dart';
import 'package:walleto/notification/scheduling_provider.dart';
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
      body: Consumer<PreferencesProvider>(
        builder: (context, provider, child) {
          return ListView(
            children: [
              Material(
                child: ListTile(
                  title: Text('Pengingat', style: blackTextStyle.copyWith(
                    fontSize: 14, fontWeight: bold
                  )),
                  subtitle: Text('Akan memberi notifikasi setiap hari pukul 08.00 WIB', style: blackTextStyle.copyWith(
                    fontSize: 10, fontWeight: regular
                  )),
                  trailing: Consumer<SchedulingProvider>(
                    builder: (context, scheduled, _) {
                      return Switch.adaptive(
                        value: provider.isPengingatAktif,
                        onChanged: (value) async {
                          if (Platform.isIOS) {
                            customDialog(context);
                          } else {
                            scheduled.pengingat(value);
                            provider.enablePengingat(value);
                          }
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        },
      )
    );
  }
}
