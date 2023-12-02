import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:navigation_drawer/binders/base_binding.dart';
import 'package:navigation_drawer/controllers/main_controller.dart';

class MainBinding extends BaseBinding {

  @override
  void dependencies() {
    debugPrint("MainBinding dependencies");
    Get.lazyPut<MainController> ( 
      () => MainController (
        
      )
    );
  }
}