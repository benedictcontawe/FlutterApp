import 'package:dart_hive/bindings/base_binding.dart';
import 'package:dart_hive/controllers/splash_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class SplashBinding extends BaseBinding {

  @override
  void dependencies() {
    debugPrint("SplashBinding dependencies");
    Get.lazyPut<SplashController> ( () => SplashController());
  }
}