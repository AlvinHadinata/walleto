import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:walleto/data/hive/wallet_boxes.dart';
import 'package:walleto/data/model/history_wallet.dart';
import 'package:walleto/data/model/wallet.dart';
import 'package:walleto/screens/main_menu_page.dart';
import 'package:walleto/screens/wallet/waller_edit_page.dart';
import 'package:walleto/screens/wallet/wallet_cash_page.dart';
import 'package:walleto/shared/theme.dart';

class WalletDetailPage extends StatelessWidget {
  static const routeName = "/wallet_detail_page";

  Widget _buildContent(BuildContext context) {
    final Wallet argument =
        ModalRoute.of(context)!.settings.arguments as Wallet;

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
                  color: kLightGreyColor,
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
                          Container(
                            width: 50.0,
                            height: 40.0,
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.blue.withOpacity(.8),
                                shape: BoxShape.rectangle),
                            child: SvgPicture.asset(
                              argument.category.icon,
                            ),
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
                                style: blackTextStyle.copyWith(
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
                                "Wallet Name",
                                style: whiteTextStyle.copyWith(
                                    fontSize: 18.0, fontWeight: regular),
                              ),
                              Text(
                                argument.name,
                                style: whiteTextStyle.copyWith(
                                  fontSize: 22,
                                  fontWeight: bold,
                                ),
                              ),
                            ],
                          ),
                          FloatingActionButton(
                              child: const Icon(
                                Icons.attach_money_rounded,
                                color: kWhiteColor,
                              ),
                              elevation: 0.0,
                              backgroundColor: kBlueColor,
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, WalletCashPage.routeName,
                                    arguments: argument);
                              }),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    child: Text(
                      'Update',
                      style: whiteTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: medium,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: kBlueColor,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 14.0,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, WalletEditPage.routeName,
                          arguments: argument);
                    },
                  ),
                  ElevatedButton(
                    child: Text(
                      'Delete',
                      style: whiteTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: medium,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: kBlueColor,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 14.0,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onPressed: () {
                      _deleteWalletModal(context, argument.id);
                    },
                  )
                ],
              ),
            ])
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail Wallet',
          style: whiteTextStyle.copyWith(fontSize: 18, fontWeight: bold),
        ),
        centerTitle: true,
        backgroundColor: kBlueColor,
      ),
      body: _buildContent(context),
    );
  }

  void _deleteWalletModal(context, index) {
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

                Navigator.pushNamedAndRemoveUntil(
                  context,
                  MainMenuPage.routeName,
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
