import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:walleto/screens/widgets/custom_text_field.dart';
import 'package:walleto/screens/widgets/item_list.dart';
import 'package:walleto/shared/theme.dart';

class WalletDetailPage extends StatelessWidget {
  static const routeName = "/wallet_detail_page";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Detail Wallet',
              style: whiteTextStyle.copyWith(
                  fontSize: 18, fontWeight: FontWeight.bold)),
          centerTitle: true,
          backgroundColor: kBlueColor),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: ClampingScrollPhysics(),
        child: Column(
          children: [SizedBox(height: 20), detailSaldo(), riwayat()],
        ),
      ),
    );
  }

  Widget detailSaldo() {
    final TextEditingController _modalController = TextEditingController();
    final _formKey = GlobalKey<FormState>();
    return Builder(builder: (BuildContext context) {
      return Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 4,
            margin: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: kLightGreyColor,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        width: 50.0,
                        height: 40.0,
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blue.withOpacity(.8),
                            shape: BoxShape.rectangle),
                        child: Icon(
                          Icons.attach_money_rounded,
                          size: 20.0,
                          color: Colors.amber,
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "RP. 100000",
                            style: whiteTextStyle.copyWith(
                                fontSize: 15, fontWeight: regular),
                          )
                        ],
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Investasi",
                        style: whiteTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: bold,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(24),
                                topLeft: Radius.circular(24),
                              ),
                            ),
                            builder: (BuildContext context) {
                              return Container(
                                width: double.infinity,
                                height: 150,
                                padding: const EdgeInsets.only(
                                  top: 10,
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      width: 135,
                                      height: 4.5,
                                      decoration: BoxDecoration(
                                        color: kBlueColor,
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                    ),
                                    SizedBox(height: 24),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text('Masukkan jumlah cash in',
                                          style: blackTextStyle.copyWith(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Form(
                                            key: _formKey,
                                            child: Column(children: [
                                              CustomTextField(
                                                  labelText: '',
                                                  hintText: 'Rp ...',
                                                  controller: _modalController,
                                                  validator: (value) {
                                                    if (value!.isEmpty) {
                                                      return 'Tidak boleh kosong';
                                                    }
                                                    return "";
                                                  }),
                                            ]))
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        child: Text('Cash In'),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.lightGreen)),
                    ElevatedButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(24),
                                topLeft: Radius.circular(24),
                              ),
                            ),
                            builder: (BuildContext context) {
                              return Container(
                                width: double.infinity,
                                height: 150,
                                padding: const EdgeInsets.only(
                                  top: 10,
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      width: 135,
                                      height: 4.5,
                                      decoration: BoxDecoration(
                                        color: kBlueColor,
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                    ),
                                    SizedBox(height: 24),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text('Masukkan jumlah cash out',
                                          style: blackTextStyle.copyWith(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Form(
                                            key: _formKey,
                                            child: Column(children: [
                                              CustomTextField(
                                                  labelText: '',
                                                  hintText: 'Rp ...',
                                                  controller: _modalController,
                                                  validator: (value) {
                                                    if (value!.isEmpty) {
                                                      return 'Tidak boleh kosong';
                                                    }
                                                    return "";
                                                  }),
                                            ]))
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        child: Text('Cash Out'),
                        style: ElevatedButton.styleFrom(primary: Colors.red))
                  ],
                ),
                Divider(height: 10, color: Colors.black),
                Column(
                  children: [
                    Row(
                      children: [
                        Text('Deskripsi :',
                            style: blackTextStyle.copyWith(
                              fontSize: 14,
                              fontWeight: bold,
                            )),
                      ],
                    ),
                    Row(
                      children: [
                        Text('Investasi yang cerah untuk masa depan',
                            style: blackTextStyle.copyWith(
                              fontSize: 14,
                              fontWeight: regular,
                            ))
                      ],
                    ),
                  ],
                ),
                Divider(height: 30, color: Colors.black),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Riwayat Transaksi',
                        style: blackTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: bold,
                        ))
                  ],
                )
              ],
            ),
          )
        ],
      );
    });
  }
}

Widget riwayat() {
  return Builder(builder: (BuildContext context) {
    return ListView(
      physics: ClampingScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      children: <Widget>[
        ItemList(),
        ItemList(),
        ItemList(),
      ],
    );
  });
}
