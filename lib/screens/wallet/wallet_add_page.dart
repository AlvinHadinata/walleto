import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:walleto/screens/widgets/custom_text_field.dart';
import 'package:walleto/shared/theme.dart';

class WalletAddPage extends StatelessWidget {
  static const routeName = "/wallet_add_page";

  @override
  Widget build(BuildContext context) {
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
                      hintText: "Masukan Nama Target",
                      keyboardType: TextInputType.text,
                      controller: _nameController,
                      maxLines: 1,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Nama tidak boleh kosong';
                        }
                        return "";
                      },
                    ),
                    SizedBox(height: 20),
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
                        return "";
                      },
                    ),
                    SizedBox(height: 20),
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
                        return "";
                      },
                    ),
                    SizedBox(height: 10),
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
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Processing Data')),
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
        preferredSize: const Size.fromHeight(65),
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
