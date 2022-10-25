import 'package:dart_hive/bindings/base_binding.dart';
import 'package:dart_hive/controllers/object_controller.dart';
import 'package:dart_hive/util/hive_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class ObjectBinding extends BaseBinding {

  @override
  void dependencies() {
    debugPrint("ObjectBinding dependencies");
    Get.lazyPut<ObjectController> (
      () => ObjectController(
        new HiveManager()
      )
    );
  }
}