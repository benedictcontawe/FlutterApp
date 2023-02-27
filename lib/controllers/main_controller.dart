import 'dart:io' show Platform;
import 'package:dart_media_query/controllers/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends BaseController {

  MainController() {
    debugPrint("MainController Constructor");
  }

  final RxDouble _width = Get.width.obs;
  final RxDouble _height = Get.height.obs;
  final RxBool _isLoading = true.obs;

  @override
  void onInit() {
    //Platform.isIOS;
    super.onInit();
  }

  bool setWidth(double width) {
    debugPrint("MainController setWidth ${width}");
    _width(width);
    return false;
  }

  bool isDesktop() { debugPrint("MainController isDesktop");
    return _width.value >= 600.00;
  }

  bool isMobile() { debugPrint("MainController isMobile");
    return _width.value < 600.00;
  }

  bool isLoading() {
    return _isLoading.value;
  }

  @override
  void onClose() {
    debugPrint("MainController onClose");
    super.onClose();
  }
}