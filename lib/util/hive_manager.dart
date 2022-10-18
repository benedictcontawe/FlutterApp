import 'package:dart_http/models/custom_model.dart';
import 'package:dart_http/util/constants.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveManager {
  //LazyBox box = Hive.lazyBox(Constants.Hive);
  Box? box;

  Future<void> onOpen() async {
    if(box == null) {
      box = await Hive.openBox(Constants.Hive);
    }
  }

  Future<void> add(CustomModel value,) async {
    //box = await Hive.openBox<CustomModel>(Constants.Hive);
    box?.add(value);
  }

  Future<void> setBoolean(String booleanKey, bool value,) async {
    box?.put(booleanKey, value);
  }

  Future<void> setString(String stringKey, String value,) async {
    box?.put(stringKey, value);
  }

  Future<void> setInteger(String integerKey, int value,) async {
    box?.put(integerKey, value);
  }

  Future<void> setDouble(String doubleKey, double value,) async {
    box?.put(doubleKey, value);
  }

  Future<void> setList(String listKey, List<dynamic> value,) async {
    box?.put(listKey, value);
  }

  Future<bool?> getBoolean(String booleanKey) async {
    return await box?.get(booleanKey);
  }

  Future<String?> getString(String stringKey) async {
    return await box?.get(stringKey);
  }

  Future<int?> getInteger(String integerKey) async {
    return await box?.get(integerKey);
  }

  Future<double?> getDouble(String doubleKey) async {
    return await box?.get(doubleKey);
  }

  Future<List<CustomModel>> getModels() async {
    //box = await Hive.openBox<CustomModel>(Constants.Hive);
    return box?.values.toList(growable: false)?.cast<CustomModel>() ?? <CustomModel>[];
  }

  Future<bool?> containsKey(String key) async {
    return box?.containsKey(key);
  }

  Future<void> onClear() async {
    box?.clear();
  }

  Future<void> onDelete(CustomModel value,) async {
    box?.delete(value);
    //box?.deleteAll();
  }

  Future<void> onDeleteAll() async {
    //box?.deleteAll();
  }

  Future<void> onDeleteFromDisk() async {
    if(Hive.isBoxOpen(Constants.Hive)) {
      box?.deleteFromDisk();
    }
  }

  Future<void> onFlush() async {
    box?.flush();
  }

  Future<void> onClose() async {
    if(Hive.isBoxOpen(Constants.Hive) || box?.isOpen == true) {
      //Hive.box(Constants.Hive);
      box?.close();
      Hive.close();
    }
  }
}