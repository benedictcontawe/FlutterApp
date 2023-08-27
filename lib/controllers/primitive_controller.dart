import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_storage/controllers/base_controller.dart';
import 'package:getx_storage/firebase/firestore_service.dart';
import 'package:getx_storage/util/get_storage_manager_.dart';

class PrimitiveController extends BaseController {

  PrimitiveController(GetStorageManager this._getStorageManager, FirestoreService this._service,) {
    
  }
  
  final GetStorageManager _getStorageManager;
  final FirestoreService _service;
  final TextEditingController _stringController = TextEditingController();
  final TextEditingController _integerController = TextEditingController();
  final TextEditingController _doubleController = TextEditingController();
  final RxBool _liveChecked = false.obs;
  final RxString _liveBoolean = "Nil".obs;
  final RxString _liveString = "Nil".obs;
  final RxInt _liveInteger = 0.obs;
  final RxDouble _liveDoubleValue = 0.00.obs;
  
  @override
  void onInit() {
    super.onInit();
    _liveBoolean( ( _getStorageManager.getBoolean('BOOLEAN') ?? false ).toString() );
    _liveString( _getStorageManager.getString('STRING') ?? 'Nil' );
    _liveInteger( _getStorageManager.getInteger('INTEGER') ?? 0 );
    _liveDoubleValue( _getStorageManager.getDouble('DOUBLE') ?? 0.00 );
  }

  @override
  void onReady() {
    super.onReady();
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
    try {
      //TODO: Save from Firebase first before Get Storage
      _getStorageManager.setBoolean('BOOLEAN', _liveChecked.value);
    } catch (exception) {
      onShowAlert("Error", "Invalid input for Boolean $exception");
    } finally {
      _liveBoolean(_getStorageManager.getBoolean('BOOLEAN').toString());
    }
  }

  String getBoolean() {
    return _liveBoolean.value;
  }

  Future<void> updateString() async {
     try {
      //TODO: Save from Firebase first before Get Storage
      _getStorageManager.setString('STRING', _stringController.text.toString());
    } catch (exception) {
      onShowAlert("Error", "Invalid input for String $exception");
    } finally {
      _liveString(_getStorageManager.getString('STRING'));
    }
  }

  String getString() {
    return _liveString.value;
  }

  Future<void> updateInteger() async {
    try {
      //TODO: Save from Firebase first before Get Storage
      _getStorageManager.setInteger('INTEGER', int.parse(_integerController.text.toString()));
    } catch (exception) {
      onShowAlert("Error", "Invalid input for Integer $exception");
    } finally {
      _liveInteger(_getStorageManager.getInteger('INTEGER'));
    }
  }

  int getInteger() {
    return _liveInteger.value;
  }

  Future<void> updateDouble() async {
    try {
      //TODO: Save from Firebase first before Get Storage
      _getStorageManager.setDouble('DOUBLE', double.parse(_doubleController.text.toString()));
    } catch (exception) {
      onShowAlert("Error", "Invalid input for Double $exception");
    } finally {
      _liveDoubleValue(_getStorageManager.getDouble('DOUBLE'));
    }
  }

  double getDouble() {
    return _liveDoubleValue.value;
  }
  
  @override
  void onClose() {
    super.onClose();
  }
}