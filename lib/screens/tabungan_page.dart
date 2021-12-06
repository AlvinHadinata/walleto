import 'package:flutter/material.dart';
import 'package:walleto/screens/category/detail_page.dart';
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

Widget riwayat(){
  return Builder(
    builder: (BuildContext context){
      return ListView(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children: <Widget>[
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryDetailPage()));
            },
            child: Card(
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