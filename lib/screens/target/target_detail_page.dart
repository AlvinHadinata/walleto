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
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class TargetDetailPage extends StatelessWidget {
  static const routeName = '/target_detail_page';

  @override
  Widget build(BuildContext context) {
    final SavingTarget argument =
        ModalRoute.of(context)!.settings.arguments as SavingTarget;

    Widget _buildContent() {
      List<HistoryTarget> histories =
          Hive.box<HistoryTarget>('history_target').values.where((history) {
        return history.nameTarget == argument.nameTarget;
      }).toList();

      List<String> namesHistory = [];

      for (var i = 0; i <= histories.length - 1; i++) {
        namesHistory.add(argument.nameTarget);
      }
      print(namesHistory);

      return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const ClampingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 3.2,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Saving Name",
                                        style: greyTextStyle.copyWith(
                                            fontSize: 16.0,
                                            fontWeight: regular),
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
                              const SizedBox(height: 10),
                              LinearPercentIndicator(
                                // width: MediaQuery.of(context).size.width / 1.28,
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
                                      getPercent(argument.currentMoney,
                                          argument.nominal),
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
                  const Divider(height: 30, color: kBlackPrimary),
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
                  const Divider(height: 30, color: kBlackPrimary),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text('History',
                          style: blackTextStyle.copyWith(
                              fontSize: 18, fontWeight: bold)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 2 ,
                    child: ValueListenableBuilder<Box<HistoryTarget>>(
                      valueListenable:
                          HistoryTargetBoxes.getHistoryTarget().listenable(),
                      builder: (context, Box<HistoryTarget> box, _) {
                        if (box.values.isEmpty) {
                          return AnimationPlaceholder(
                            animation: "assets/no_data.svg",
                            text: "Belum ada history",
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
                ],
              )
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail Savings',
          style: whiteTextStyle.copyWith(fontSize: 18, fontWeight: bold),
        ),
        centerTitle: true,
        backgroundColor: kBlueColor,
      ),
      body: _buildContent(),
      floatingActionButton: SpeedDial(
        iconTheme: const IconThemeData(color: kBlueColor),
        icon: Icons.settings_rounded,
        activeIcon: Icons.close_rounded,
        backgroundColor: kGradasi,
        animationSpeed: 200,
        children: [
          SpeedDialChild(
            child: const Icon(
              Icons.attach_money,
              color: kBlueColor,
            ),
            label: 'Saving',
            backgroundColor: kGradasi,
            onTap: () {
              Navigator.pushNamed(context, TargetCashPage.routeName,
                  arguments: argument);
            },
          ),
          SpeedDialChild(
            child: const Icon(Icons.email, color: kBlueColor),
            label: 'Edit',
            backgroundColor: kGradasi,
            onTap: () {
              Navigator.pushNamed(context, TargetEditPage.routeName,
                  arguments: argument);
            },
          ),
          SpeedDialChild(
            child: const Icon(Icons.delete_forever_rounded, color: kBlueColor),
            label: 'Delete',
            backgroundColor: kGradasi,
            onTap: () {
              _deleteTargetModal(context, argument.id, argument.nameTarget);
            },
          ),
        ],
      ),
    );
  }
}

void _deleteTargetModal(context, index, name) {
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
              HistoryTargetBoxes.deleteHistoryTarget(name);
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
