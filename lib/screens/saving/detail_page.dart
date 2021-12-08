import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:walleto/data/model/category.dart';
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
            history()
          ],
        ),
      ),
    );
  }

  Widget detailSaldo() {
    return Builder(builder: (BuildContext context) {
      return Container(
        width: MediaQuery.of(context).size.width - 45,
        decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(category.name,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0,
                          fontFamily: 'Nunito',
                          color: kWhiteColor)),
                  SizedBox(height: 10),
                  Text(category.description,
                      style: TextStyle(
                          fontSize: 10.0,
                          fontFamily: 'Nunito',
                          color: kWhiteColor)),
                  SizedBox(height: 10),
                  Text('Rp ' + category.nominal.toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 19.0,
                          fontFamily: 'Nunito',
                          color: kWhiteColor)),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}

Widget history(){
  return Builder(
      builder: (BuildContext context){
        return ListView(
          physics: ClampingScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(
                      color: Colors.grey,
                      width: 1
                  )
              ),
              child: ListTile(
                title: Text('Minang Deng Laka Minang Suang', style: TextStyle(fontFamily: 'Nunito')),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(
                      color: Colors.grey,
                      width: 1
                  )
              ),
              child: ListTile(
                title: Text('Minang Deng Laka Minang Suang', style: TextStyle(fontFamily: 'Nunito')),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(
                      color: Colors.grey,
                      width: 1
                  )
              ),
              child: ListTile(
                title: Text('Minang Deng Laka Minang Suang', style: TextStyle(fontFamily: 'Nunito')),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(
                      color: Colors.grey,
                      width: 1
                  )
              ),
              child: ListTile(
                title: Text('Minang Deng Laka Minang Suang', style: TextStyle(fontFamily: 'Nunito')),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(
                      color: Colors.grey,
                      width: 1
                  )
              ),
              child: ListTile(
                title: Text('Minang Deng Laka Minang Suang', style: TextStyle(fontFamily: 'Nunito')),
              ),
            ),
          ],
        );
      }
  );
}