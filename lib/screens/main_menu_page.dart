import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:walleto/data/model/category.dart';
import 'package:walleto/data/model/wallet.dart';
import 'package:walleto/screens/target/target_add_page.dart';
import 'package:walleto/screens/target/saving_add_page.dart';
import 'package:walleto/screens/wallet/wallet_add_page.dart';
import 'package:walleto/screens/widgets/carousel.dart';
import 'package:walleto/screens/widgets/item_list.dart';
import 'package:walleto/shared/theme.dart';

//SAVING YANG BERJANGKA
//CATEGORY YANG TIDAK BERJANGKA

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
              aspectRatio: 3,
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
              initialPage: 4,
              autoPlay: true,
            ),
            items: Wallet.wallet
                .map((wallets) => Carousel(wallet: wallets))
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
          color: kBlueColor,
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
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(24),
              topLeft: Radius.circular(24),
            ),
          ),
          builder: (BuildContext context) {
            return Container(
              width: double.infinity,
              height: 150,
              padding: const EdgeInsets.only(
                top: 10,
              ),
              child: Column(
                children: [
                  Container(
                    width: 135,
                    height: 4.5,
                    decoration: BoxDecoration(
                      color: kBlueColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            width: 60,
                            height: 60,
                            child: FloatingActionButton(
                              backgroundColor: kBlueColor,
                              child: Icon(
                                Icons.add_a_photo,
                                size: 30.0,
                              ),
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  WalletAddPage.routeName,
                                );
                                ;
                              },
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Buat Target Baru",
                            style: blackTextStyle.copyWith(
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            width: 60,
                            height: 60,
                            child: FloatingActionButton(
                              backgroundColor: kBlueColor,
                              child: Icon(Icons.add_rounded),
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, TargetAddPage.routeName);
                              },
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Tambah Tabungan",
                            style: blackTextStyle.copyWith(
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );

Widget item2() {
  return Padding(
    padding: const EdgeInsets.only(left: 25.0),
    child: Row(
      children: [
        Column(
          children: [
            Text('Daftar Tabungan Berjangka',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0,
                  fontFamily: 'Nunito',
                )),
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
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0,
                  fontFamily: 'Nunito',
                )),
          ],
        ),
      ],
    ),
  );
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
