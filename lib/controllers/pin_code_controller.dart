import 'package:get_x/controllers/BaseController.dart';
import 'package:get_x/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PinCodeController extends BaseController {

  bool _isLoading = false;
  TextEditingController firstOtpController = new TextEditingController();
  TextEditingController secondOtpController = new TextEditingController();
  TextEditingController thirdController = new TextEditingController();
  TextEditingController fourthController = new TextEditingController();

    @override
  void onInit() {
    super.onInit();
    logDebug("PinCodeController onInit");
  }

  @override
  void onReady() {
    super.onReady();
    logDebug("PinCodeController onReady");
  }

  void setLoading() {
    logDebug("PinCodeController setLoading");
    _isLoading = true;
    Future.delayed(const Duration(seconds: 2),() {
      _isLoading = false;
    });
  }

  RxBool observeLoading() {
    return _isLoading.obs;
  }

  void launchHome() {
      logDebug("PinCodeController launchHome");
      logDebug("PinCodeController OTP ${firstOtpController.text} ${secondOtpController.text} ${thirdController.text} ${fourthController.text}");
      Get.toNamed(Routes.FUNCTIONSELECTION);
  }

  @override
  void onClose() {
    logDebug("PinCodeController onClose");
    super.onClose();
  }
}