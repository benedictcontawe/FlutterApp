import 'package:get_storage/get_storage.dart';
import 'package:getx_storage/models/custom_model.dart';

class GetStorageManager {
    
  GetStorageManager();

  static final _box = GetStorage('GetStorage');
      
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

  Future addModel(CustomModel model) async {
    //TODO: Code Under Construction
  }

  Future updateModel(CustomModel model) async {
    //TODO: Code Under Construction
  }

  Future deleteModel(CustomModel model) async {
    //TODO: Code Under Construction
  }

  List<CustomModel> getModels() {
    return new List<CustomModel>.empty();
  }

  void removeModels() {
    //TODO: Code Under Construction
  }

  void remove(String key) {
    _box.remove(key);
  }

  void erase() {
    _box.erase();
  }
}