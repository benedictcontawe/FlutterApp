import 'package:getx_storage/bindings/base_binding.dart';
import 'package:getx_storage/controllers/splash_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class SplashBinding extends BaseBinding {

  @override
  void dependencies() {
    //debugPrint("SplashBinding dependencies");
    Get.put<SplashController> ( 
      SplashController()
    );
  }
}