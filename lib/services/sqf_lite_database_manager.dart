import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_project/utils/app_constant.dart';

import '../models/card_model.dart';

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
      ${AppConstants.cardNumber} TEXT NOT NULL,
      ${AppConstants.cardHolderName} TEXT NOT NULL,
      ${AppConstants.expiryDate} TEXT NOT NULL,
      ${AppConstants.isCvvFocused} boolean ,
      ${AppConstants.cvvCode} TEXT NOT NULL
    );
''');
  }

  Future<int> insert({
    required CardModel cardModel,
  }) async {
    int id = 0;
    try {
      final db = await databaseInstance.database;
      id = await db.insert(AppConstants.tableName, cardModel.toMap());
      print('todoAdded');
      return id;
    } catch (e) {
      print(e.toString());
      return id;
    }
  }

  Future<List<CardModel>> getAllPersons() async {
    final db = await databaseInstance.database;

    final result = await db.query(AppConstants.tableName);

    return result.map((json) => CardModel.fromJson(json)).toList();
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

  Future<void> update(CardModel cardModel) async {
    try {
      final db = await databaseInstance.database;
      db.update(
        AppConstants.tableName,
        cardModel.toMap(),
        where: '${AppConstants.id} = ?',
        whereArgs: [cardModel.id],
      );
    } catch (e) {
      print(e.toString());
    }
  }
}
