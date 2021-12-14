import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:walleto/data/hive/saving_target_boxes.dart';
import 'package:walleto/data/hive/wallet_boxes.dart';
import 'package:walleto/data/model/category.dart';
import 'package:walleto/data/model/wallet.dart';
import 'package:walleto/screens/main_menu_page.dart';
import 'package:walleto/screens/widgets/custom_text_field.dart';
import 'package:walleto/shared/theme.dart';

class WalletAddPage extends StatefulWidget {
  static const routeName = "/wallet_add_page";

  @override
  State<WalletAddPage> createState() => _WalletAddPageState();
}

class _WalletAddPageState extends State<WalletAddPage> {
  @override
  Widget build(BuildContext context) {
    final Category argument =
        ModalRoute.of(context)!.settings.arguments as Category;
    final _formKey = GlobalKey<FormState>();
    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _descController = TextEditingController();
    final TextEditingController _nominalController = TextEditingController();
    Widget _buildContent() {
      return SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomTextField(
                      labelText: "Nama Wallet",
                      hintText: "Masukan Nama Wallet",
                      keyboardType: TextInputType.text,
                      controller: _nameController,
                      maxLines: 1,
                      validator: (name) =>
                          name != null && name.isEmpty ? 'Enter a name' : null,
                    ),
                    const SizedBox(height: 20),
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
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      labelText: "Deskripsi",
                      hintText: "Masukan Deskripsi",
                      keyboardType: TextInputType.multiline,
                      controller: _descController,
                      maxLines: 4,
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
                              Wallet wallet = Wallet(
                                  name: _nameController.text,
                                  nominal: int.parse(_nominalController.text),
                                  category: argument,
                                  decription: _descController.text,
                                  createdAt:
                                      DateTime.now().millisecondsSinceEpoch);
                              WalletBoxes.storeWallet(wallet);
                              Navigator.pushNamedAndRemoveUntil(
                                context,
                                MainMenuPage.routeName,
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
        ),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          backgroundColor: kBlueColor,
          elevation: 0.0,
          titleSpacing: 24.0,
          centerTitle: true,
          toolbarHeight: 80,
          title: Text(
            "Wallet",
            style: whiteTextStyle.copyWith(
              fontSize: 24,
              fontWeight: bold,
            ),
          ),
        ),
      ),
      body: SafeArea(child: _buildContent()),
    );
  }
}
