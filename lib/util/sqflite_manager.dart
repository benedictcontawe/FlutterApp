import 'dart:io' show Directory;
import 'package:dart_sqflite/util/convert_list.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart' show join;
import 'package:dart_sqflite/models/custom_model.dart';
import 'package:dart_sqflite/util/constants.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;

class SqfliteManager {  
  SqfliteManager._privateConstructor();
  static final SqfliteManager instance = SqfliteManager._privateConstructor();
  Database? _database;

  Future<Database?> get database async { 
    debugPrint("SqfliteManager get database");
    if (_database != null) return _database;
    _database = await _onOpen();
    return _database;
  }

  _onOpen() async { 
    debugPrint("SqfliteManager _onOpen");
    Directory directory = await pathProvider.getApplicationDocumentsDirectory();
    String path = join(directory.path, Constants.DATABASE_NAME);
    return await openDatabase(
        path,
        version: Constants.DATABASE_VERSION,
        onCreate: _onCreate
      );
  }

  Future<void> _onCreate(Database db, int version) async { 
    debugPrint("SqfliteManager _onCreate");
    await db.execute(
      "CREATE TABLE ${Constants.TABLE_NAME} (Id INTEGER PRIMARY KEY autoincrement, Name String NOT NULL)",
    );
  }

  Future<int?> onInsert(String tableName, CustomModel value,) async { 
    debugPrint("SqfliteManager insert $tableName $value");
    /*
    await _database?.insert (
      tableName, {
        'Id': value.id,
        'Name': value.name
      }
    );
    */
    return await _database?.rawInsert('INSERT INTO ${tableName} (Id, Name) VALUES(?, ?)', [value.id, value.name] );
  }

  Future<int?> queryRowCount(String tableName,) async {
    return Sqflite.firstIntValue(
      await _database?.rawQuery( 'SELECT COUNT(*) FROM $tableName' ) ?? new List<Map<String, Object?>>.empty()
    );
  }

  Future<List<CustomModel>> getModels(String tableName) async {
    var result = await _database?.query (
      tableName,
      distinct: true,
      //columns: ['Name'],
      orderBy: 'Id',
    );
    debugPrint("SqfliteManager getModels $tableName $result");
    return ConvertList.toModelList(result);
  }

  Future<void> observeModels() async {
    //TODO: Code not Completed yet
  }

  Future<bool?> containsKey(String key) async {
    //TODO: Code not Completed yet
  }

  Future<void> onUpdate(String tableName, CustomModel value,) async { 
    debugPrint("SqfliteManager onUpdate $tableName $value");
    await _database?.rawUpdate (
      'UPDATE $tableName SET Name = ? WHERE Id = ?',
      [value.name, value.id,],
    );
  }

  Future<void> onDelete(String tableName, CustomModel value,) async { 
    debugPrint("SqfliteManager onDelete $tableName $value");
    /*
    await _database?.transaction((txn) async {
        await txn.delete (
          tableName,
          where: 'Id = ?',  //where: 'Id = ? AND Id = ?',
          whereArgs: [value.id],  //whereArgs: [42, 1337],
        );
      }
    );
    */
    /*
    await _database?.delete(
      tableName, 
      where: 'Id = ? AND Name = ?', 
      whereArgs: [value.id, value.name,],
    );
    */
    await _database?.rawDelete (
      'DELETE FROM $tableName WHERE Id = ? AND Name = ?',
      [value.id, value.name,],
    );
  }

  Future<void> onDeleteAll(String tableName,) async { 
    debugPrint("SqfliteManager onDeleteAll");
    await _database?.rawDelete('DELETE FROM $tableName');
  }

  Future<void> onDrop(String tableName) async { 
    debugPrint("SqfliteManager onDrop");
    await _database?.execute('DROP TABLE $tableName');
  }

  Future<void> onClose() async { 
    debugPrint("SqfliteManager onClose");
    await _database?.close();
  }
}