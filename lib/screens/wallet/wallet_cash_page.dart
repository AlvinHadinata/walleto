import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:walleto/data/hive/history_wallet_boxes.dart';
import 'package:walleto/data/hive/wallet_boxes.dart';
import 'package:walleto/data/model/history_wallet.dart';
import 'package:walleto/data/model/wallet.dart';
import 'package:walleto/screens/home_page.dart';
import 'package:walleto/screens/widgets/custom_text_field.dart';
import 'package:walleto/shared/theme.dart';

class WalletCashPage extends StatefulWidget {
  static const routeName = "wallet_cash_page";

  @override
  State<WalletCashPage> createState() => _WalletCashPageState();
}

class _WalletCashPageState extends State<WalletCashPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _catatanController = TextEditingController();
  final TextEditingController _nominalController = TextEditingController();
  bool? cashIn = true;
  @override
  Widget build(BuildContext context) {
    final Wallet argument =
        ModalRoute.of(context)!.settings.arguments as Wallet;

    Widget _buildContent() {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextField(
                    labelText: "Nominal",
                    hintText: "Masukan Nominal",
                    keyboardType: TextInputType.number,
                    controller: _nominalController,
                    inputFormatter: [FilteringTextInputFormatter.digitsOnly],
                    maxLines: 1,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Nominal tidak boleh kosong';
                      } else if (int.parse(value) < 1000) {
                        return 'Nominal Minimal Rp. 1000';
                      } else if ((cashIn == false) &&
                          (int.parse(value) > argument.nominal)) {
                        return 'Saldo tidak mencukupi';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    labelText: "Catatan",
                    hintText: "Masukan Catatan",
                    controller: _catatanController,
                    maxLines: 1,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Deskripsi tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Radio<bool>(
                              value: false,
                              groupValue: cashIn,
                              onChanged: (value) =>
                                  setState(() => cashIn = value!),
                            ),
                            Expanded(
                              child: Text('Expense',
                                  style: greyTextStyle.copyWith(
                                      fontSize: 16,
                                      fontWeight: bold,
                                      color: kRedColor)),
                            )
                          ],
                        ),
                        flex: 1,
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Radio<bool>(
                              value: true,
                              activeColor: kBlueColor,
                              groupValue: cashIn,
                              onChanged: (value) =>
                                  setState(() => cashIn = value!),
                            ),
                            Expanded(
                              child: Text(
                                'Income',
                                style: greyTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: bold,
                                    color: kGreenColor),
                              ),
                            )
                          ],
                        ),
                        flex: 1,
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 24.0,
                      ),
                      child: ElevatedButton(
                        child: Text(
                          'Simpan',
                          style: whiteTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: medium,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: kBlueColor,
                          minimumSize: const Size.fromHeight(40),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 14.0,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        onPressed: () async {
                          final isValid = _formKey.currentState!.validate();

                          if (isValid) {
                            HistoryWallet history = HistoryWallet(
                              nameWallet: argument.name,
                              nominal: int.parse(_nominalController.text),
                              description: _catatanController.text,
                              cashIn: cashIn,
                              createdAt: DateTime.now().microsecondsSinceEpoch,
                            );

                            HistoryWalletBoxes.storeHistoryWallet(history);
                            if (cashIn == true) {
                              WalletBoxes.updateCashIn(
                                  argument.id!, argument, history.nominal);
                            } else {
                              WalletBoxes.updateCashOut(
                                  argument.id!, argument, history.nominal);
                            }
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              HomePage.routeName,
                              (Route<dynamic> route) => false,
                              arguments: true,
                            );
                          } else {
                            const SpinKitFadingCircle(
                                color: kBlueColor, size: 30.0);
                          }
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          backgroundColor: kBlueColor,
          elevation: 0.0,
          titleSpacing: 24.0,
          centerTitle: true,
          toolbarHeight: 80,
          title: Text(
            argument.name,
            style: whiteTextStyle.copyWith(
              fontSize: 24,
              fontWeight: bold,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(child: SafeArea(child: _buildContent())),
    );
  }
}
