import 'package:flutter/material.dart';
import 'package:getx_storage/controllers/base_controller.dart';
import 'package:getx_storage/util/get_storage_manager_.dart';
import 'package:get/get.dart';

class MainController extends BaseController {

  MainController(GetStorageManager this._getStorageManager) {
    
  }
  
  final TextEditingController _stringController = TextEditingController();
  final TextEditingController _integerController = TextEditingController();
  final TextEditingController _doubleController = TextEditingController();
  final RxBool _liveChecked = false.obs;
  final RxString _liveBoolean = "Nil".obs;
  final RxString _liveString = "Nil".obs;
  final RxInt _liveInteger = 0.obs;
  final RxDouble _liveDoubleValue = 0.00.obs;
  final GetStorageManager _getStorageManager;

  @override
  void onInit() {
    super.onInit();
    _liveBoolean( ( _getStorageManager.getBoolean('BOOLEAN') ?? false ).toString() );
    _liveString( _getStorageManager.getString('STRING') ?? 'Nil' );
    _liveInteger( _getStorageManager.getInteger('INTEGER') ?? 0 );
    _liveDoubleValue( _getStorageManager.getDouble('DOUBLE') ?? 0.00 );
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
    _getStorageManager.setBoolean('BOOLEAN', _liveChecked.value);
    _liveBoolean(_getStorageManager.getBoolean('BOOLEAN').toString());
  }

  String getBoolean() {
    return _liveBoolean.value;
  }

  Future<void> updateString() async {
    _getStorageManager.setString('STRING', _stringController.text.toString());
    _liveString(_getStorageManager.getString('STRING'));
  }

  String getString() {
    return _liveString.value;
  }

  Future<void> updateInteger() async {
    _getStorageManager.setInteger('INTEGER', int.parse(_integerController.text.toString()));
    _liveInteger(_getStorageManager.getInteger('INTEGER'));
  }

  int getInteger() {
    return _liveInteger.value;
  }

  Future<void> updateDouble() async {
    _getStorageManager.setDouble('DOUBLE', double.parse(_doubleController.text.toString()));
    _liveDoubleValue(_getStorageManager.getDouble('DOUBLE'));
  }

  double getDouble() {
    return _liveDoubleValue.value;
  }
  
  @override
  void onClose() {
    super.onClose();
  }
}