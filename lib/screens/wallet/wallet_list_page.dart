import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:walleto/data/hive/wallet_boxes.dart';
import 'package:walleto/data/model/wallet.dart';
import 'package:walleto/screens/wallet/wallet_detail_page.dart';
import 'package:walleto/screens/widgets/animation_placeholder.dart';
import 'package:walleto/screens/widgets/wallet_item_widget.dart';
import 'package:walleto/shared/theme.dart';

class WalletListPage extends StatelessWidget{
static const routeName = "/wallet_list_page";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:
          Text('Daftar Wallet', style: whiteTextStyle.copyWith(
              fontSize: 18, fontWeight: FontWeight.bold)),
          centerTitle: true,
          backgroundColor: kBlueColor),
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Padding(padding: EdgeInsets.all(20),
            child: _walletListItem(context)
        ),
      ),
    );
  }
}

Widget _walletListItem(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height / 2.3,
    child: ValueListenableBuilder<Box<Wallet>>(
      valueListenable: WalletBoxes.getWallets().listenable(),
      builder: (context, Box<Wallet> box, _) {
        if (box.values.isEmpty) {
          return AnimationPlaceholder(
            animation: "assets/no_data.svg",
            text: "Belum ada wallet",
          );
        } else {
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: box.values.length,
            itemBuilder: (_, index) {
              final Wallet wallet = box.getAt(index)!;
              return WalletItemWidget(
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
          );
        }
      },
    ),
  );
}