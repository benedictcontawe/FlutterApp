import 'package:dart_file_picker/bindings/base_binding.dart';
import 'package:dart_file_picker/controllers/main_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class MainBinding extends BaseBinding {

  @override
  void dependencies() {
    debugPrint("MainBinding dependencies");
    Get.lazyPut<MainController> ( () => MainController());
  }
}