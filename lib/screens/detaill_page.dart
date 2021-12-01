import 'package:flutter/material.dart';
import 'package:walleto/shared/theme.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tabunganku', style: TextStyle(fontFamily: 'Nunito')),
        centerTitle: true,
        backgroundColor: kBlueColor,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
      ),
    );
  }
}