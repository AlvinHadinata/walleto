import 'package:hive/hive.dart';

part 'history_target.g.dart';

@HiveType(typeId: 3)
class HistoryTarget {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String nameTarget;
  @HiveField(2)
  final int nominal;
  @HiveField(3)
  final String description;
  @HiveField(4)
  final int createdAt;

  HistoryTarget({
    this.id,
    required this.nameTarget,
    required this.nominal,
    required this.description,
    required this.createdAt,
  });
}
