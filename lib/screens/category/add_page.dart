import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:walleto/data/model/category.dart';
import 'package:walleto/shared/theme.dart';

class AddPage extends StatelessWidget {
  static const routeName = "/category/add_page";

  final Category category;

  const AddPage({required this.category});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _descController = TextEditingController();
    final TextEditingController _nominalController = TextEditingController();
    final TextEditingController _durasiController = TextEditingController();
    Widget _buildContent() {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  // Text(category.name, style: TextStyle(fontFamily: 'Nunito', fontSize: 20),), //nama kategori yang dipilih
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _nameController,
                    textAlignVertical: TextAlignVertical.center,
                    showCursor: true,
                    cursorColor: Theme.of(context).iconTheme.color,
                    decoration: InputDecoration(
                      hintText: 'Judul tabungan',
                      isCollapsed: true,
                      contentPadding: const EdgeInsets.all(16.0),
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: kBlueColor),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Tidak boleh kosong";
                      }
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _descController,
                    textAlignVertical: TextAlignVertical.center,
                    keyboardType: TextInputType.multiline,
                    maxLines: 5,
                    textAlign: TextAlign.justify,
                    showCursor: true,
                    cursorColor: Theme.of(context).iconTheme.color,
                    decoration: InputDecoration(
                      hintText: "Deskripsi tabungan",
                      isCollapsed: true,
                      contentPadding: const EdgeInsets.all(16.0),
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: kBlueColor,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Tidak boleh kosong';
                      }
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _nominalController,
                    textAlignVertical: TextAlignVertical.center,
                    keyboardType: TextInputType.number,
                    showCursor: true,
                    cursorColor: Theme.of(context).iconTheme.color,
                    decoration: InputDecoration(
                      hintText: "Nominal",
                      isCollapsed: true,
                      contentPadding: const EdgeInsets.all(16.0),
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: kBlueColor,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Tidak boleh kosong';
                      }
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _durasiController,
                    textAlignVertical: TextAlignVertical.center,
                    keyboardType: TextInputType.number,
                    showCursor: true,
                    cursorColor: Theme.of(context).iconTheme.color,
                    decoration: InputDecoration(
                      hintText: "Jangka waktu",
                      isCollapsed: true,
                      contentPadding: const EdgeInsets.all(16.0),
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: kBlueColor,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Tidak boleh kosong';
                      }
                    },
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
                          minimumSize: Size.fromHeight(40),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 14.0,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        onPressed: () {},
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
            "Saving",
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
