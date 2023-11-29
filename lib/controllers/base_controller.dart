import 'dart:async';
//import 'dart:html' as html;
import 'dart:io';
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

  void onRefresh() {
    /*
    if (_isWeb()) {
      html.window.location.reload();
    }
    */
  }

  bool isWeb() {
    debugPrint("BaseController isWeb");
    return Platform.isAndroid || Platform.isIOS ? false : true;
  }

  bool isMobile() {
    debugPrint("BaseController isMobile");
    return Platform.isAndroid || Platform.isIOS ? true : false;
  }

  @override
  void onClose() {
    super.onClose();
  }
}