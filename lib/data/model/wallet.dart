import 'package:hive/hive.dart';

import 'category.dart';

part 'wallet.g.dart';

@HiveType(typeId: 2)
class Wallet {
  @HiveField(0)
  final int? id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final int nominal;

  @HiveField(3)
  final int currentMoney;

  @HiveField(4)
  final Category category;

  @HiveField(5)
  final String decription;

  @HiveField(6)
  final int createdAt;

  Wallet({
    this.id,
    required this.name,
    required this.nominal,
    required this.currentMoney,
    required this.category,
    required this.decription,
    required this.createdAt,
  });

  // static List<Wallet> wallet = [
  //   Wallet(
  //       name: "Investasi",
  //       nominal: 100000,
  //       currentMoney: 1000,
  //       decription: "Better Future"),
  //   Wallet(
  //       name: "Investasi",
  //       nominal: 100000,
  //       currentMoney: 1000,
  //       decription: "Better Future"),
  //   Wallet(
  //       name: "Investasi",
  //       nominal: 100000,
  //       currentMoney: 1000,
  //       decription: "Better Future"),
  // ];
}
