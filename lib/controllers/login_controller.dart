import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_storage/controllers/base_controller.dart';
import 'package:getx_storage/routes/app_pages.dart';

class LoginController extends BaseController {

  TextEditingController? emailController, passwordController;
  final RxBool _isPasswordHidden = true.obs;

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  void onTogglePasswordVisibility() {
    _isPasswordHidden.toggle();
  }

  RxBool observePasswordHidden() {
    return _isPasswordHidden;
  }

  @override
  void onReady() {
    super.onReady();
  }

  Future<void> checkCredential() async {
    try {
      final UserCredential credential = await FirebaseAuth.instance.signInWithEmailAndPassword (
        email: emailController?.text ?? "", 
        password: passwordController?.text ?? ""
      );
      debugPrint("LoginController checkCredential credential ${credential.toString()}");
      debugPrint("LoginController checkCredential user ${credential.user}");
      Get.offAndToNamed(Routes.MAIN);
    } catch (exception) {
      debugPrint('LoginController checkCredential exception ${exception.toString()}}');
      onShowAlert("Error!", "Login failed Please Try Again");
    }
  }

  void launchRegister() {
    Get.toNamed(Routes.REGISTER);
  }

  @override
  void onClose() {
    super.onClose();
  }
}