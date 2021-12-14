import 'package:hive/hive.dart';
import 'package:walleto/data/model/saving_target.dart';

class SavingTargetBoxes {
  static Box<SavingTarget> getSavingTarget() =>
      Hive.box<SavingTarget>("savings_targets");

  static void storeSavingTarget(SavingTarget savingTarget) {
    Box<SavingTarget> savingTargetBox =
        Hive.box<SavingTarget>("savings_targets");
    savingTargetBox.add(savingTarget);
  }

  static void updateSavingTarget(int index, SavingTarget savingTarget) {
    Box<SavingTarget> savingTargetBox =
        Hive.box<SavingTarget>("savings_targets");
    savingTargetBox.putAt(
      index,
      SavingTarget(
        id: savingTarget.id,
        nameTarget: savingTarget.nameTarget,
        nominal: savingTarget.nominal,
        period: savingTarget.period,
        durationType: savingTarget.durationType,
        currentMoney: savingTarget.currentMoney,
        category: savingTarget.category,
        priority: savingTarget.priority,
        decription: savingTarget.decription,
        createdAt: savingTarget.createdAt,
      ),
    );
  }

  static void deleteSavingTarget(int index) {
    Box<SavingTarget> savingTargetBox =
        Hive.box<SavingTarget>("savings_targets");
    savingTargetBox.deleteAt(index);
  }

  static void updateCurrentMoneySaving(
      int index, SavingTarget savingTarget, int nominal) {
    Box<SavingTarget> savingTargetBox =
        Hive.box<SavingTarget>("savings_targets");
    savingTargetBox.putAt(
      index,
      SavingTarget(
        id: savingTarget.id,
        nameTarget: savingTarget.nameTarget,
        nominal: savingTarget.nominal,
        period: savingTarget.period,
        durationType: savingTarget.durationType,
        currentMoney: savingTarget.currentMoney + nominal,
        category: savingTarget.category,
        priority: savingTarget.priority,
        decription: savingTarget.decription,
        createdAt: savingTarget.createdAt,
      ),
    );
  }
}
