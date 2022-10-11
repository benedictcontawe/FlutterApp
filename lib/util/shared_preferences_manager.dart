import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {

  SharedPreferencesManager();
      
  Future setBoolean(String booleanKey, bool value,) async {
    final pref = await SharedPreferences.getInstance();
    pref.setBool(booleanKey, value);
  }

  Future setString(String stringKey, String value,) async {
    final pref = await SharedPreferences.getInstance();
    pref.setString(stringKey, value);
    //pref.setStringList(key, value);
  }

  Future setInteger(String integerKey, int value,) async {
    final pref = await SharedPreferences.getInstance();
    pref.setInt(integerKey, value);
  }

  Future setDouble(String doubleKey, double value,) async {
    final pref = await SharedPreferences.getInstance();
    pref.setDouble(doubleKey, value);
  }

  Future<bool?> getBoolean(String booleanKey) async {
    final pref = await SharedPreferences.getInstance();
    return pref.getBool(booleanKey);
  }

  Future<String?> getString(String stringKey) async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString(stringKey);
  }

  Future<int?> getInteger(String integerKey) async {
    final pref = await SharedPreferences.getInstance();
    return pref.getInt(integerKey);
  }

  Future<double?> getDouble(String doubleKey) async {
    final pref = await SharedPreferences.getInstance();
    return pref.getDouble(doubleKey);
  }

  Future clearStorage() async {
    final pref = await SharedPreferences.getInstance();
    pref.clear();
  }
}