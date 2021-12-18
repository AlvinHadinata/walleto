// import 'package:hive/hive.dart';

// void main() async {
//   Hive.registerAdapter(PersonAdapter());
//   var persons = await Hive.openBox<Person>('personsWithLists');
//   persons.clear();

//   var mario = Person(name: 'Mario');
//   var luna = Person(name: 'Luna');
//   var alex = Person(name: 'Alex');
//   persons.addAll([mario, luna, alex]);

//   mario.friends = HiveList(persons); // Create a HiveList
//   mario.friends!.addAll([luna, alex]); // Update Mario's friends
//   mario.save(); // make persistent the change,
//   print(mario.friends);

//   luna.delete(); // Remove Luna from Hive
//   print(mario.friends); // HiveList updates automatically
// }

// @HiveType(typeId: 8)
// class Person extends HiveObject {
//   @HiveField(0)
//   String name;

//   @HiveField(1)
//   HiveList? friends;

//   Person({required this.name});

//   String toString() => name; // For print()
// }
