import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:walleto/shared/theme.dart';

class SavingAddPage extends StatefulWidget {
  static const routeName = "/saving_add_page";
  const SavingAddPage({Key? key}) : super(key: key);

  @override
  State<SavingAddPage> createState() => _SavingAddPageState();
}

class _SavingAddPageState extends State<SavingAddPage> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    DateTime _selectedDate;
    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _nominalController = TextEditingController();

    Widget _buildContent() {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameController,
                    textAlignVertical: TextAlignVertical.center,
                    showCursor: true,
                    cursorColor: Theme.of(context).iconTheme.color,
                    decoration: InputDecoration(
                      hintText: 'Investasi Emas',
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
                  TextFormField(
                    controller: _nominalController,
                    textAlignVertical: TextAlignVertical.center,
                    keyboardType: TextInputType.number,
                    showCursor: true,
                    cursorColor: Theme.of(context).iconTheme.color,
                    decoration: InputDecoration(
                      hintText: "1000.000",
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
                  Container(
                    alignment: Alignment.bottomCenter,
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 16.0,
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
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          elevation: 0.0,
          titleSpacing: 24.0,
          centerTitle: true,
          toolbarHeight: 80,
          leading: CircleAvatar(
              radius: 24.0,
              backgroundColor: Theme.of(context)
                  .colorScheme
                  .primaryVariant
                  .withOpacity(0.6)),
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
