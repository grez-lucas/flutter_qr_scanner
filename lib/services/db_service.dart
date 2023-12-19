import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

import '../models/app_models.dart';

class DBService {
  static Database? _database;

  static final DBService db = DBService();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDB();

    return database;
  }

  Future<Database> initDB() async {
    // Path where the database will be stored

    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'ScansDB.db');
    print(path);

    // Create database
    return await openDatabase(
      path,
      version: 1, // Increase as the database structure changes
      onOpen: (db) {},
      // This code is executed when the database is created
      onCreate: (Database db, int version) async {
        await db.execute('''
          CREATE TABLE Scans(
            id INTEGER PRIMARY KEY,
            type TEXT,
            value TEXT
          )
        ''');
      },
    );
  }

  Future<int> newScanRaw(ScanModel newScan) async {
    final id = newScan.id;
    final type = newScan.type;
    final value = newScan.value;

    // Verify the database
    final db = await database;

    final res = await db.rawInsert('''
      INSERT INTO Scans(id, type, value)
        VALUES($id, '$type', '$value')
    ''');

    return res;
  }

  Future<int> newScan(ScanModel newScan) async {
    // Verify the database
    final db = await database;

    final res = await db.insert('Scans', newScan.toJson());

    return res;
  }

  Future<ScanModel?> getScanById(int id) async {
    // Verify the database
    final db = await database;

    final res = await db.query('Scans', where: 'id = ?', whereArgs: [id]);

    return res.isNotEmpty ? ScanModel.fromJson(res.first) : null;
  }

  Future<List<ScanModel>> getAllScans() async {
    // Verify the database
    final db = await database;

    final res = await db.query('Scans');

    return res.isNotEmpty ? res.map((s) => ScanModel.fromJson(s)).toList() : [];
  }

  Future<List<ScanModel>> getScansByType(String type) async {
    // Verify the database
    final db = await database;

    final res = await db.rawQuery('''
      SELECT * FROM Scans WHERE type = '$type'
    ''');

    return res.isNotEmpty ? res.map((s) => ScanModel.fromJson(s)).toList() : [];
  }

  Future<int> updateScan(ScanModel newScan) async {
    // Verify the database
    final db = await database;

    final res = await db.update('Scans', newScan.toJson(),
        where: 'id = ?', whereArgs: [newScan.id]);

    return res;
  }

  Future<int> deleteScan(int id) async {
    // Verify the database
    final db = await database;

    final res = await db.delete('Scans', where: 'id = ?', whereArgs: [id]);

    return res;
  }
}
