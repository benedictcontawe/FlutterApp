import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_storage/models/custom_model.dart';

class GetStorageManager {
    
  GetStorageManager();

  static final _box = GetStorage('GetStorage');
  //#region Primitive Methods
  Future setBoolean(String booleanKey, bool value,) async {
    _box.write(booleanKey, value);
  }

  Future setString(String stringKey, String value,) async {
    _box.write(stringKey, value);
  }

  Future setInteger(String integerKey, int value,) async {
    _box.write(integerKey, value);
  }

  Future setDouble(String doubleKey, double value,) async {
    _box.write(doubleKey, value);
  }

  bool? getBoolean(String booleanKey) {
    return _box.read(booleanKey);
  }

  String? getString(String stringKey) {
    return _box.read(stringKey);
  }

  int? getInteger(String integerKey) {
    return _box.read(integerKey);
  }

  double? getDouble(String doubleKey) {
    return _box.read(doubleKey);
  }
  //#endregion
  //#region Object Methods
  Future addModel(CustomModel model) async {
    debugPrint("GetStorageManager addModel ${model}");
    final List<CustomModel> models = getModels();
    models.add( model );
    updateModels( models );
  }

  Future updateModel(CustomModel model) async {
    //TODO: Code Under Construction
  }

  Future updateModels(List<CustomModel> models) async {
    debugPrint("GetStorageManager updateModels ${models.length} ${models.toList()}");
    var modelsAsMap = models.map(
      ( custom ) => custom.toJson()
    ).toList();
    String jsonString = jsonEncode(modelsAsMap);
    await _box.write('OBJECT', jsonString);
  }

  Future deleteModel(CustomModel model) async {
    //TODO: Code Under Construction
  }

  List<CustomModel> getModels() {
    debugPrint("GetStorageManager getModels");
    final result = _box.read("OBJECT") ?? "";
    dynamic jsonData = jsonDecode(result);
    return jsonData.map ( 
      ( custom ) => CustomModel.fromJson( custom )
    ).toList();
  }

  void removeModels() {
    //TODO: Code Under Construction
  }
  //#endregion
  void remove(String key) {
    _box.remove(key);
  }

  void erase() {
    _box.erase();
  }
}