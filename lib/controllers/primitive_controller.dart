import 'package:dart_hive/controllers/base_controller.dart';
import 'package:dart_hive/util/hive_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrimitiveController extends BaseController {

  PrimitiveController(HiveManager this._hiveManager) { debugPrint("PrimitiveController Constructor");
    _hiveManager.onOpen();
  }

  final RxBool _isLoading = true.obs;
  final TextEditingController _stringController = TextEditingController();
  final TextEditingController _integerController = TextEditingController();
  final TextEditingController _doubleController = TextEditingController();
  final RxBool _liveChecked = false.obs;
  final RxString _liveBoolean = "Nil".obs;
  final RxString _liveString = "Nil".obs;
  final RxInt _liveInteger = 0.obs;
  final RxDouble _liveDoubleValue = 0.00.obs;
  final HiveManager _hiveManager;

  @override
  Future<void> onInit() async {
    super.onInit();
    debugPrint("PrimitiveController onInit");
    updatePrimitives();
  }

  @override
  void onReady() {
    super.onReady();
    updatePrimitives();
  }

  bool isLoading() {
    return _isLoading.value;
  }

  Future<void> updatePrimitives() async {
    try {
      _isLoading(true);
      _liveBoolean( (await _hiveManager.getBoolean('BOOLEAN') ?? false ).toString() );
      _liveString( await _hiveManager.getString('STRING') ?? 'Nil' );
      _liveInteger( await _hiveManager.getInteger('INTEGER') ?? 0 );
      _liveDoubleValue( await _hiveManager.getDouble('DOUBLE') ?? 0.00 );
    } catch (exception) {
      debugPrint("PrimitiveController update primitives exception $exception");
    } finally {
      _isLoading(false);
    }
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
    _hiveManager.setBoolean('BOOLEAN', _liveChecked.value);
    _liveBoolean( (await _hiveManager.getBoolean('BOOLEAN') ?? false ).toString() );
  }

  String getBoolean() {
    return _liveBoolean.value;
  }

  Future<void> updateString() async {
    _hiveManager.setString('STRING', _stringController.text.toString());
    _liveString( await _hiveManager.getString('STRING') ?? 'Nil' );
  }

  String getString() {
    return _liveString.value;
  }

  Future<void> updateInteger() async {
    _hiveManager.setInteger('INTEGER', int.parse(_integerController.text.toString()));
    _liveInteger( await _hiveManager.getInteger('INTEGER') ?? 0 );
  }
  int getInteger() {
    return _liveInteger.value;
  }

  Future<void> updateDouble() async {
    _hiveManager.setDouble('DOUBLE', double.parse(_doubleController.text.toString()));
    _liveDoubleValue( await _hiveManager.getDouble('DOUBLE') ?? 0.00 );
  }

  double getDouble() {
    return _liveDoubleValue.value;
  }

  @override
  void onClose() {
    _hiveManager.onClose();
    super.onClose();
  }
}