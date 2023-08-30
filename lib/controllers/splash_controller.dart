import 'dart:async';
import 'package:getx_storage/controllers/base_controller.dart';
import 'package:getx_storage/routes/app_pages.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class SplashController extends BaseController {

  late Timer _timer;

  @override
  void onInit() {
    super.onInit();
    debugPrint("SplashController onInit");
  }

  @override
  void onReady() {
    super.onReady();
    debugPrint("SplashController onReady");
    _startTimer();
  }

  void _startTimer() {
    debugPrint("SplashController startTimer");
    _timer = Timer (
      const Duration( milliseconds: 4000 ), 
      (() => _launchLogin())
    );
  }

  void _launchLogin() {
      debugPrint("SplashController Timer Stops");
      Get.offAndToNamed(Routes.MAIN);
      _timer.cancel();
  }

  @override
  void onClose() {
    debugPrint("SplashController onClose");
    super.onClose();
  }
}