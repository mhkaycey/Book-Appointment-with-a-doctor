import 'dart:developer';
import 'package:doctor_app/models/appoint.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static Database? _database;
  static const int _version = 1;
  static const String _tableName = 'appointments';
  List<BookAppointment> list = [];

  static Future<void> iniDb() async {
    if (_database != null) {
      return;
    }
    try {
      String path = '${await getDatabasesPath()}appointments.db';
      _database = await openDatabase(
        path,
        version: _version,
        onCreate: (db, version) {
          return db.execute(
            "CREATE TABLE $_tableName("
            "id INTEGER PRIMARY KEY AUTOINCREMENT, "
            "title STRING, note TEXT, date DATE, "
            "startTime TIME, endTime TIME, "
            "remind INTEGER, "
            "color INTEGER, "
            "isCompleted INTEGER)",
          );
        },
      );
    } catch (e) {
      log(e.toString());
    }
  }

  static Future<int> insert(BookAppointment? bookAppointment) async {
    return await _database?.insert(_tableName, bookAppointment!.toJson()) ?? 1;
  }

  static Future<List<Map<String, dynamic>>> query() async {
    if (_database == null) {
      throw Exception('Database has not been initialized');
    }

    return _database!.query(_tableName);
  }

  static Future<List<Map<String, dynamic>>> queryCompleted() async {
    if (_database == null) {
      throw Exception('Database has not been initialized');
    }

    return _database!.query(_tableName, where: 'isCompleted = 1');
  }

  static delete(BookAppointment bookAppointment) async {
    return await _database!.delete(
      _tableName,
      where: 'id=?',
      whereArgs: [bookAppointment.id],
    );
  }

  static update(int id) async {
    return await _database!.rawUpdate('''
      UPDATE appointments
      SET isCompleted =?
      WHERE ID =?

''', [1, id]);
  }
}
