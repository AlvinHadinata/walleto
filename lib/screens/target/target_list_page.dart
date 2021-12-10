import 'package:flutter/material.dart';
import 'package:walleto/shared/theme.dart';

class TargetListPage extends StatelessWidget{
  static const routeName = "/target_list_page";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:
          Text('Daftar Saving', style: whiteTextStyle.copyWith(
              fontSize: 18, fontWeight: FontWeight.bold)),
          centerTitle: true,
          backgroundColor: kBlueColor),
    );
  }
}