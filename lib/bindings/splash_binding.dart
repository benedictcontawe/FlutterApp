import 'package:dart_media_query/bindings/base_binding.dart';
import 'package:dart_media_query/controllers/splash_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class SplashBinding extends BaseBinding {

  @override
  void dependencies() {
    debugPrint("SplashBinding dependencies");
    Get.lazyPut<SplashController> ( () => SplashController());
  }
}