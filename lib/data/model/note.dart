import 'package:hive/hive.dart';

part 'note.g.dart';

@HiveType(typeId: 5)
class Note {
  @HiveField(0)
  late int? id;
  @HiveField(1)
  late String title;
  @HiveField(2)
  late String description;

  Note({
    this.id,
    required this.title,
    required this.description,
  });
}
