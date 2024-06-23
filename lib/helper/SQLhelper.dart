import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:path/path.dart';

import '../constant.dart';

class Sqldb {
  static Database? _db;

  Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await initDatabase();
    return _db!;
  }

  Future<Database> initDatabase() async {
    var databaseFactory = databaseFactoryFfi;
    // var databasesPath = await getDatabasesPath();

    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path =
        join(documentDirectory.path, '$TABLE_NAME.db'); // Database file name

    return await databaseFactory.openDatabase(
      path,
      options: OpenDatabaseOptions(
        onUpgrade: onUpgrade,
        version: 1,
        onCreate: onCreate,
      ),
    );
  }

  Future<void> onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $TABLE_NAME (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        $MAIN_TITLE_COLUMN TEXT NOT NULL,
        $SUB_TITLE_COLUMN TEXT NOT NULL,
        $NOTE_COLUMN TEXT NOT NULL
      )
    ''');
    print('=========== Database Created ===========');
  }

  Future<void> onUpgrade(Database db, int oldVersion, int newVersion) async {
    print('=========== Version of Database changed ===========');
  }

  Future<List<Map<String, dynamic>>> readData(String sqlString) async {
    Database? mydb = await db;
    return await mydb.rawQuery(sqlString);
  }

  Future<int> insertData(
    String sqlString,
  ) async {
    Database? mydb = await db;
    return await mydb.rawInsert(sqlString);
  }

  Future<int> deleteData(String sqlString) async {
    Database? mydb = await db;
    return await mydb.rawDelete(sqlString);
  }

  Future<int> updateData(String sqlString, List<Object> list) async {
    Database? mydb = await db;
    return await mydb.rawUpdate(sqlString);
  }
}
