import 'package:hive/hive.dart';

part 'history_wallet.g.dart';

@HiveType(typeId: 4)
class HistoryWallet {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String nameWallet;
  @HiveField(2)
  final int nominal;
  @HiveField(3)
  final String description;
  @HiveField(4)
  final bool? cashIn;
  @HiveField(5)
  final int createdAt;

  HistoryWallet({
    this.id,
    required this.nameWallet,
    required this.nominal,
    required this.description,
    this.cashIn,
    required this.createdAt,
  });
}
