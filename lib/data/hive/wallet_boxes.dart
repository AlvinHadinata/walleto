import 'package:hive/hive.dart';
import 'package:walleto/data/model/saving_target.dart';
import 'package:walleto/data/model/wallet.dart';

class WalletBoxes {
  static Box<Wallet> getSavingTarget() => Hive.box<Wallet>("savings_targets");

  static void storeSavingTarget(Wallet wallets) {
    Box<Wallet> savingTargetBox = Hive.box<Wallet>("savings_targets");
    savingTargetBox.add(wallets);
  }

  static void updateSavingTarget(int index, Wallet wallets) {
    Box<Wallet> savingTargetBox = Hive.box<Wallet>("savings_targets");
    savingTargetBox.putAt(
      index,
      Wallet(
        name: wallets.name,
        nominal: wallets.nominal,
        currentMoney: wallets.currentMoney,
        category: wallets.category,
        decription: wallets.decription,
        createdAt: wallets.createdAt,
      ),
    );
  }

  static void deleteSavingTarget(int index) {
    Box<Wallet> savingTargetBox = Hive.box<Wallet>("savings_targets");
    savingTargetBox.deleteAt(index);
  }

  static void updateCurrentMoneySaving(int index, Wallet wallets, int nominal) {
    Box<Wallet> savingTargetBox = Hive.box<Wallet>("savings_targets");
    savingTargetBox.putAt(
      index,
      Wallet(
        name: wallets.name,
        nominal: wallets.nominal,
        currentMoney: wallets.currentMoney + nominal,
        category: wallets.category,
        decription: wallets.decription,
        createdAt: wallets.createdAt,
      ),
    );
  }
}
