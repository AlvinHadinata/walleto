import 'package:hive/hive.dart';

part 'note.g.dart';

@HiveType(typeId: 5)
class Note {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String description;

  Note({
    this.id,
    required this.title,
    required this.description,
  });
}
