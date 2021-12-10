import 'package:flutter/material.dart';
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
    );
  }
}