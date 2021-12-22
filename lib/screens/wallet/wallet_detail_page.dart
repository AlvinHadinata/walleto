import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:walleto/data/hive/history_wallet_boxes.dart';
import 'package:walleto/data/hive/wallet_boxes.dart';
import 'package:walleto/data/model/history_wallet.dart';
import 'package:walleto/data/model/wallet.dart';
import 'package:walleto/screens/wallet/wallet_cash_page.dart';
import 'package:walleto/screens/wallet/wallet_edit_page.dart';
import 'package:walleto/screens/widgets/animation_placeholder.dart';
import 'package:walleto/screens/widgets/item_list.dart';
import 'package:walleto/shared/theme.dart';

import '../home_page.dart';

class WalletDetailPage extends StatelessWidget {
  static const routeName = "/wallet_detail_page";

  @override
  Widget build(BuildContext context) {
    final Wallet argument =
        ModalRoute.of(context)!.settings.arguments as Wallet;

    Widget _buildContent() {
      List<HistoryWallet> histories =
          Hive.box<HistoryWallet>('history_wallet').values.where((history) {
        return history.nameWallet == argument.name;
      }).toList();

      return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const ClampingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Column(children: [
                Container(
                  height: MediaQuery.of(context).size.height / 4,
                  decoration: BoxDecoration(
                    color: kBlueColor,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            SvgPicture.asset(
                              argument.category.icon,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  NumberFormat.currency(
                                    locale: 'id_ID',
                                    decimalDigits: 0,
                                    symbol: "Rp ",
                                  ).format(argument.nominal),
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: bold,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  argument.name,
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 18,
                                    fontWeight: bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(height: 30, color: kBlackPrimary),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Deskripsi',
                      style: blueTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: bold,
                      ),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      argument.decription,
                      style: blackTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: regular,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                const Divider(height: 30, color: kBlackPrimary),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "History",
                      style: blueTextStyle.copyWith(
                        fontWeight: bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2 ,
                  child: ValueListenableBuilder<Box<HistoryWallet>>(
                    valueListenable:
                        HistoryWalletBoxes.getHistoryWallet().listenable(),
                    builder: (context, Box<HistoryWallet> box, _) {
                      if (box.values.isEmpty) {
                        return AnimationPlaceholder(
                          animation: "assets/no_data.svg",
                          text: "Belum ada history",
                        );
                      } else {
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: histories.length,
                          itemBuilder: (_, index) {
                            return ItemList(
                              wallet: histories[index],
                            );
                          },
                        );
                      }
                    },
                  ),
                ),
              ])
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail Wallet',
          style: whiteTextStyle.copyWith(fontSize: 18, fontWeight: bold),
        ),
        centerTitle: true,
        backgroundColor: kBlueColor,
      ),
      body: _buildContent(),
      floatingActionButton: SpeedDial(
        iconTheme: const IconThemeData(color: kBlueColor),
        icon: Icons.settings_rounded,
        activeIcon: Icons.close_rounded,
        backgroundColor: kGradasi,
        animationSpeed: 200,
        children: [
          SpeedDialChild(
            child: const Icon(
              Icons.attach_money,
              color: kBlueColor,
            ),
            label: 'Saving',
            backgroundColor: kGradasi,
            onTap: () {
              Navigator.pushNamed(context, WalletCashPage.routeName,
                  arguments: argument);
            },
          ),
          SpeedDialChild(
            child: const Icon(Icons.edit_rounded, color: kBlueColor),
            label: 'Edit',
            backgroundColor: kGradasi,
            onTap: () {
              Navigator.pushNamed(context, WalletEditPage.routeName,
                  arguments: argument);
            },
          ),
          SpeedDialChild(
            child: const Icon(Icons.delete_forever_rounded, color: kBlueColor),
            label: 'Delete',
            backgroundColor: kGradasi,
            onTap: () {
              _deleteWalletModal(context, argument.id, argument.name);
            },
          ),
        ],
      ),
    );
  }

  void _deleteWalletModal(context, index, name) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(
            "Apakah kamu yakin ingin menghapus Wallet ini?",
            style: blackTextStyle.copyWith(
              fontSize: 16,
            ),
          ),
          actions: [
            ElevatedButton(
              child: Text(
                "Tidak",
                style: blackTextStyle.copyWith(fontWeight: bold),
              ),
              style: ElevatedButton.styleFrom(
                primary: kYellowColor,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 14.0,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            ElevatedButton(
              child: Text(
                "Iya",
                style: whiteTextStyle.copyWith(fontWeight: bold),
              ),
              style: ElevatedButton.styleFrom(
                primary: kRedColor,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 14.0,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onPressed: () {
                WalletBoxes.deleteWallet(index);
                HistoryWalletBoxes.deleteHistoryWallet(name);
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  HomePage.routeName,
                  (Route<dynamic> route) => false,
                );
              },
            ),
          ],
        );
      },
    );
  }
}
