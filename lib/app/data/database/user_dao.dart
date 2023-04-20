import 'package:sqflite/sqflite.dart';
import 'package:whetherapp/app/data/database/database.dart';
import 'package:whetherapp/app/data/database/user_db_model.dart';

class UserDAO {
  static final db = UserDatabase();

  static Future<int> addDb(UserDBModel itemDBModel) async {
    var client = await UserDatabase.db;
    return client.insert('user', itemDBModel.toMapForDb(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<List<UserDBModel>> fetchAll() async {
    var client = await UserDatabase.db;
    var res = await client.query('user');

    if (res.isNotEmpty) {
      var item = res.map((value) => UserDBModel.fromDb(value)).toList();
      return item;
    }
    return [];
  }

  static Future<void> saveToDB(
      String id, String firstName, String lastName, String email) async {
    var sync = UserDBModel.random(id, firstName, lastName, email, "false", "0");
    await addDb(sync);
  }

  static Future<void> removeAll() async {
    await db.remove("user");
  }

  static Future<int> deleteRow(String id) async {
    var client = await UserDatabase.db;
    return client.delete('user', where: 'id  = ?', whereArgs: [id]);
  }

  static Future<int> updateActive(String id, String active) async {
    var client = await UserDatabase.db;
    return client.rawUpdate(
        '''UPDATE user SET active = ? WHERE  id = ?''', [active, id]);
  }

  static Future<int> updateWhether(String whether) async {
    var client = await UserDatabase.db;
    return client.rawUpdate(
        '''UPDATE user SET whether = ? WHERE  active = ?''', [whether, "true"]);
  }

  static Future<int> updateWhetherById(String whether, String id) async {
    var client = await UserDatabase.db;
    return client.rawUpdate(
        '''UPDATE user SET whether = ? WHERE  id = ?''', [whether, id]);
  }
}
