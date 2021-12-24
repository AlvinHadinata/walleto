import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:walleto/data/hive/history_target_boxes.dart';
import 'package:walleto/data/hive/history_wallet_boxes.dart';
import 'package:walleto/data/hive/note_boxes.dart';
import 'package:walleto/data/hive/saving_target_boxes.dart';
import 'package:walleto/data/hive/wallet_boxes.dart';
import 'package:walleto/data/model/history_target.dart';
import 'package:walleto/data/model/history_wallet.dart';
import 'package:walleto/data/model/note.dart';
import 'package:walleto/data/model/saving_target.dart';
import 'package:walleto/data/model/wallet.dart';
import 'package:walleto/screens/notes/note_page.dart';
import 'package:walleto/screens/target/target_detail_page.dart';
import 'package:walleto/screens/target/target_list_page.dart';
import 'package:walleto/screens/wallet/wallet_detail_page.dart';
import 'package:walleto/screens/wallet/wallet_list_page.dart';
import 'package:walleto/screens/widgets/animation_placeholder.dart';
import 'package:walleto/screens/widgets/carousel.dart';
import 'package:walleto/screens/widgets/saving_item_widget.dart';
import 'package:walleto/shared/theme.dart';

import 'notes/note_edit_page.dart';

class MainMenuPage extends StatelessWidget {
  static const routeName = "/main_menu_page";
  final int _walletLength = Hive.box<Wallet>('wallets').values.length;
  final int _savingLength =
      Hive.box<SavingTarget>('savings_targets').values.length;
  final int _noteLength = Hive.box<Note>('notes').values.length;

  Widget _background(BuildContext context) {
    int hour = DateTime.now().hour;
    return Container(
      height: MediaQuery.of(context).size.width / 2,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            kBlueColor,
            kWhiteColor,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              (hour >= 0 && hour < 12)
                  ? 'Selamat Pagi'
                  : (hour >= 12 && hour < 15)
                      ? 'Selamat Siang'
                      : (hour >= 15 && hour < 18)
                          ? 'Selamat Sore'
                          : 'Selamat Malam',
              style: blackTextStyle.copyWith(
                fontWeight: bold,
                fontSize: 22,
              ),
            ),
          ],
        ),
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
          height: MediaQuery.of(context).size.height / 6,
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
                  padding: const EdgeInsets.all(10),
                  child: ValueListenableBuilder<Box<Wallet>>(
                    valueListenable: WalletBoxes.getWallets().listenable(),
                    builder: (context, Box<Wallet> box, _) {
                      int currentMoney = box.values
                          .fold(0, (sum, walletBox) => sum + walletBox.nominal);
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
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
                                  fontWeight: bold,
                                ),
                              ),
                            ],
                          ),
                          ValueListenableBuilder<Box<HistoryWallet>>(
                            valueListenable:
                                HistoryWalletBoxes.getHistoryWallet()
                                    .listenable(),
                            builder:
                                (context, Box<HistoryWallet> boxWallet, _) {
                              int cashInMoney = boxWallet.values.where(
                                  (targetBox) {
                                int historyDate =
                                    DateTime.fromMicrosecondsSinceEpoch(
                                            targetBox.createdAt)
                                        .day;
                                bool? cashIn = targetBox.cashIn;
                                int currentDate = DateTime.now().day;
                                return historyDate == currentDate &&
                                    cashIn == true;
                              }).fold(0,
                                  (sum, histories) => sum + histories.nominal);
                              int cashOutMoney = boxWallet.values.where(
                                  (targetBox) {
                                int historyDate =
                                    DateTime.fromMicrosecondsSinceEpoch(
                                            targetBox.createdAt)
                                        .day;
                                bool? cashIn = targetBox.cashIn;
                                int currentDate = DateTime.now().day;
                                return historyDate == currentDate &&
                                    cashIn == false;
                              }).fold(0,
                                  (sum, histories) => sum + histories.nominal);
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Hari Ini',
                                    style: blackTextStyle.copyWith(
                                      fontSize: 12,
                                      fontWeight: medium,
                                    ),
                                  ),
                                  Text(
                                    "+ " +
                                        NumberFormat.currency(
                                          locale: 'id_ID',
                                          decimalDigits: 0,
                                          symbol: "Rp ",
                                        ).format(cashInMoney),
                                    style: greyTextStyle.copyWith(
                                        fontSize: 14,
                                        fontWeight: bold,
                                        color: kGreenColor),
                                  ),
                                  Text(
                                    "- " +
                                        NumberFormat.currency(
                                          locale: 'id_ID',
                                          decimalDigits: 0,
                                          symbol: "Rp ",
                                        ).format(cashOutMoney),
                                    style: greyTextStyle.copyWith(
                                        fontSize: 14,
                                        fontWeight: bold,
                                        color: kRedColor),
                                  ),
                                ],
                              );
                            },
                          )
                        ],
                      );
                    },
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: ValueListenableBuilder<Box<HistoryTarget>>(
                    valueListenable:
                        HistoryTargetBoxes.getHistoryTarget().listenable(),
                    builder: (context, Box<HistoryTarget> box, _) {
                      int currentMoney = box.values.fold(
                          0, (sum, historyBox) => sum + historyBox.nominal);
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Saldo Saving',
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
                                  fontWeight: bold,
                                ),
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Hari Ini',
                                style: blackTextStyle.copyWith(
                                  fontSize: 14,
                                  fontWeight: medium,
                                ),
                              ),
                              Text(
                                "+ " +
                                    NumberFormat.currency(
                                      locale: 'id_ID',
                                      decimalDigits: 0,
                                      symbol: "Rp ",
                                    ).format(currentMoney),
                                style: blackTextStyle.copyWith(
                                  fontSize: 14,
                                  fontWeight: bold,
                                  color: kGreenColor,
                                ),
                              )
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

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
              itemCount: box.values.take(3).length,
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
                          createdAt: wallet.createdAt,
                          foreign: wallet.foreign),
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

  Widget _savingListItem(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 2.3,
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
              itemCount: box.values.take(3).length,
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
                        createdAt: saving.createdAt,
                        foreign: saving.foreign,
                      ),
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

  Widget listNotes(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 2.3,
      child: ValueListenableBuilder<Box<Note>>(
        valueListenable: NoteBoxes.getNotes().listenable(),
        builder: (context, Box<Note> box, _) {
          if (box.values.isEmpty) {
            return Column(
              children: [
                const SizedBox(height: 30),
                AnimationPlaceholder(
                  animation: "assets/no_data.svg",
                  text: "Belum ada catatan",
                ),
              ],
            );
          } else {
            return ListView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemCount: box.values.take(3).length,
              itemBuilder: (context, index) {
                final note = box.getAt(index)!;
                return Dismissible(
                  key: Key(index.toString()),
                  background: Container(color: Colors.red),
                  onDismissed: (direction) {
                    NoteBoxes.deleteNote(index);
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: const BorderSide(
                        color: kBlueColor,
                        width: 1,
                      ),
                    ),
                    child: ListTile(
                      title: Text(
                        note.title,
                        style: blackTextStyle.copyWith(
                          fontWeight: bold,
                          fontSize: 16.0,
                        ),
                      ),
                      subtitle: Text(
                        note.description,
                        style: lightGreyTextStyle.copyWith(
                          fontSize: 14.0,
                        ),
                      ),
                      onTap: () async {
                        Navigator.pushNamed(
                          context,
                          NoteEditPage.routeName,
                          arguments: Note(
                            id: index,
                            title: note.title,
                            description: note.description,
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            );
          }
        },
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 130.0,
                ),
                _saldo(context),
                const SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 4,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: kBlueColor),
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Column(
                          children: [
                            Text(
                              "Wallet",
                              style: whiteTextStyle.copyWith(
                                  fontSize: 18, fontWeight: bold),
                            ),
                            Text(
                              _walletLength.toString(),
                              style: whiteTextStyle.copyWith(
                                  fontSize: 18, fontWeight: bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 4,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: kBlueColor),
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Column(
                          children: [
                            Text(
                              "Saving",
                              style: whiteTextStyle.copyWith(
                                  fontSize: 18, fontWeight: bold),
                            ),
                            Text(
                              _savingLength.toString(),
                              style: whiteTextStyle.copyWith(
                                  fontSize: 18, fontWeight: bold),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 4,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: kBlueColor),
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Column(
                          children: [
                            Text(
                              "Notes",
                              style: whiteTextStyle.copyWith(
                                  fontSize: 18, fontWeight: bold),
                            ),
                            Text(
                              _noteLength.toString(),
                              style: whiteTextStyle.copyWith(
                                  fontSize: 18, fontWeight: bold),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
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
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return TargetListPage();
                        }));
                      },
                      child: Text(
                        'Lihat Semua',
                        style: blackTextStyle.copyWith(
                            fontSize: 15, fontWeight: bold, color: Colors.blue),
                      ),
                    )
                  ],
                ),
                _savingListItem(context),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Daftar Catatan',
                      style: blackTextStyle.copyWith(
                          fontSize: 15, fontWeight: bold),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return NotePage();
                        }));
                      },
                      child: Text(
                        'Lihat Semua',
                        style: blackTextStyle.copyWith(
                            fontSize: 15, fontWeight: bold, color: Colors.blue),
                      ),
                    )
                  ],
                ),
                listNotes(context),
                const SizedBox(height: 100)
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
