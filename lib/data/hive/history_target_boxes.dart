import 'package:hive/hive.dart';
import 'package:walleto/data/model/history_target.dart';

class HistoryTargetBoxes {
  static Box<HistoryTarget> getHistoryTarget() =>
      Hive.box<HistoryTarget>('history_wallet');

  static void storeHistoryWallet(HistoryTarget historyTarget) {
    Box<HistoryTarget> historyWalletBox =
        Hive.box<HistoryTarget>("history_wallet");
    historyWalletBox.add(historyTarget);
  }
}
