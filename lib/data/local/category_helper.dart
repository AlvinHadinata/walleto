// import 'package:sqflite/sqflite.dart';
// import 'package:walleto/data/model/category.dart';
//
// class CategoryHelper {
//   static CategoryHelper? _instance;
//   static Database? _database;
//
//   CategoryHelper._internal() {
//     _instance = this;
//   }
//
//   factory CategoryHelper() => _instance ?? CategoryHelper._internal();
//
//   static const String _tblFavorite = 'favorite';
//
//   Future<Database> _initializeDb() async {
//     var path = await getDatabasesPath();
//     var db = openDatabase(
//       '$path/walleto.db',
//       onCreate: (db, version) async {
//         await db.execute('''CREATE TABLE $_tblFavorite (
//              id TEXT PRIMARY KEY,
//              name TEXT,
//              title TEXT,
//              description TEXT,
//              img TEXT
//            )
//         ''');
//       },
//       version: 1,
//     );
//
//     return db;
//   }
//
//   Future<Database> get database async {
//     _database ??= await _initializeDb();
//     return _database;
//   }
//
//   Future<void> insertFavorite(Category category) async {
//     final db = await database;
//     await db!.insert(_tblFavorite, category.toJson());
//   }
//
//   Future<List<Category>> getFavorites() async {
//     final db = await database;
//     List<Map<String, dynamic>> results = await db!.query(_tblFavorite);
//
//     return results.map((res) => Category.fromJson(res)).toList();
//   }
//
//   Future<Map> getCategoryById(String id) async {
//     final db = await database;
//
//     List<Map<String, dynamic>> results = await db!.query(
//       _tblFavorite,
//       where: 'id = ?',
//       whereArgs: [id],
//     );
//
//     if (results.isNotEmpty) {
//       return results.first;
//     } else {
//       return {};
//     }
//   }
//
//   Future<void> removeFavorite(String id) async {
//     final db = await database;
//     await db!.delete(
//       _tblFavorite,
//       where: 'id = ?',
//       whereArgs: [id],
//     );
//   }
// }
