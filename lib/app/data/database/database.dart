import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class UserDatabase {
  static final UserDatabase _instance = UserDatabase._();
  static var _database;

  UserDatabase._();

  factory UserDatabase() {
    return _instance;
  }

  static Future<Database> get db async {
    if (_database != null) {
      return _database;
    }

    _database = await init();

    return _database;
  }

  static Future<Database> init() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String dbPath = join(directory.path, 'database.db');
    var database = openDatabase(dbPath, version: 2, onCreate: _onCreate);

    return database;
  }

  static void _onCreate(Database db, int version) {
    db.execute('''
      CREATE TABLE user(
        id TEXT,
        firstName TEXT,
        lastName TEXT,
        email TEXT,
        active TEXT,
        whether TEXT)
    ''');
    print("database was created");
  }

  Future closeDb() async {
    var client = await db;
    client.close();
  }

  Future<void> removeAll() async {
    var client = await db;
    client.rawDelete("DELETE FROM user");
  }

  Future<void> remove(String table) async {
    var client = await db;
    client.rawDelete("DELETE FROM $table");
  }
}
