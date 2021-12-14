import 'package:hive/hive.dart';
import 'package:walleto/data/model/history_wallet.dart';

class HistoryWalletBoxes {
  static void storeHistoryWallet(HistoryWallet historyWallet) {
    Box<HistoryWallet> historyWalletBox =
        Hive.box<HistoryWallet>("history_wallet");
    historyWalletBox.add(historyWallet);
  }
}
