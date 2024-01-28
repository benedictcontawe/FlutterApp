import 'package:dart_camera/bindings/base_binding.dart';
import 'package:dart_camera/controllers/splash_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class SplashBinding extends BaseBinding {

  @override
  void dependencies() {
    debugPrint("SplashBinding dependencies");
    Get.lazyPut<SplashController> ( () => SplashController());
  }
}