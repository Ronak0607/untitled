import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DbHelper {
  Database? db;

  Future<Database> checkDatabase() async {
    if (db != null) {
      return db!;
    } else {
      return creatDatabase();
    }
  }

  Future<Database> creatDatabase() async {
    Directory folder = await getApplicationDocumentsDirectory();
    String path = join(folder.path, "exam.db");

    return openDatabase(path, version: 1, onCreate: (db, version) {
      String query =
          "CREATE TABLE apidata(id INTEGER PRIMARY KEY AUTOINCREMENT,title TEXT,author TEXT,description TEXT)";
      db.execute(query);
    });
  }

  Future<void> insertData(String t1, String a1, String d1) async {
    db = await checkDatabase();
    db?.insert("apidata", {
      "title": t1,
      "author": a1,
      "description": d1,
    });
  }

  Future<List<Map>> readData() async {
    db = await checkDatabase();
    String query = "SELECT * FROM apidata";
    List<Map> lastlist = await db!.rawQuery(query, null);

    return lastlist;
  }
}
