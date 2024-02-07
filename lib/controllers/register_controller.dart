import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:getx_storage/controllers/base_controller.dart';
import 'package:getx_storage/routes/app_pages.dart';

class RegisterController extends BaseController {

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

  
  Future<void> registerCredential() async {
    try {
      debugPrint('RegisterController registerCredential: ${emailController?.text} ${passwordController?.text}');
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword (
        email: emailController?.text ?? "",
        password: passwordController?.text ?? "",
      );
      User? user = userCredential.user;
      debugPrint('RegisterController User registered: ${user!.uid}');
      Get.offAndToNamed(Routes.MAIN);
    } on FirebaseAuthException catch (exception) {
      debugPrint('RegisterController registerCredential FirebaseAuthException ${exception.toString()}}');
      if (exception.code == 'weak-password') {
        onShowAlert("Error!", 'The password provided is too weak.');
      } else if (exception.code == 'email-already-in-use') {
        onShowAlert("Error!", 'The account already exists for that email.');
      }
    } catch (exception) {
      debugPrint('RegisterController registerCredential exception ${exception.toString()}}');
      onShowAlert("Error!", "Register failed Please Try Again");
    }
  }

  void launchLogin() {
    Get.toNamed(Routes.LOGIN);
  }

  @override
  void onClose() {
    super.onClose();
  }
}