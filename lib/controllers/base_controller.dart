import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BaseController extends GetxController {
  
  @override
  onInit() {
    super.onInit();
  }

  @protected
  void onShowAlert(String title, String message) {
    Timer (
      const Duration(milliseconds: 2000), ( () => Get.snackbar(title, message) )
    );
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}