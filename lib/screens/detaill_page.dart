import 'package:flutter/material.dart';
import 'package:walleto/shared/theme.dart';

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
        height: MediaQuery.of(context).size.width / 3,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  kGradasi,
                  kBlueColor,
                ],
                begin: Alignment.bottomRight
            )
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Detail Tabunganku',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      fontFamily: 'Nunito',
                      color: kWhiteColor
                  )),
            ],
          ),
        ));
  });
}