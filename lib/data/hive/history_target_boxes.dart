import 'package:hive/hive.dart';
import 'package:walleto/data/model/history_target.dart';
import 'package:walleto/data/model/history_wallet.dart';

class HistoryTargetBoxes {
  static Box<HistoryWallet> getHistoryWallet() =>
      Hive.box<HistoryWallet>("history_target");

  static void storeHistoryTarget(HistoryTarget historyTarget) {
    Box<HistoryTarget> historyWalletBox =
        Hive.box<HistoryTarget>("history_target");
    historyWalletBox.add(historyTarget);
  }
}
