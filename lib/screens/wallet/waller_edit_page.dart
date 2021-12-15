import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:walleto/data/hive/wallet_boxes.dart';
import 'package:walleto/data/model/category.dart';
import 'package:walleto/data/model/wallet.dart';
import 'package:walleto/screens/home_page.dart';
import 'package:walleto/screens/widgets/custom_text_field.dart';
import 'package:walleto/shared/theme.dart';

import '../main_menu_page.dart';

class WalletEditPage extends StatefulWidget {
  static const routeName = "/wallet_edit_page";
  const WalletEditPage({Key? key}) : super(key: key);

  @override
  State<WalletEditPage> createState() => _WalletEditPageState();
}

class _WalletEditPageState extends State<WalletEditPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  Category? _selectedCategory;
  String? _nominalWallet;
  String? _currentNominal;
  int? _selectedId;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      final Wallet argument =
          ModalRoute.of(context)!.settings.arguments as Wallet;

      _nameController.text = argument.name;
      _descController.text = argument.decription;
      _selectedCategory = argument.category;
      _selectedId = argument.id;
      _nominalWallet = argument.nominal.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget _buildContent() {
      final Wallet argument =
          ModalRoute.of(context)!.settings.arguments as Wallet;

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
                      validator: (name) => name != null && name.isEmpty
                          ? 'Nama tidak boleh kosong'
                          : null,
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
                                  id: _selectedId!,
                                  name: _nameController.text,
                                  nominal: int.parse(_nominalWallet!),
                                  category: _selectedCategory!,
                                  decription: _descController.text,
                                  createdAt: argument.createdAt);
                              WalletBoxes.updateWallet(argument.id!, wallet);
                              Navigator.pushNamedAndRemoveUntil(
                                context,
                                HomePage.routeName,
                                (Route<dynamic> route) => false,
                                arguments: true,
                              );
                            } else {
                              const Center(
                                child: SpinKitFadingCircle(
                                    color: kBlueColor, size: 30.0),
                              );
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
            "Edit Wallet",
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
