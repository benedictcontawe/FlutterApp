import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:getx_storage/controllers/base_controller.dart';
import 'package:getx_storage/firebase/firebase_auth_service.dart';
import 'package:getx_storage/routes/app_pages.dart';

class RegisterController extends BaseController {

  RegisterController(FirebaseAuthService this._auth,) {
    debugPrint("RegisterController constructor");
  }
  //#region Firabase Instances
  final FirebaseAuthService _auth;
  //#endregion
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
  
  Future<void> onRegisterCredential() async {
    debugPrint('RegisterController onRegisterCredential: ${emailController?.text} ${passwordController?.text}');
    _auth.registerCredential (
      emailController?.text ?? "", 
      passwordController?.text ?? "",
      (userCredential) => debugPrint('RegisterController UserCredential $userCredential'), 
      (user) => debugPrint('RegisterController User registered: $user'), 
      () {
        debugPrint('RegisterController Success');
        Get.offAndToNamed(Routes.MAIN);
        onSendEmailVerification();
      }, 
      (firebaseAuthException) {
        debugPrint('RegisterController onRegisterCredential FirebaseAuthException ${firebaseAuthException.toString()}}');
        if (firebaseAuthException.code == 'weak-password') {
          onShowAlert("Error!", 'The password provided is too weak.');
        } else if (firebaseAuthException.code == 'email-already-in-use') {
          onShowAlert("Error!", 'The account already exists for that email.');
        }
      }, 
      (exception) {
        debugPrint('RegisterController onRegisterCredential exception ${exception.toString()}}');
        onShowAlert("Error!", "Register failed Please Try Again");
      },
    );
  }

  void onSendEmailVerification() {
    _auth.sendEmailVerification(
      () => debugPrint('RegisterController sendEmailVerification'), 
      (firebaseAuthException) {
        debugPrint('RegisterController sendEmailVerification exception ${firebaseAuthException.toString()}}');
        onShowAlert("Error!", "Register failed Please Try Again");
      }, 
      (exception) {
        debugPrint('RegisterController sendEmailVerification exception ${exception.toString()}}');
        onShowAlert("Error!", "Register failed Please Try Again");
      },
    );
  }

  void launchLogin() {
    Get.toNamed(Routes.LOGIN);
  }

  @override
  void onClose() {
    super.onClose();
    emailController?.dispose();
    passwordController?.dispose();
  }
}