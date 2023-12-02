import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:navigation_drawer/binders/base_binding.dart';
import 'package:navigation_drawer/controllers/splash_controller.dart';

class SplashBinding extends BaseBinding {

  @override
  void dependencies() {
    debugPrint("SplashBinding dependencies");
    Get.lazyPut<SplashController> ( () => SplashController());
  }
}