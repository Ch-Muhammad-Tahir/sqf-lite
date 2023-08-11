import 'dart:js_interop';

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
    _database = await initDB("mydb    ");
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
    await db.execute(''' create table ${AppConstants.tableName} (
      ${AppConstants.id} integer primary key autoincrement,
      ${AppConstants.name} text not null,
      ${AppConstants.describtion} text not null,
      ${AppConstants.contactNumber} text not null,
    )
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

  Future<List<Person>> getAllTodos() async {
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
