import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:walleto/data/model/category.dart';
import 'package:walleto/screens/widgets/carousel.dart';
import 'package:walleto/screens/widgets/item_list.dart';
import 'package:walleto/shared/theme.dart';

class MainMenuPage extends StatefulWidget {
  @override
  State<MainMenuPage> createState() => _MainMenuPageState();
}

class _MainMenuPageState extends State<MainMenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Stack(children: [
          background(),
          Column(
            children: [
              SizedBox(height: 130),
              saldo(),
              SizedBox(height: 20),
              item2(),
              SizedBox(height: 20),
              carousel(),
              SizedBox(height: 20),
              item3(),
              riwayat()
            ],
          ),
        ]),
      ),
    );
  }
}

Widget carousel() {
  return Builder(builder: (BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        child: CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 2,
              enlargeCenterPage: true,
              enableInfiniteScroll: true,
              initialPage: 2,
              autoPlay: true,
            ),
            items: category
                .map((items) => Carousel(
                      category: items,
                    ))
                .toList()));
  });
}

Widget background() {
  return Builder(builder: (BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.width / 2,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          kGradasi,
          kBlueColor,
        ], begin: Alignment.bottomRight)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Walleto',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      fontFamily: 'Nunito',
                      color: kWhiteColor)),
            ],
          ),
        ));
  });
}

Widget saldo() {
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
                Text('Saldo',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                        fontFamily: 'Nunito',
                        color: kWhiteColor)),
                SizedBox(height: 10),
                Text('Rp 0',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 19.0,
                        fontFamily: 'Nunito',
                        color: kWhiteColor)),
              ],
            ),
            addButton(context)
          ],
        ),
      ),
    );
  });
}

Widget addButton(context) => FloatingActionButton(
      child: Icon(Icons.add, color: Colors.black),
      backgroundColor: Colors.cyanAccent,
      onPressed: () {
        showModalBottomSheet(
            context: context,
            builder: (context) {
              return Container(
                  height: MediaQuery.of(context).size.height / 3,
                  color: Colors.transparent,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        child: Text(
                          'Category',
                          style: whiteTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: medium,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: kBlueColor,
                          minimumSize: Size.fromHeight(40),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 14.0,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        onPressed: () {},
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        child: Text(
                          'Saving Target',
                          style: whiteTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: medium,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: kBlueColor,
                          minimumSize: Size.fromHeight(40),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 14.0,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        onPressed: () {},
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        child: Text(
                          'Saving ',
                          style: whiteTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: medium,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: kBlueColor,
                          minimumSize: Size.fromHeight(40),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 14.0,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ));
            });
      },
    );

Widget item2() {
  return Padding(
    padding: const EdgeInsets.only(left: 25.0),
    child: Row(
      children: [
        Column(
          children: [
            Text('Pilih Kategori Tabungan',
                style: blackTextStyle.copyWith(fontWeight: bold, fontSize: 15)),
          ],
        ),
      ],
    ),
  );
}

Widget item3() {
  return Padding(
    padding: const EdgeInsets.only(left: 25.0),
    child: Row(
      children: [
        Column(
          children: [
            Text('Riwayat menabung',
                style: blackTextStyle.copyWith(fontWeight: bold, fontSize: 15)),
          ],
        ),
      ],
    ),
  );
}

Widget riwayat() {
  return ListView(
    physics: ClampingScrollPhysics(),
    shrinkWrap: true,
    scrollDirection: Axis.vertical,
    children: [
      ItemList(),
      ItemList(),
      ItemList(),
      ItemList(),
      ItemList(),
    ],
  );
}

List<Category> category = [
  Category(
      name: "Investasi",
      description: "For Better Future",
      nominal: 1000,
      color: Colors.blue,
      icon: Icons.school_rounded),
  Category(
      name: "School",
      description: "For Better School",
      nominal: 1000,
      color: Colors.green,
      icon: Icons.school_rounded),
  Category(
      name: "Quarter Life Crissis",
      description: "For Better Future",
      nominal: 20000000,
      color: Colors.amber,
      icon: Icons.school_rounded),
];
