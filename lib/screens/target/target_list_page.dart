import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:walleto/data/hive/saving_target_boxes.dart';
import 'package:walleto/data/model/saving_target.dart';
import 'package:walleto/screens/target/target_detail_page.dart';
import 'package:walleto/screens/widgets/animation_placeholder.dart';
import 'package:walleto/screens/widgets/saving_item_widget.dart';
import 'package:walleto/shared/theme.dart';

class TargetListPage extends StatelessWidget {
  static const routeName = "/target_list_page";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Daftar Saving',
              style: whiteTextStyle.copyWith(
                  fontSize: 18, fontWeight: FontWeight.bold)),
          centerTitle: true,
          backgroundColor: kBlueColor),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Padding(
            padding: const EdgeInsets.all(20), child: _savingListItem(context)),
      ),
    );
  }
}

Widget _savingListItem(BuildContext context) {
  return ValueListenableBuilder<Box<SavingTarget>>(
    valueListenable: SavingTargetBoxes.getSavingTarget().listenable(),
    builder: (context, Box<SavingTarget> box, _) {
      if (box.values.isEmpty) {
        return AnimationPlaceholder(
          animation: "assets/no_data.svg",
          text: "Anda belum mempunyai target tabungan",
        );
      } else {
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: box.values.length,
          itemBuilder: (_, index) {
            final SavingTarget saving = box.getAt(index)!;
            return SavingItemWidget(
              saving: saving,
              onTap: () {
                Navigator.pushNamed(
                  context,
                  TargetDetailPage.routeName,
                  arguments: SavingTarget(
                    id: index,
                    nameTarget: saving.nameTarget,
                    nominal: saving.nominal,
                    period: saving.period,
                    durationType: saving.durationType,
                    currentMoney: saving.currentMoney,
                    category: saving.category,
                    priority: saving.priority,
                    decription: saving.decription,
                    createdAt: saving.createdAt,
                    foreign: saving.foreign,
                  ),
                );
              },
            );
          },
        );
      }
    },
  );
}
