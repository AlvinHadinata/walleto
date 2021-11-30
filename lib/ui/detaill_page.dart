import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            background(),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

Widget background() {
  return Builder(builder: (BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.width / 4,
        decoration: BoxDecoration(
            color: Colors.cyanAccent,
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(50),
                bottomLeft: Radius.circular(50))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Detail Tabunganku',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  fontFamily: 'TC',
                ))
          ],
        ));
  });
}
