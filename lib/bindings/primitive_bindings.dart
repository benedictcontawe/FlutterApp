import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:getx_storage/bindings/base_binding.dart';
import 'package:getx_storage/controllers/primitive_controller.dart';
import 'package:getx_storage/util/get_storage_manager_.dart';

class PrimitivaBinding extends BaseBinding {

  @override
  void dependencies() {
    debugPrint("PrimitivaBinding dependencies");
    Get.lazyPut<PrimitiveController> ( 
      () => PrimitiveController (
        Get.find<GetStorageManager>()
      )
    );
  }
}