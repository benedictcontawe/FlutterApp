import 'package:getx_storage/bindings/base_binding.dart';
import 'package:getx_storage/controllers/main_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:getx_storage/util/shared_preferences_manager.dart';

class MainBinding extends BaseBinding {

  @override
  void dependencies() {
    debugPrint("MainBinding dependencies");
    Get.lazyPut<MainController> ( 
      () => MainController(
        new SharedPreferencesManager()
      )
    );
  }
}