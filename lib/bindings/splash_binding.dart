import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:list_view/bindings/base_binding.dart';
import 'package:list_view/controllers/splash_controller.dart';

class SplashBinding extends BaseBinding {

  @override
  void dependencies() {
    debugPrint("SplashBinding dependencies");
    Get.lazyPut<SplashController> ( () => SplashController());
  }
}