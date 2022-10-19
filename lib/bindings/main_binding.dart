import 'package:dart_http/bindings/base_binding.dart';
import 'package:dart_http/controllers/main_controller.dart';
import 'package:dart_http/dio/dio_service.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class MainBinding extends BaseBinding {

  @override
  void dependencies() {
    debugPrint("MainBinding dependencies");
    Get.lazyPut<MainController> ( 
      () => MainController(
        new DioService()
      )
    );
  }
}