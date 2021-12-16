import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:walleto/data/hive/history_target_boxes.dart';
import 'package:walleto/data/hive/saving_target_boxes.dart';
import 'package:walleto/data/model/history_target.dart';
import 'package:walleto/data/model/saving_target.dart';
import 'package:walleto/screens/home_page.dart';
import 'package:walleto/screens/target/target_cash_page.dart';
import 'package:walleto/screens/target/target_edit_page.dart';
import 'package:walleto/screens/widgets/animation_placeholder.dart';
import 'package:walleto/screens/widgets/history_target_card.dart';
import 'package:walleto/shared/theme.dart';
import 'package:walleto/utils/helpers_utils.dart';

class TargetDetailPage extends StatelessWidget {
  static const routeName = '/target_detail_page';

  Widget _buildContent(BuildContext context) {
    final SavingTarget argument =
        ModalRoute.of(context)!.settings.arguments as SavingTarget;

    List<HistoryTarget> histories =
        Hive.box<HistoryTarget>('history_target').values.where((history) {
      return history.nameTarget == argument.nameTarget;
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
                  color: kGradasi,
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
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Saving Name",
                                    style: greyTextStyle.copyWith(
                                        fontSize: 16.0, fontWeight: regular),
                                  ),
                                  Text(
                                    argument.nameTarget,
                                    style: blackTextStyle.copyWith(
                                      fontSize: 20,
                                      fontWeight: bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          LinearPercentIndicator(
                            width: MediaQuery.of(context).size.width / 1.28,
                            animation: true,
                            lineHeight: 15.0,
                            animationDuration: 2000,
                            percent: getPercentDouble(
                                argument.currentMoney, argument.nominal),
                            animateFromLastPercent: true,
                            linearStrokeCap: LinearStrokeCap.roundAll,
                            progressColor: kBlueColor,
                            center: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  getPercent(
                                      argument.currentMoney, argument.nominal),
                                  style: blackTextStyle.copyWith(
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  "%",
                                  style: blackTextStyle.copyWith(
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Divider(height: 10, color: Colors.black),
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Deskripsi',
                        style: blueTextSyle.copyWith(
                          fontSize: 18,
                          fontWeight: bold,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        argument.decription,
                        style: greyTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: medium,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Terkumpul',
                        style: blueTextSyle.copyWith(
                          fontSize: 16,
                          fontWeight: bold,
                        ),
                      ),
                      Text(
                        NumberFormat.currency(
                          locale: 'id_ID',
                          decimalDigits: 0,
                          symbol: "Rp ",
                        ).format(
                          argument.currentMoney,
                        ),
                        style: greyTextStyle.copyWith(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Sisa Target',
                        style: blueTextSyle.copyWith(
                          fontSize: 16,
                          fontWeight: bold,
                        ),
                      ),
                      Text(
                        NumberFormat.currency(
                          locale: 'id_ID',
                          decimalDigits: 0,
                          symbol: "Rp ",
                        ).format(
                          argument.nominal - argument.currentMoney,
                        ),
                        style: greyTextStyle.copyWith(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Jangka Waktu',
                        style: blueTextSyle.copyWith(
                          fontSize: 16,
                          fontWeight: bold,
                        ),
                      ),
                      Text(
                        generatePeriodProgress(argument.createdAt,
                            argument.period, argument.durationType),
                        style: greyTextStyle.copyWith(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Prioritas',
                        style: blueTextSyle.copyWith(
                          fontSize: 16,
                          fontWeight: bold,
                        ),
                      ),
                      Text(
                        argument.priority,
                        style: greyTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: medium,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Proses',
                          style: blueTextSyle.copyWith(
                            fontSize: 16,
                            fontWeight: bold,
                          )),
                      Text(
                        (argument.currentMoney == argument.nominal)
                            ? "Completed"
                            : "On Progress",
                        style: greyTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: medium,
                            color: (argument.currentMoney == argument.nominal)
                                ? kGreenColor
                                : kYellowColor),
                      ),
                    ],
                  ),
                ],
              ),
              Divider(height: 10, color: Colors.black),
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
                      Navigator.pushNamed(context, TargetEditPage.routeName,
                          arguments: argument);
                    },
                  ),
                  ElevatedButton(
                    child: Text(
                      'Cash',
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
                      Navigator.pushNamed(context, TargetCashPage.routeName,
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
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: ValueListenableBuilder<Box<HistoryTarget>>(
                  valueListenable:
                      HistoryTargetBoxes.getHistoryTarget().listenable(),
                  builder: (context, Box<HistoryTarget> box, _) {
                    if (box.values.isEmpty) {
                      return AnimationPlaceholder(
                        animation: "assets/no_data.svg",
                        text: "Anda belum mempunyai History",
                      );
                    } else {
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: histories.length,
                        itemBuilder: (_, index) {
                          return HistoryTargetCard(
                            target: histories[index],
                          );
                        },
                      );
                    }
                  },
                ),
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
          'Detail Savings',
          style: whiteTextStyle.copyWith(fontSize: 18, fontWeight: bold),
        ),
        centerTitle: true,
        backgroundColor: kBlueColor,
      ),
      body: _buildContent(context),
    );
  }
}

void deleteTargetModal(context, index) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Text(
          "Apakah kamu yakin ingin menghapus Target ini?",
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
              SavingTargetBoxes.deleteSavingTarget(index);

              Navigator.pushNamedAndRemoveUntil(
                context,
                HomePage.routeName,
                (Route<dynamic> route) => false,
                arguments: true,
              );
            },
          ),
        ],
      );
    },
  );
}


// Widget riwayat() {
//   return Builder(builder: (BuildContext context) {
//     return ListView(
//       physics: ClampingScrollPhysics(),
//       shrinkWrap: true,
//       scrollDirection: Axis.vertical,
//       children: <Widget>[
//         listRiwayat(),
//         listRiwayat(),
//         listRiwayat(),
//       ],
//     );
//   });
// }

// Widget listRiwayat() {
//   return Container(
//     margin: const EdgeInsets.only(bottom: 8.0),
//     child: Material(
//       color: kWhiteColor,
//       shadowColor: Colors.grey[100],
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(15.0),
//       ),
//       child: Container(
//         padding: const EdgeInsets.symmetric(
//           vertical: 14.0,
//           horizontal: 16.0,
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           // crossAxisAlignment: CrossAxisAlignment.end,
//           children: [
//             Row(
//               children: [
//                 Container(
//                   width: 55,
//                   height: 55,
//                   padding: const EdgeInsets.all(6.0),
//                   decoration: BoxDecoration(
//                     color: Colors.green,
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                   child: Icon(
//                     Icons.arrow_upward_rounded,
//                     color: Colors.white,
//                     size: 30.0,
//                   ),
//                 ),
//                 Container(
//                   margin: const EdgeInsets.only(left: 8.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Text(
//                         "Untuk beli Iphone",
//                         style: blackTextStyle.copyWith(
//                             fontSize: 18.0,
//                             fontWeight: bold,
//                             decoration: TextDecoration.none),
//                       ),
//                       Text(
//                         "22-10-2020",
//                         style: blackTextStyle.copyWith(
//                             fontSize: 16.0,
//                             fontWeight: regular,
//                             decoration: TextDecoration.none),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             Container(
//               margin: const EdgeInsets.only(left: 8.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Text(
//                     "200.000",
//                     style: blueTextSyle.copyWith(
//                         fontSize: 18.0,
//                         fontWeight: bold,
//                         decoration: TextDecoration.none),
//                   ),
//                   Text(
//                     "Cash In",
//                     style: blackTextStyle.copyWith(
//                         fontSize: 16.0,
//                         fontWeight: regular,
//                         decoration: TextDecoration.none),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     ),
//   );
// }
