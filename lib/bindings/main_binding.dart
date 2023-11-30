import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:list_view/bindings/base_binding.dart';
import 'package:list_view/controllers/main_controller.dart';

class MainBinding extends BaseBinding {

  @override
  void dependencies() {
    debugPrint("MainBinding dependencies");
    Get.lazyPut<MainController> ( () => MainController());
  }
}