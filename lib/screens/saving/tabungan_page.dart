import 'package:flutter/material.dart';
import 'package:walleto/screens/category/detail_page.dart';
import 'package:walleto/screens/widgets/item_list.dart';
import 'package:walleto/shared/theme.dart';

class TabunganPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tabungan', style: TextStyle(fontFamily: 'Nunito')),
        centerTitle: true,
        backgroundColor: kBlueColor,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: riwayat(),
      ),
    );
  }
}

Widget riwayat() {
  return Builder(builder: (BuildContext context) {
    return ListView(
      physics: ClampingScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      children: <Widget>[
        ItemList(),
        ItemList(),
        ItemList(),
      ],
    );
  });
}
