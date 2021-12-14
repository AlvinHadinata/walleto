import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:walleto/data/model/wallet.dart';
import 'package:walleto/screens/target/target_add_page.dart';
import 'package:walleto/screens/target/target_detail_page.dart';
import 'package:walleto/screens/target/target_list_page.dart';
import 'package:walleto/screens/wallet/wallet_add_page.dart';
import 'package:walleto/screens/wallet/wallet_list_page.dart';
import 'package:walleto/screens/widgets/carousel.dart';
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
              item2(context),
              SizedBox(height: 5),
              carousel(),
              SizedBox(height: 5),
              item3(context),
              SizedBox(height: 5),
              savingList(context),
              savingList(context),
              savingList(context)
            ],
          ),
        ]),
      ),
    );
  }
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
                  style: whiteTextStyle.copyWith(
                      fontSize: 22, fontWeight: FontWeight.bold)),
            ],
          ),
        ));
  });
}

Widget saldo() {
  return Builder(builder: (BuildContext context) {
    return Container(
      height: 120,
      width: MediaQuery.of(context).size.width - 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: kBlueColor
      ),
      child:
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 100,
              width: 200,
              child: CarouselSlider(
                options: CarouselOptions(
                  scrollDirection: Axis.vertical,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: false,
                  initialPage: 0,
                  autoPlay: true,
                  autoPlayCurve: Curves.fastOutSlowIn
                ),
                items: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        children: [
                          Text('Saldo Wallet', style: blackTextStyle.copyWith(
                              fontSize: 13, fontWeight: bold)),
                          SizedBox(height: 10),
                          Text('Rp 15.000.000', style: blackTextStyle.copyWith(
                              fontSize: 15, fontWeight: FontWeight.bold))
                        ],
                      ),
                    )
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        children: [

                          Text('Saldo Saving', style: blackTextStyle.copyWith(
                              fontSize: 13, fontWeight: bold)),
                          SizedBox(height: 10),
                          Text('Rp 12.000.000', style: blackTextStyle.copyWith(
                              fontSize: 15, fontWeight: FontWeight.bold))
                        ],
                      ),
                    ),
                  ),
                ]),
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
                                  TargetAddPage.routeName,
                                );
                                ;
                              },
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Tambah Saving",
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
                                    context, WalletAddPage.routeName);
                              },
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Tambah Wallet",
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

Widget item2(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 17),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Daftar Wallet',
            style: blackTextStyle.copyWith(
                fontSize: 15, fontWeight: FontWeight.bold)),
        TextButton(onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return WalletListPage();
          }));
        }, child: Text('Lihat Semua', style: blackTextStyle.copyWith(
            fontSize: 15, fontWeight: FontWeight.bold, color: Colors.blue)))
      ],
    ),
  );
}

Widget carousel() {
  return Builder(builder: (BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        child: CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 2.5,
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

Widget item3(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 17),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Daftar Saving',
            style: blackTextStyle.copyWith(
                fontSize: 15, fontWeight: FontWeight.bold)),
        TextButton(onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return TargetListPage();
          }));
        }, child: Text('Lihat Semua', style: blackTextStyle.copyWith(
            fontSize: 15, fontWeight: FontWeight.bold, color: Colors.blue)))
      ],
    ),
  );
}

Widget savingList(BuildContext context){
  return InkWell(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return TargetDetailPage();
      }));
    },
    child: Container(
      margin: const EdgeInsets.only(bottom: 8.0),
      child: Material(
        color: kWhiteColor,
        shadowColor: Colors.grey[100],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 14.0,
            horizontal: 16.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Untuk beli Iphone",
                          style: blackTextStyle.copyWith(
                              fontSize: 18.0,
                              fontWeight: bold,
                              decoration: TextDecoration.none),
                        ),
                        Text(
                          "On Progress - 6 bulan",
                          style: blackTextStyle.copyWith(
                              fontSize: 16.0,
                              fontWeight: regular,
                              decoration: TextDecoration.none),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Rp 10.000.000",
                      style: blueTextSyle.copyWith(
                          fontSize: 18.0,
                          fontWeight: bold,
                          decoration: TextDecoration.none),
                    ),
                    Text(
                      "Prioritas Tinggi",
                      style: blackTextStyle.copyWith(
                          fontSize: 16.0,
                          fontWeight: regular,
                          decoration: TextDecoration.none),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}