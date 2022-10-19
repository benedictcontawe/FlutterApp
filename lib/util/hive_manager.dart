import 'package:dart_http/models/custom_model.dart';
import 'package:dart_http/util/constants.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveManager {
  //LazyBox box = Hive.lazyBox(Constants.Hive);
  Box? box, primitiveBox;

  Future<void> onOpen() async {
    //box ??= await Hive.openBox(Constants.Hive);
    if(box == null) {
      box = await Hive.openBox(Constants.Hive);//Hive.box(Constants.Hive);
      primitiveBox = await Hive.openBox(Constants.HivePrimitive);
    }
  }

  Future<void> add(CustomModel value,) async {
    //box = await Hive.openBox<CustomModel>(Constants.Hive);
    box?.add(value);
  }

  Future<void> setBoolean(String booleanKey, bool value,) async {
    primitiveBox?.put(booleanKey, value);
  }

  Future<void> setString(String stringKey, String value,) async {
    primitiveBox?.put(stringKey, value);
  }

  Future<void> setInteger(String integerKey, int value,) async {
    primitiveBox?.put(integerKey, value);
  }

  Future<void> setDouble(String doubleKey, double value,) async {
    primitiveBox?.put(doubleKey, value);
  }

  Future<void> setList(String listKey, List<dynamic> value,) async {
    box?.put(listKey, value);
  }

  Future<bool?> getBoolean(String booleanKey) async {
    return await primitiveBox?.get(booleanKey);
  }

  Future<String?> getString(String stringKey) async {
    return await primitiveBox?.get(stringKey);
  }

  Future<int?> getInteger(String integerKey) async {
    return await primitiveBox?.get(integerKey);
  }

  Future<double?> getDouble(String doubleKey) async {
    return await primitiveBox?.get(doubleKey);
  }

  Future<List<CustomModel>> getModels() async {
    //box = await Hive.openBox<CustomModel>(Constants.Hive);
    return box?.values.toList(growable: false)?.cast<CustomModel>() ?? <CustomModel>[];
  }

  Future<Stream<BoxEvent>?> observeModels() async {
    return box?.watch(); //TODO: Still on going
  }

  Future<bool?> containsKey(String key) async {
    return box?.containsKey(key);
  }

  Future<void> onUpdate(CustomModel value,) async {
    value.save();
  }

  Future<void> onDelete(CustomModel value,) async {
    //box?.delete(value.key);
    value.delete();
  }

  Future<void> onDeleteAll() async {
    //box?.deleteAll();
  }

  Future<void> onClear() async {
    box?.clear();
    primitiveBox?.clear();
  }

  Future<void> onDeleteFromDisk() async {
    if(Hive.isBoxOpen(Constants.Hive)) {
      box?.deleteFromDisk();
    }

    if(Hive.isBoxOpen(Constants.HivePrimitive)) {
      primitiveBox?.deleteFromDisk();
    }
  }

  Future<void> onFlush() async {
    box?.flush();
  }

  Future<void> onClose() async {
    /*
    if(Hive.isBoxOpen(Constants.Hive) || box?.isOpen == true) {
      box?.close();
    }
    if(Hive.isBoxOpen(Constants.HivePrimitive) || primitiveBox?.isOpen == true) {
      primitiveBox?.close();
    }
    */
    if(Hive.isBoxOpen(Constants.Hive) || Hive.isBoxOpen(Constants.HivePrimitive)) {
      Hive.close(); 
    }
  }
}