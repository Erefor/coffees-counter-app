// ignore_for_file: unused_local_variable

import 'dart:io';

import 'package:coffe_counter_app/Models/CoffeeModel.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  static Database? _database;
  static final DBProvider db = DBProvider._();
  DBProvider._();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDB();
    return _database!;
  }

  Future<Database> initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'CoffeesDB.db');
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('''
        CREATE TABLE Coffees(
          id INTEGER PRIMARY KEY,
          entero INTEGER,
          size TEXT,
          date TEXT
        )
        ''');
    });
  }

  Future<int> newCoffee(Coffee coffee) async {
    final db = await database;
    final res = await db.insert('Coffees', coffee.toJson());
    return res;
  }

  Future<List<Coffee>> getAllCoffees() async {
    final db = await database;
    final response = await db.query('Coffees');
    return response.isNotEmpty
        ? response.map((coffee) => Coffee.fromJson(coffee)).toList()
        : [];
  }

  void killDataBase() async {
    final db = await database;
    final resp = await db.rawDelete('''DELETE FROM Coffees''');
    
  }
}
