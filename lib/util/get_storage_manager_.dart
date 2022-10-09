import 'package:get_storage/get_storage.dart';

class GetStorageManager {
    
  GetStorageManager();

  static final _box = GetStorage('GetStorage');
      
  void setBoolean(String booleanKey, bool value,) {
        _box.write(booleanKey, value);
  }

  void setString(String stringKey, String value,) {
        _box.write(stringKey, value);
  }

  void setInteger(String integerKey, int value,) {
      _box.write(integerKey, value);
  }

  void setDouble(String doubleKey, double value,) {
      _box.write(doubleKey, value);
  }

  bool getBoolean(String booleanKey) {
      return _box.read(booleanKey);
  }

  String getString(String stringKey) {
      return _box.read(stringKey);
  }

  int getInteger(String integerKey) {
      return _box.read(integerKey);
  }

  Future getDouble(String doubleKey) async {
      return _box.read(doubleKey);
  }

  void remove(String key) {
    _box.remove(key);
  }
}