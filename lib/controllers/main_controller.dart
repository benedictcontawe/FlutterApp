import 'package:dart_hive/controllers/base_controller.dart';
import 'package:dart_hive/routes/app_pages.dart';
import 'package:dart_hive/util/hive_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends BaseController {

  MainController(HiveManager this._hiveManager) { debugPrint("MainController Constructor");
    _hiveManager.onOpen();
  }

  final HiveManager _hiveManager;

  @override
  void onInit() { debugPrint("MainController onInit");
    super.onInit();
  }

  void launchPrimitive() {
      debugPrint("MainController Primitive");
      Get.toNamed(Routes.PRIMITIVE);
  }

  void launchObject() {
      debugPrint("MainController Object");
      Get.toNamed(Routes.OBJECT);
  }

  @override
  void onClose() {
    _hiveManager.onClose();
    super.onClose();
  }
}