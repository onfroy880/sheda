// ignore_for_file: unused_local_variable

import 'package:sqflite/sqflite.dart' as sql;
import '../widgets/prayer_list.dart';

class LocalService {
  static Future<void> createTable(sql.Database database) async {
    String priere =
        "CREATE TABLE prieres (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT NOT NULL, description TEXT, statut TEXT, image TEXT);";

    String user =
        "CREATE TABLE users (id INTEGER PRIMARY KEY AUTOINCREMENT, idU INTEGER NOT NULL, emailU TEXT, passwordU TEXT);";
    await database.execute(priere);
    await database.execute(user);
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'sheda.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTable(database);
      },
    );
  }

  // priere method
  static Future<void> createPriere() async {
    final db = await LocalService.db();
    final table = db.query('prieres', orderBy: 'id');
    for (var i = 0; i < PrayerList.prieres.length; i++) {
      final data = {
        'title': PrayerList.prieres[i][0],
        'description': PrayerList.prieres[i][1],
        'statut': 'false',
      };
      await db.insert('prieres', data,
          conflictAlgorithm: sql.ConflictAlgorithm.replace);
    }
  }

  static Future<List<Map<String, dynamic>>> listPriere() async {
    final db = await LocalService.db();
    return db.query('prieres', orderBy: 'id');
  }

  static Future<List<Map<String, dynamic>>> listPriereFavoris() async {
    final db = await LocalService.db();
    return db.query('prieres',
        where: 'statut=?', whereArgs: ['true'], orderBy: 'id');
  }

  static Future<List<Map<String, dynamic>>> singlePriere(int id) async {
    final db = await LocalService.db();
    return db.query('prieres', where: 'id=?', whereArgs: [id], limit: 1);
  }

  static Future<int> updatePriere(int id, String statut) async {
    final db = await LocalService.db();
    final data = {'statut': statut};
    return db.update('prieres', data, where: 'id = ?', whereArgs: [id]);
  }

  // user method
  static Future<void> createUser(int id, String email, String password) async {
    final db = await LocalService.db();
    final data = {
      'idU': id,
      'emailU': email,
      'passwordU': password,
    };
    await db.insert('users', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
  }

  static Future<List<Map<String, dynamic>>> userStore() async {
    final db = await LocalService.db();
    return db.query('users', orderBy: 'id');
  }

  static Future<int> deleteUser() async {
    final db = await LocalService.db();
    return await db.delete('users');
  }
}
