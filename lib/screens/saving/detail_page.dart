import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:walleto/data/model/category.dart';
import 'package:walleto/screens/widgets/item_list.dart';
import 'package:walleto/shared/theme.dart';

class SavingDetailPage extends StatelessWidget{

  final Category category;

  const SavingDetailPage({required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Detail Tabungan', style: TextStyle(fontFamily: 'Nunito')),
          centerTitle: true,
          backgroundColor: kBlueColor
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: ClampingScrollPhysics(),
        child:
        Column(
          children: [
            SizedBox(height: 20),
            detailSaldo(),
            SizedBox(height: 20),
            riwayat()
          ],
        ),
      ),
    );
  }

  Widget detailSaldo() {
    return Builder(builder: (BuildContext context) {
      return Container(
        margin: EdgeInsets.all(10),
        height: 100,
        decoration: BoxDecoration(
          color: category.color,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Icon(
                    category.icon,
                    size: 20.0,
                    color: Colors.amber,
                  ),
                  Text(
                    "RP. " + category.nominal.toString(),
                    style: whiteTextStyle.copyWith(
                        fontSize: 15, fontWeight: regular),
                  )
                ],
              ),
              SizedBox(height: 10),
              Text(
                category.name,
                style: whiteTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: bold,
                ),
              ),
            ],
          ),
        ),
      );
    });
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