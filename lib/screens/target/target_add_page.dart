import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:walleto/screens/widgets/custom_text_field.dart';
import 'package:walleto/screens/widgets/custome_drop_down.dart';
import 'package:walleto/shared/theme.dart';

class TargetAddPage extends StatefulWidget {
  static const routeName = "/target_add_page";
  const TargetAddPage({Key? key}) : super(key: key);

  @override
  State<TargetAddPage> createState() => _TargetAddPageState();
}

class _TargetAddPageState extends State<TargetAddPage> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    TextEditingController _targetNameController = TextEditingController();
    TextEditingController _nominalController = TextEditingController();
    TextEditingController _periodController = TextEditingController();
    TextEditingController _descriptionController = TextEditingController();

    String? _selectedPriorityLevel;
    String? _selectedDurationType;

    bool _isSubmit = false;
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
                    labelText: "Nama Target",
                    hintText: "Masukan Nama Target",
                    keyboardType: TextInputType.text,
                    controller: _targetNameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Nama tidak boleh kosong';
                      }
                      return "";
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  CustomTextField(
                    labelText: "Nominal",
                    hintText: "Masukan Nominal",
                    keyboardType: TextInputType.number,
                    controller: _nominalController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Nominal tidak boleh kosong';
                      } else if (int.parse(value) < 1000) {
                        return 'Nominal Minimal Rp. 1000';
                      }
                      return "";
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: CustomTextField(
                          labelText: "Waktu",
                          hintText: "Masukan Waktu",
                          keyboardType: TextInputType.number,
                          controller: _periodController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Period tidak boleh kosong';
                            } else if (int.parse(value) == 0) {
                              return 'Period tidak boleh 0';
                            }
                            return "";
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Flexible(
                        flex: 1,
                        child: CustomDropdownField(
                          labelName: "Jangka",
                          hintText: "Pilih Jangka",
                          options: [
                            "Hari",
                            "Pekan",
                            "Bulan",
                            "Tahun",
                          ],
                          onChanged: (text) {
                            setState(() {
                              _selectedDurationType = text!;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  CustomDropdownField(
                    labelName: "Tingkat Prioritas",
                    hintText: "Pilih Tingkat Prioritas",
                    options: [
                      "Rendah",
                      "Sedang",
                      "Tinggi",
                    ],
                    onChanged: (text) {
                      setState(() {
                        _selectedPriorityLevel = text!;
                      });
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  CustomTextField(
                    labelText: "Deskripsi",
                    hintText: "Masukan Deskripsi",
                    keyboardType: TextInputType.text,
                    controller: _descriptionController,
                    maxLines: 4,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Deskripsi tidak boleh kosong';
                      }
                      return "";
                    },
                  ),
                  SizedBox(
                    height: 32,
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
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Processing Data')),
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
            "Target",
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
