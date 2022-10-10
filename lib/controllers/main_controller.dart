import 'package:flutter/material.dart';
import 'package:getx_storage/controllers/base_controller.dart';
import 'package:getx_storage/util/constants.dart';
import 'package:getx_storage/util/get_storage_manager_.dart';
import 'package:get/get.dart';

class MainController extends BaseController {

  MainController(GetStorageManager this.getStorageManager) {
    
  }
  
  TextEditingController _stringController = TextEditingController();
  TextEditingController _integerController = TextEditingController();
  TextEditingController _doubleController = TextEditingController();
  RxBool _isChecked = false.obs;
  String string = "";
  int integer = 0;
  double doubleValue = 0;
  GetStorageManager getStorageManager;

  @override
  void onInit() {
    super.onInit();
  }

  void setBoolean(bool? value) {
    _isChecked(value ?? false);
  }

  bool isChecked() {
    return _isChecked.value;
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
  
  @override
  void onClose() {
    super.onClose();
  }
}