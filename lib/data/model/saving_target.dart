import 'package:walleto/data/model/category.dart';
import 'package:walleto/data/model/wallet.dart';

class SavingTarget {
  final int? id;

  final String nameTarget;

  final int nominal;

  final int period;

  final String durationType;

  final int currentMoney;

  final Category category;

  final String priority;

  final String decription;

  final int createdAt;

  SavingTarget({
    required this.id,
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
