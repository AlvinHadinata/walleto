import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:walleto/data/hive/saving_target_boxes.dart';
import 'package:walleto/data/hive/wallet_boxes.dart';
import 'package:walleto/data/model/saving_target.dart';

import 'package:walleto/data/model/wallet.dart';
import 'package:walleto/screens/category/category_page.dart';
import 'package:walleto/screens/target/saving_add_page.dart';
import 'package:walleto/screens/target/target_detail_page.dart';
import 'package:walleto/screens/target/target_list_page.dart';
import 'package:walleto/screens/wallet/wallet_detail_page.dart';
import 'package:walleto/screens/wallet/wallet_list_page.dart';
import 'package:walleto/screens/widgets/animation_placeholder.dart';
import 'package:walleto/screens/widgets/carousel.dart';
import 'package:walleto/screens/widgets/saving_item_widget.dart';
import 'package:walleto/shared/theme.dart';

class MainMenuPage extends StatelessWidget {
  static const routeName = "/main_menu_page";

  Widget _carousel(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: ValueListenableBuilder<Box<Wallet>>(
        valueListenable: WalletBoxes.getWallets().listenable(),
        builder: (context, Box<Wallet> box, _) {
          if (box.values.isEmpty) {
            return AnimationPlaceholder(
              animation: 'assets/no_data.svg',
              text: 'Tidak ada Wallet',
            );
          } else {
            return CarouselSlider.builder(
              itemCount: box.values.take(5).length,
              itemBuilder: (context, index, realIdx) {
                final Wallet wallet = box.getAt(index)!;
                return Carousel(
                  wallet: wallet,
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      WalletDetailPage.routeName,
                      arguments: Wallet(
                          id: index,
                          name: wallet.name,
                          nominal: wallet.nominal,
                          category: wallet.category,
                          decription: wallet.decription,
                          createdAt: wallet.createdAt),
                    );
                  },
                );
              },
              options: CarouselOptions(
                aspectRatio: 2.5,
                enlargeCenterPage: true,
                enableInfiniteScroll: false,
                initialPage: 4,
                autoPlay: true,
              ),
            );
          }
        },
      ),
    );
  }

  Widget _background(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width / 2,
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        kGradasi,
        kBlueColor,
      ], begin: Alignment.bottomRight)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Walleto',
              style: whiteTextStyle.copyWith(
                  fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _savingList(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: ValueListenableBuilder<Box<SavingTarget>>(
        valueListenable: SavingTargetBoxes.getSavingTarget().listenable(),
        builder: (context, Box<SavingTarget> box, _) {
          if (box.values.isEmpty) {
            return AnimationPlaceholder(
              animation: "assets/no_data.json",
              text: "Anda Tidak mempunyai target tabungan",
            );
          } else {
            return ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: box.values.take(5).length,
              itemBuilder: (_, index) {
                final SavingTarget saving = box.getAt(index)!;
                return Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: SavingItemWidget(
                    targetName: saving.nameTarget,
                    nominal: saving.nominal,
                    durationType: saving.durationType,
                    period: saving.period,
                    category: saving.category,
                    currentMoney: saving.currentMoney,
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        TargetDetailPage.routeName,
                      );
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }

  Widget _saldo(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 45,
      decoration: const BoxDecoration(
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
                    style: whiteTextStyle.copyWith(
                        fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Text('Rp 0',
                    style: whiteTextStyle.copyWith(
                        fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            ),
            _addButton(context)
          ],
        ),
      ),
    );
  }

  Widget _addButton(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.add, color: Colors.black),
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
          builder: (context) {
            return Container(
              width: double.infinity,
              height: 250,
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
                  const SizedBox(
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
                              child: const Icon(
                                Icons.savings_rounded,
                                size: 30.0,
                              ),
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, CategoryPage.routeName,
                                    arguments: false);
                              },
                            ),
                          ),
                          const SizedBox(
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
                              child: const Icon(Icons.add_rounded),
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, CategoryPage.routeName,
                                    arguments: true);
                              },
                            ),
                          ),
                          const SizedBox(
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
                  const SizedBox(height: 24),
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
                              child: const Icon(
                                Icons.savings_rounded,
                                size: 30.0,
                              ),
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  SavingAddPage.routeName,
                                );
                              },
                            ),
                          ),
                          const SizedBox(
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
                              child: const Icon(Icons.add_rounded),
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, CategoryPage.routeName,
                                    arguments: true);
                              },
                            ),
                          ),
                          const SizedBox(
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
  }

  Widget _buildContent(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          _background(context),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 130.0,
                ),
                _saldo(context),
                const SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Daftar Wallet',
                      style: blackTextStyle.copyWith(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return WalletListPage();
                        }));
                      },
                      child: Text(
                        'Lihat Semua',
                        style: blackTextStyle.copyWith(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 15.0),
                _carousel(context),
                const SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Daftar Saving',
                      style: blackTextStyle.copyWith(
                          fontSize: 15, fontWeight: bold),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          TargetListPage.routeName,
                        );
                      },
                      child: Text(
                        'Lihat Semua',
                        style: blueTextSyle.copyWith(
                          fontSize: 15,
                          fontWeight: bold,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 15.0),
                // _savingList(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildContent(context),
    );
  }
}

// Widget savingList(BuildContext context) {
//   return InkWell(
//     onTap: () {
//       Navigator.push(context, MaterialPageRoute(builder: (context) {
//         return TargetDetailPage();
//       }));
//     },
//     child: Container(
//       margin: const EdgeInsets.only(bottom: 8.0),
//       child: Material(
//         color: kWhiteColor,
//         shadowColor: Colors.grey[100],
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(15.0),
//         ),
//         child: Container(
//           padding: const EdgeInsets.symmetric(
//             vertical: 14.0,
//             horizontal: 16.0,
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             // crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               Row(
//                 children: [
//                   Container(
//                     margin: const EdgeInsets.only(left: 8.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Text(
//                           "Untuk beli Iphone",
//                           style: blackTextStyle.copyWith(
//                               fontSize: 18.0,
//                               fontWeight: bold,
//                               decoration: TextDecoration.none),
//                         ),
//                         Text(
//                           "On Progress - 6 bulan",
//                           style: blackTextStyle.copyWith(
//                               fontSize: 16.0,
//                               fontWeight: regular,
//                               decoration: TextDecoration.none),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//               Container(
//                 margin: const EdgeInsets.only(left: 8.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Text(
//                       "Rp 10.000.000",
//                       style: blueTextSyle.copyWith(
//                           fontSize: 18.0,
//                           fontWeight: bold,
//                           decoration: TextDecoration.none),
//                     ),
//                     Text(
//                       "Prioritas Tinggi",
//                       style: blackTextStyle.copyWith(
//                           fontSize: 16.0,
//                           fontWeight: regular,
//                           decoration: TextDecoration.none),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     ),
//   );
// }
