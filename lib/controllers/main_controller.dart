import 'package:flutter/material.dart';
import 'package:getx_storage/controllers/base_controller.dart';
import 'package:get/get.dart';
import 'package:getx_storage/util/shared_preferences_manager.dart';

class MainController extends BaseController {

  MainController(SharedPreferencesManager this._sharedPreferencesManager) {
    
  }
  
  final TextEditingController _stringController = TextEditingController();
  final TextEditingController _integerController = TextEditingController();
  final TextEditingController _doubleController = TextEditingController();
  final RxBool _liveChecked = false.obs;
  final RxString _liveBoolean = "Nil".obs;
  final RxString _liveString = "Nil".obs;
  final RxInt _liveInteger = 0.obs;
  final RxDouble _liveDoubleValue = 0.00.obs;
  final SharedPreferencesManager _sharedPreferencesManager;

  @override
  Future<void> onInit() async {
    super.onInit();
    _liveBoolean( (await _sharedPreferencesManager.getBoolean('BOOLEAN') ?? false ).toString() );
    _liveString( await _sharedPreferencesManager.getString('STRING') ?? 'Nil' );
    _liveInteger( await _sharedPreferencesManager.getInteger('INTEGER') ?? 0 );
    _liveDoubleValue( await _sharedPreferencesManager.getDouble('DOUBLE') ?? 0.00 );
  }

  void setBoolean(bool? value) {
    _liveChecked(value ?? false);
  }

  bool isChecked() {
    return _liveChecked.value;
  }

  TextEditingController getStringController() {
    return _stringController;
  }

  TextEditingController getIntegerController() {
    return _integerController;
  }

  TextEditingController getDoubleController() {
    return _doubleController;
  }

  Future<void> updateBoolean() async {
    _sharedPreferencesManager.setBoolean('BOOLEAN', _liveChecked.value);
    _liveBoolean( (await _sharedPreferencesManager.getBoolean('BOOLEAN') ?? false ).toString() );
  }

  String getBoolean() {
    return _liveBoolean.value;
  }

  Future<void> updateString() async {
    _sharedPreferencesManager.setString('STRING', _stringController.text.toString());
    _liveString( await _sharedPreferencesManager.getString('STRING') ?? 'Nil' );
  }

  String getString() {
    return _liveString.value;
  }

  Future<void> updateInteger() async {
    _sharedPreferencesManager.setInteger('INTEGER', int.parse(_integerController.text.toString()));
    _liveInteger( await _sharedPreferencesManager.getInteger('INTEGER') ?? 0 );
  }
  int getInteger() {
    return _liveInteger.value;
  }

  Future<void> updateDouble() async {
    _sharedPreferencesManager.setDouble('DOUBLE', double.parse(_doubleController.text.toString()));
    _liveDoubleValue( await _sharedPreferencesManager.getDouble('DOUBLE') ?? 0.00 );
  }

  double getDouble() {
    return _liveDoubleValue.value;
  }
  
  @override
  void onClose() {
    super.onClose();
  }
}