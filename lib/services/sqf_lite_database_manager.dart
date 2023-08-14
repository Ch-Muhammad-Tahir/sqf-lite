import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_project/utils/app_constant.dart';

import '../models/person.dart';

class DatabaseRepository {
  static final DatabaseRepository databaseInstance = DatabaseRepository._init();
  DatabaseRepository._init();
  Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await initDB("mydb.db");
    return _database!;
  }

  Future<Database> initDB(String databaseName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, databaseName);
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(
    Database db,
    int version,
  ) async {
    await db.execute('''CREATE TABLE ${AppConstants.tableName} (
      ${AppConstants.id} INTEGER PRIMARY KEY AUTOINCREMENT,
      ${AppConstants.name} TEXT NOT NULL,
      ${AppConstants.describtion} TEXT NOT NULL,
      ${AppConstants.contactNumber} TEXT NOT NULL
    );
''');
  }

  Future<void> insert({required Person person}) async {
    try {
      final db = await databaseInstance.database;
      await db.insert(AppConstants.tableName, person.toMap());
      print('todoAdded');
    } catch (e) {
      print(e.toString());
    }
  }

  Future<List<Person>> getAllPersons() async {
    final db = await databaseInstance.database;

    final result = await db.query(AppConstants.tableName);

    return result.map((json) => Person.fromJson(json)).toList();
  }

  Future<void> delete(int id) async {
    try {
      final db = await databaseInstance.database;
      await db.delete(
        AppConstants.tableName,
        where: '${AppConstants.id} = ?',
        whereArgs: [id],
      );
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> update(Person todo) async {
    try {
      final db = await databaseInstance.database;
      db.update(
        AppConstants.tableName,
        todo.toMap(),
        where: '${AppConstants.id} = ?',
        whereArgs: [todo.id],
      );
    } catch (e) {
      print(e.toString());
    }
  }
}
