import 'package:flutter/material.dart';
import 'package:walleto/shared/theme.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pengaturan', style: whiteTextStyle.copyWith(fontSize: 16)),
        centerTitle: true,
        backgroundColor: kBlueColor,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
