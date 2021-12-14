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
  final Category category;

  @HiveField(4)
  final String decription;

  @HiveField(5)
  final int createdAt;

  Wallet({
    this.id,
    required this.name,
    required this.nominal,
    required this.category,
    required this.decription,
    required this.createdAt,
  });
}
