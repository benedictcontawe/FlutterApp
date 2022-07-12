import 'dart:async';
import 'package:get_x/controllers/BaseController.dart';
import 'package:get_x/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashController extends BaseController {

  late Timer _timer;

  @override
  void onInit() {
    super.onInit();
    logDebug("SplashController onInit");
  }
  
  @override
  bool get initialized {
    logDebug("SplashController initialized ${super.initialized}");
    return super.initialized;
  }

  @override
  void onReady() {
    super.onReady();
    logDebug("SplashController onReady");
    _startTimer();
  }

  void _startTimer() {
    logDebug("SplashController startTimer");
    _timer = Timer(const Duration(milliseconds: 10000), (() => _launchLogin()));
  }

  void _launchLogin() {
    logDebug("SplashController Timer Stops");
    Get.offAndToNamed(Routes.LOGIN);
    _timer.cancel();
  }

  @override
  bool get isClosed {
    logDebug("const isClosed ${super.isClosed}");
    return super.isClosed;
  }

  @override
  void onClose() {
    logDebug("SplashController onClose");
    super.onClose();
  }
}