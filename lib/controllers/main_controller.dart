import 'package:getx_storage/controllers/base_controller.dart';
import 'package:getx_storage/util/constants.dart';
import 'package:getx_storage/util/get_storage_manager_.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class MainController extends BaseController {

  MainController(GetStorageManager this.getStorageManager) {
    
  }

  RxBool _isChecked = false.obs;
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

  @override
  void onClose() {
    super.onClose();
  }
}