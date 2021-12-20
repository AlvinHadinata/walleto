import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:walleto/data/hive/history_target_boxes.dart';
import 'package:walleto/data/hive/saving_target_boxes.dart';
import 'package:walleto/data/model/history_target.dart';
import 'package:walleto/data/model/saving_target.dart';
import 'package:walleto/screens/main_menu_page.dart';
import 'package:walleto/screens/widgets/custom_text_field.dart';
import 'package:walleto/shared/theme.dart';

import '../home_page.dart';

class TargetCashPage extends StatefulWidget {
  static const routeName = "/target_cash_page";

  @override
  State<TargetCashPage> createState() => _TargetCashPageState();
}

class _TargetCashPageState extends State<TargetCashPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _catatanController = TextEditingController();
  final TextEditingController _nominalController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final SavingTarget argument =
        ModalRoute.of(context)!.settings.arguments as SavingTarget;

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
                    hintText: "Masukan Nominal Awal",
                    keyboardType: TextInputType.number,
                    controller: _nominalController,
                    maxLines: 1,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Nominal tidak boleh kosong';
                      } else if (int.parse(value) < 1000) {
                        return 'Nominal Minimal Rp. 1000';
                      } else if (int.parse(value) >
                          (argument.nominal - argument.currentMoney)) {
                        return 'Terlalu besar dari target';
                      }
                      return null;
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
                          minimumSize: Size.fromHeight(40),
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
                            HistoryTarget history = HistoryTarget(
                              nameTarget: argument.nameTarget,
                              nominal: int.parse(_nominalController.text),
                              description: _catatanController.text,
                              createdAt: DateTime.now().microsecondsSinceEpoch,
                            );

                            HistoryTargetBoxes.storeHistoryTarget(history);
                            SavingTargetBoxes.updateCurrentMoneySaving(
                                argument.id!, argument, history.nominal);

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
            argument.nameTarget,
            style: whiteTextStyle.copyWith(
              fontSize: 24,
              fontWeight: bold,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: SafeArea(
              child: _buildContent())),
    );
  }
}
