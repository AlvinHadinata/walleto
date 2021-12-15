import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:walleto/data/hive/saving_target_boxes.dart';
import 'package:walleto/data/model/category.dart';
import 'package:walleto/data/model/saving_target.dart';
import 'package:walleto/screens/widgets/custom_text_field.dart';
import 'package:walleto/screens/widgets/custome_drop_down.dart';
import 'package:walleto/shared/theme.dart';

import '../main_menu_page.dart';

class TargetEditPage extends StatefulWidget {
  static const routeName = "/target_edit_page";

  @override
  State<TargetEditPage> createState() => _TargetEditPageState();
}

class _TargetEditPageState extends State<TargetEditPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _targetNameController = TextEditingController();
  TextEditingController _nominalController = TextEditingController();
  TextEditingController _periodController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  String? _selectedPriorityLevel;
  String? _selectedDurationType;
  Category? _selectedCategory;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      final SavingTarget argument =
          ModalRoute.of(context)!.settings.arguments as SavingTarget;
      _targetNameController.text = argument.nameTarget;
      _nominalController.text = argument.nominal.toString();
      _periodController.text = argument.period.toString();
      _descriptionController.text = argument.decription;
      _selectedCategory = argument.category;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget _buildContent() {
      final SavingTarget argument =
          ModalRoute.of(context)!.settings.arguments as SavingTarget;

      return SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Container(
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
                        return null;
                      },
                    ),
                    const SizedBox(
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
                        return null;
                      },
                    ),
                    const SizedBox(
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
                              } else if (_selectedDurationType == "Hari" &&
                                  int.parse(value) >= 31) {
                                return 'Pilih Ke Pekan';
                              } else if (_selectedDurationType == "Pekan" &&
                                  int.parse(value) >= 4) {
                                return 'Pilih Bulan';
                              } else if (_selectedDurationType == "Bulan" &&
                                  int.parse(value) >= 12) {
                                return 'Pilih Ke Tahun';
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Flexible(
                          flex: 1,
                          child: CustomDropdownField(
                            value: _selectedDurationType,
                            labelName: "Jangka",
                            hintText: "Pilih Jangka",
                            options: const [
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
                    const SizedBox(
                      height: 16,
                    ),
                    CustomDropdownField(
                      labelName: "Tingkat Prioritas",
                      value: _selectedPriorityLevel,
                      hintText: "Pilih Tingkat Prioritas",
                      options: const [
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
                    const SizedBox(
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
                        return null;
                      },
                    ),
                    const SizedBox(
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
                            minimumSize: const Size.fromHeight(40),
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
                              SavingTarget target = SavingTarget(
                                nameTarget: _targetNameController.text,
                                nominal: int.parse(_nominalController.text),
                                period: int.parse(_periodController.text),
                                durationType: _selectedDurationType == ""
                                    ? argument.durationType
                                    : _selectedDurationType!,
                                currentMoney: 0,
                                category: _selectedCategory!,
                                priority: _selectedPriorityLevel == ""
                                    ? argument.priority
                                    : _selectedPriorityLevel!,
                                decription: _descriptionController.text,
                                createdAt: argument.createdAt,
                              );
                              SavingTargetBoxes.updateSavingTarget(
                                  argument.id!, target);
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