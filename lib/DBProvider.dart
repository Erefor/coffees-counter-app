import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';

class DBProvider{
  static late Database _database;
  static final DBProvider db = DBProvider._();
  DBProvider._();

  Future<Database> get database async{
    if(_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  Future<Database> initDB()async{
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path,'CoffeesDB.db');
    return await openDatabase(
      path,
      version: 1,
      onOpen: (db){},
      onCreate: (Database db , int version)async{
        await db.execute('''
        CREATE TABLE Coffees(
          id INTEGER PRIMARY KEY,
          coffeeInt INTEGER,
          size TEXT,
          dat, TEXT
        )
        ''');
      }
    );
  }
}