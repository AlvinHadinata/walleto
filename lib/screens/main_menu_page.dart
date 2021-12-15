import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:walleto/data/hive/history_wallet_boxes.dart';
import 'package:walleto/data/hive/saving_target_boxes.dart';
import 'package:walleto/data/hive/wallet_boxes.dart';
import 'package:walleto/data/model/history_wallet.dart';
import 'package:walleto/data/model/saving_target.dart';
import 'package:walleto/data/model/wallet.dart';
import 'package:walleto/screens/category/category_page.dart';
import 'package:walleto/screens/target/target_cash_page.dart';
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
              text: 'Belum ada Wallet',
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

  Widget _savingListItem(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: ValueListenableBuilder<Box<SavingTarget>>(
        valueListenable: SavingTargetBoxes.getSavingTarget().listenable(),
        builder: (context, Box<SavingTarget> box, _) {
          if (box.values.isEmpty) {
            return AnimationPlaceholder(
              animation: "assets/no_data.svg",
              text: "Anda belum mempunyai target tabungan",
            );
          } else {
            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: box.values.take(5).length,
              itemBuilder: (_, index) {
                final SavingTarget saving = box.getAt(index)!;
                return SavingItemWidget(
                  saving: saving,
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      TargetDetailPage.routeName,
                      arguments: SavingTarget(
                          id: index,
                          nameTarget: saving.nameTarget,
                          nominal: saving.nominal,
                          period: saving.period,
                          durationType: saving.durationType,
                          currentMoney: saving.currentMoney,
                          category: saving.category,
                          priority: saving.priority,
                          decription: saving.decription,
                          createdAt: saving.createdAt),
                    );
                  },
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
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          height: 90,
          width: MediaQuery.of(context).size.width / 1.5,
          child: CarouselSlider(
              options: CarouselOptions(
                  scrollDirection: Axis.vertical,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: false,
                  initialPage: 0,
                  autoPlay: false,
                  autoPlayCurve: Curves.fastOutSlowIn),
              items: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(14),
                    child: Row(
                      children: [
                        ValueListenableBuilder<Box<Wallet>>(
                          valueListenable:
                              WalletBoxes.getWallets().listenable(),
                          builder: (context, Box<Wallet> box, _) {
                            int currentMoney = box.values.fold(
                                0, (sum, walletBox) => sum + walletBox.nominal);
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Saldo Wallet',
                                  style: blackTextStyle.copyWith(
                                    fontSize: 14,
                                    fontWeight: medium,
                                  ),
                                ),
                                Text(
                                  NumberFormat.currency(
                                    locale: 'id_ID',
                                    decimalDigits: 0,
                                    symbol: "Rp ",
                                  ).format(currentMoney),
                                  style: blackTextStyle.copyWith(
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(14),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Saldo Saving',
                              style: blackTextStyle.copyWith(
                                fontSize: 14,
                                fontWeight: medium,
                              ),
                            ),
                            Text(
                              'Rp 15.000.000',
                              style: blackTextStyle.copyWith(
                                fontSize: 18,
                                fontWeight: bold,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
        ),
      ),
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
                          color: Colors.blue,
                        ),
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
                _savingListItem(context),
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
