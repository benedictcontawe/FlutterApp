import 'package:dart_http/bindings/base_binding.dart';
import 'package:dart_http/controllers/detail_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class DetailBinding extends BaseBinding {

  @override
  void dependencies() {
    debugPrint("DetailBinding dependencies");
    Get.lazyPut<DetailController> ( 
      () => DetailController(

      )
    );
  }
}