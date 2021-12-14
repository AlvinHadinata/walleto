import 'package:flutter/material.dart';
import 'package:walleto/data/model/wallet.dart';

class WalletCashPage extends StatefulWidget {
  static const routeName = "wallet_cash_page";

  @override
  State<WalletCashPage> createState() => _WalletCashPageState();
}

class _WalletCashPageState extends State<WalletCashPage> {
  Widget _buildContent(BuildContext context) {
    final Wallet argument =
        ModalRoute.of(context)!.settings.arguments as Wallet;

    return Column(
      children: [
        // RadioListTile<bool>(
        //   title: Text('Expense'),
        //   value: true,
        //   groupValue: isExpense,
        //   onChanged: (value) => setState(() => isExpense = value!),
        // ),
        // RadioListTile<bool>(
        //   title: Text('Income'),
        //   value: false,
        //   groupValue: isExpense,
        //   onChanged: (value) => setState(() => isExpense = value!),
        // ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
