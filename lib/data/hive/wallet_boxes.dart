import 'package:hive/hive.dart';
import 'package:walleto/data/model/wallet.dart';

class WalletBoxes {
  static Box<Wallet> getWallets() => Hive.box<Wallet>("wallets");

  static void storeWallet(Wallet wallets) {
    // Box<Wallet> walletBox = Hive.box<Wallet>("wallets");
    getWallets().add(wallets);
  }

  static void updateWallet(int index, Wallet wallets) {
    // Box<Wallet> walletBox = Hive.box<Wallet>("wallets");
    getWallets().putAt(
      index,
      Wallet(
        id: wallets.id,
        name: wallets.name,
        nominal: wallets.nominal,
        category: wallets.category,
        decription: wallets.decription,
        createdAt: wallets.createdAt,
      ),
    );
  }

  static void deleteWallet(int index) {
    // Box<Wallet> walletBox = Hive.box<Wallet>("wallets");
    getWallets().deleteAt(index);
  }

  static void updateCashIn(int index, Wallet wallets, int cashIn) {
    // Box<Wallet> walletBox = Hive.box<Wallet>("wallets");
    getWallets().putAt(
      index,
      Wallet(
        id: wallets.id,
        name: wallets.name,
        nominal: wallets.nominal + cashIn,
        category: wallets.category,
        decription: wallets.decription,
        createdAt: wallets.createdAt,
      ),
    );
  }

  static void updateCashOut(int index, Wallet wallets, int cashOut) {
    // Box<Wallet> walletBox = Hive.box<Wallet>("wallets");
    getWallets().putAt(
      index,
      Wallet(
        id: wallets.id,
        name: wallets.name,
        nominal: wallets.nominal - cashOut,
        category: wallets.category,
        decription: wallets.decription,
        createdAt: wallets.createdAt,
      ),
    );
  }
}
