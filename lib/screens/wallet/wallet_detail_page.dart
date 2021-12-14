import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:walleto/data/hive/saving_target_boxes.dart';
import 'package:walleto/data/hive/wallet_boxes.dart';
import 'package:walleto/data/model/history_target.dart';
import 'package:walleto/data/model/history_wallet.dart';
import 'package:walleto/data/model/saving_target.dart';
import 'package:walleto/data/model/wallet.dart';
import 'package:walleto/screens/main_menu_page.dart';
import 'package:walleto/screens/wallet/waller_edit_page.dart';
import 'package:walleto/screens/wallet/wallet_cash_page.dart';
import 'package:walleto/screens/widgets/custom_text_field.dart';
import 'package:walleto/screens/widgets/item_list.dart';
import 'package:walleto/shared/theme.dart';
import 'package:walleto/utils/helpers_utils.dart';

class WalletDetailPage extends StatelessWidget {
  static const routeName = "/wallet_detail_page";

  Widget _buildContent(BuildContext context) {
    final Wallet argument =
        ModalRoute.of(context)!.settings.arguments as Wallet;
    print(argument.id);
    List<HistoryWallet> histories =
        Hive.box<HistoryWallet>('history_wallet').values.where((history) {
      return history.nameWallet == argument.name;
    }).toList();

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      physics: const ClampingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Column(children: [
              Container(
                height: MediaQuery.of(context).size.height / 4,
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
                            child: SvgPicture.asset(
                              argument.category.icon,
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                NumberFormat.currency(
                                  locale: 'id_ID',
                                  decimalDigits: 0,
                                  symbol: "Rp ",
                                ).format(argument.nominal),
                                style: blackTextStyle.copyWith(
                                  fontSize: 16,
                                  fontWeight: bold,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Wallet Name",
                                style: whiteTextStyle.copyWith(
                                    fontSize: 18.0, fontWeight: regular),
                              ),
                              Text(
                                argument.name,
                                style: whiteTextStyle.copyWith(
                                  fontSize: 22,
                                  fontWeight: bold,
                                ),
                              ),
                            ],
                          ),
                          FloatingActionButton(
                              child: const Icon(
                                Icons.attach_money_rounded,
                                color: kWhiteColor,
                              ),
                              elevation: 0.0,
                              backgroundColor: kBlueColor,
                              onPressed: () {}),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    child: Text(
                      'Update',
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
                    onPressed: () {
                      Navigator.pushNamed(context, WalletEditPage.routeName,
                          arguments: argument);
                    },
                  ),
                  ElevatedButton(
                    child: Text(
                      'Delete',
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
                    onPressed: () {
                      deleteTargetModal(context, argument.id);
                    },
                  )
                ],
              ),
            ])
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail Wallet',
          style: whiteTextStyle.copyWith(fontSize: 18, fontWeight: bold),
        ),
        centerTitle: true,
        backgroundColor: kBlueColor,
      ),
      body: _buildContent(context),
    );
  }

  void deleteTargetModal(context, index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(
            "Apakah kamu yakin ingin menghapus Wallet ini?",
            style: blackTextStyle.copyWith(
              fontSize: 16,
            ),
          ),
          actions: [
            ElevatedButton(
              child: Text(
                "Tidak",
                style: blackTextStyle.copyWith(fontWeight: bold),
              ),
              style: ElevatedButton.styleFrom(
                primary: kYellowColor,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 14.0,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            ElevatedButton(
              child: Text(
                "Iya",
                style: whiteTextStyle.copyWith(fontWeight: bold),
              ),
              style: ElevatedButton.styleFrom(
                primary: kRedColor,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 14.0,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onPressed: () {
                WalletBoxes.deleteWallet(index);

                Navigator.pushNamedAndRemoveUntil(
                  context,
                  MainMenuPage.routeName,
                  (Route<dynamic> route) => false,
                );
              },
            ),
          ],
        );
      },
    );
  }
  // Widget _detailSaldo() {
  //   final TextEditingController _modalController = TextEditingController();
  //   final _formKey = GlobalKey<FormState>();
  //   return Builder(builder: (BuildContext context) {
  //     return Column(
  //       children: [
  //         Padding(
  //           padding: const EdgeInsets.all(16.0),
  //           child: Column(
  //             children: [
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   ElevatedButton(
  //                       onPressed: () {
  //                         showModalBottomSheet(
  //                           context: context,
  //                           shape: const RoundedRectangleBorder(
  //                             borderRadius: BorderRadius.only(
  //                               topRight: Radius.circular(24),
  //                               topLeft: Radius.circular(24),
  //                             ),
  //                           ),
  //                           builder: (BuildContext context) {
  //                             return Container(
  //                               width: double.infinity,
  //                               height: 150,
  //                               padding: const EdgeInsets.only(
  //                                 top: 10,
  //                               ),
  //                               child: Column(
  //                                 children: [
  //                                   Container(
  //                                     width: 135,
  //                                     height: 4.5,
  //                                     decoration: BoxDecoration(
  //                                       color: kBlueColor,
  //                                       borderRadius: BorderRadius.circular(50),
  //                                     ),
  //                                   ),
  //                                   SizedBox(height: 24),
  //                                   Align(
  //                                     alignment: Alignment.center,
  //                                     child: Text('Masukkan jumlah cash in',
  //                                         style: blackTextStyle.copyWith(
  //                                             fontSize: 14,
  //                                             fontWeight: FontWeight.bold)),
  //                                   ),
  //                                   Column(
  //                                     mainAxisAlignment:
  //                                         MainAxisAlignment.center,
  //                                     children: [
  //                                       Form(
  //                                           key: _formKey,
  //                                           child: Column(children: [
  //                                             CustomTextField(
  //                                                 labelText: '',
  //                                                 hintText: 'Rp ...',
  //                                                 controller: _modalController,
  //                                                 validator: (value) {
  //                                                   if (value!.isEmpty) {
  //                                                     return 'Tidak boleh kosong';
  //                                                   }
  //                                                   return "";
  //                                                 }),
  //                                           ]))
  //                                     ],
  //                                   ),
  //                                 ],
  //                               ),
  //                             );
  //                           },
  //                         );
  //                       },
  //                       child: Text('Cash In'),
  //                       style: ElevatedButton.styleFrom(
  //                           primary: Colors.lightGreen)),
  //                   ElevatedButton(
  //                       onPressed: () {
  //                         showModalBottomSheet(
  //                           context: context,
  //                           shape: const RoundedRectangleBorder(
  //                             borderRadius: BorderRadius.only(
  //                               topRight: Radius.circular(24),
  //                               topLeft: Radius.circular(24),
  //                             ),
  //                           ),
  //                           builder: (BuildContext context) {
  //                             return Container(
  //                               width: double.infinity,
  //                               height: 150,
  //                               padding: const EdgeInsets.only(
  //                                 top: 10,
  //                               ),
  //                               child: Column(
  //                                 children: [
  //                                   Container(
  //                                     width: 135,
  //                                     height: 4.5,
  //                                     decoration: BoxDecoration(
  //                                       color: kBlueColor,
  //                                       borderRadius: BorderRadius.circular(50),
  //                                     ),
  //                                   ),
  //                                   SizedBox(height: 24),
  //                                   Align(
  //                                     alignment: Alignment.center,
  //                                     child: Text('Masukkan jumlah cash out',
  //                                         style: blackTextStyle.copyWith(
  //                                             fontSize: 14,
  //                                             fontWeight: FontWeight.bold)),
  //                                   ),
  //                                   Column(
  //                                     mainAxisAlignment:
  //                                         MainAxisAlignment.center,
  //                                     children: [
  //                                       Form(
  //                                           key: _formKey,
  //                                           child: Column(children: [
  //                                             CustomTextField(
  //                                                 labelText: '',
  //                                                 hintText: 'Rp ...',
  //                                                 controller: _modalController,
  //                                                 validator: (value) {
  //                                                   if (value!.isEmpty) {
  //                                                     return 'Tidak boleh kosong';
  //                                                   }
  //                                                   return "";
  //                                                 }),
  //                                           ]))
  //                                     ],
  //                                   ),
  //                                 ],
  //                               ),
  //                             );
  //                           },
  //                         );
  //                       },
  //                       child: Text('Cash Out'),
  //                       style: ElevatedButton.styleFrom(primary: Colors.red))
  //                 ],
  //               ),
  //               Divider(height: 10, color: Colors.black),
  //               Column(
  //                 children: [
  //                   Row(
  //                     children: [
  //                       Text('Deskripsi :',
  //                           style: blackTextStyle.copyWith(
  //                             fontSize: 14,
  //                             fontWeight: bold,
  //                           )),
  //                     ],
  //                   ),
  //                   Row(
  //                     children: [
  //                       Text('Investasi yang cerah untuk masa depan',
  //                           style: blackTextStyle.copyWith(
  //                             fontSize: 14,
  //                             fontWeight: bold,
  //                           ))
  //                     ],
  //                   ),
  //                 ],
  //               ),
  //               Divider(height: 20, color: Colors.black),
  //               Row(
  //                 children: [
  //                   Text('Riwayat Transaksi',
  //                       style: blackTextStyle.copyWith(
  //                         fontSize: 14,
  //                         fontWeight: bold,
  //                       ))
  //                 ],
  //               )
  //             ],
  //           ),
  //         )
  //       ],
  //     );
  //   });
  // }
}

// Widget riwayat() {
//   return Builder(builder: (BuildContext context) {
//     return ListView(
//       physics: ClampingScrollPhysics(),
//       shrinkWrap: true,
//       scrollDirection: Axis.vertical,
//       children: <Widget>[
//         ItemList(),
//         ItemList(),
//         ItemList(),
//       ],
//     );
//   });
// }

// Widget _cashButton(BuildContext context) {
//   return FloatingActionButton(
//     child: const Icon(
//       Icons.attach_money_rounded,
//       color: kWhiteColor,
//     ),
//     elevation: 0.0,
//     backgroundColor: kBlueColor,
//     onPressed: () {
//       showModalBottomSheet(
//         context: context,
//         shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.only(
//             topRight: Radius.circular(24),
//             topLeft: Radius.circular(24),
//           ),
//         ),
//         builder: (context) {
//           return Container(
//             width: double.infinity,
//             height: 150,
//             padding: const EdgeInsets.only(
//               top: 10,
//             ),
//             child: Column(
//               children: [
//                 Container(
//                   width: 135,
//                   height: 4.5,
//                   decoration: BoxDecoration(
//                     color: kBlueColor,
//                     borderRadius: BorderRadius.circular(50),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 24,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Column(
//                       children: [
//                         SizedBox(
//                           width: 60,
//                           height: 60,
//                           child: FloatingActionButton(
//                             backgroundColor: kGreenColor,
//                             child: const Icon(Icons.attach_money_rounded,
//                                 size: 30.0, color: kWhiteColor),
//                             onPressed: () {
//                               Navigator.pushNamed(
//                                 context,
//                                 WalletCashPage.routeName,
//                               );
//                             },
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 8,
//                         ),
//                         Text(
//                           "Cash In",
//                           style: blackTextStyle.copyWith(
//                             fontSize: 13,
//                           ),
//                         ),
//                       ],
//                     ),
//                     Column(
//                       children: [
//                         SizedBox(
//                           width: 60,
//                           height: 60,
//                           child: FloatingActionButton(
//                             backgroundColor: kRedColor,
//                             child: const Icon(
//                               Icons.attach_money_rounded,
//                               size: 30.0,
//                               color: kWhiteColor,
//                             ),
//                             onPressed: () {
//                               Navigator.pushNamed(
//                                 context,
//                                 WalletCashPage.routeName,
//                               );
//                             },
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 8,
//                         ),
//                         Text(
//                           "Cash Out",
//                           style: blackTextStyle.copyWith(
//                             fontSize: 13,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           );
//         },
//       );
//     },
//   );
// }
