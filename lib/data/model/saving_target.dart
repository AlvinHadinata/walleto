import 'package:hive/hive.dart';
import 'package:walleto/data/model/category.dart';

part 'saving_target.g.dart';

@HiveType(typeId: 1)
class SavingTarget {
  @HiveField(0)
  final int? id;

  @HiveField(1)
  final String nameTarget;

  @HiveField(2)
  final int nominal;

  @HiveField(3)
  final int period;

  @HiveField(4)
  final String durationType;

  @HiveField(5)
  final int currentMoney;

  @HiveField(6)
  final Category category;

  @HiveField(7)
  final String priority;

  @HiveField(8)
  final String decription;

  @HiveField(9)
  final int createdAt;

  SavingTarget({
    this.id,
    required this.nameTarget,
    required this.nominal,
    required this.period,
    required this.durationType,
    required this.currentMoney,
    required this.category,
    required this.priority,
    required this.decription,
    required this.createdAt,
  });
}
