import 'package:flutter/material.dart';
import 'package:getx_storage/controllers/base_controller.dart';
import 'package:getx_storage/routes/app_pages.dart';
import 'package:get/get.dart';

class MainController extends BaseController {

  MainController();

  @override
  void onInit() {
    super.onInit();
    debugPrint("MainController onInit");
  }

  void onLaunchPrimitive() {
    debugPrint("MainController onLaunchPrimitive");
    Get.toNamed(Routes.PRIMITIVE);
  }

  void onLaunchObject() {
    debugPrint("MainController onLaunchObject");
    Get.toNamed(Routes.OBJECT);
  }

  @override
  void onClose() {
    super.onClose();
    debugPrint("MainController onClose");
  }
}