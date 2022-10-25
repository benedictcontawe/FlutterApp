import 'package:dart_hive/bindings/base_binding.dart';
import 'package:dart_hive/controllers/primitive_controller.dart';
import 'package:dart_hive/util/hive_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class PrimitiveBinding extends BaseBinding {

  @override
  void dependencies() {
    debugPrint("PrimitiveBinding dependencies");
    Get.lazyPut<PrimitiveController> (
      () => PrimitiveController(
        new HiveManager()
      )
    );
  }
}