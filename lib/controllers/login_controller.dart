import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_storage/controllers/base_controller.dart';
import 'package:getx_storage/firebase/firebase_auth_service.dart';
import 'package:getx_storage/routes/app_pages.dart';

class LoginController extends BaseController {

  LoginController(FirebaseAuthService this._auth,) {
    debugPrint("LoginController constructor");
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

  Future<void> onCheckCredential() async {
    debugPrint("LoginController checkCredential");
    _auth.checkCredential (
      emailController?.text ?? "", 
      passwordController?.text ?? "",
      (userCredential) {
        debugPrint("LoginController checkCredential credential ${userCredential.toString()}");
        debugPrint("LoginController checkCredential user ${userCredential.user}");
      }, 
      () => Get.offAndToNamed(Routes.MAIN),
      (exception) {
        debugPrint('LoginController checkCredential exception ${exception.toString()}}');
        onShowAlert("Error!", "Login failed Please Try Again");
      },
      () {},
    );
  }

  Future<void> checkGoogleCredentials() async  {
    /*
    isLoading(true);
    debugPrint("LoginController checkGoogleTechLeadCredentials");
    final UserCredential? googleCredential = await _auth.signInWithGoogle();
    final UserModel? user = await _service.getUserModel(_auth.getUser()?.uid);
    if (googleCredential != null && user != null) {
      debugPrint("LoginController checkGoogleTechLeadCredentials success!");
      Get.offAndToNamed(Routes.DASHBOARDLEADER);
    } else if (googleCredential != null && user == null) {
      debugPrint("LoginController checkGoogleTechLeadCredentials creatting success!");
      final User? user = _auth.getUser();
      _service.createUserModel(TechLeaderModel(
        uid: user?.uid,
        name: user?.displayName,
        email: user?.email,
      ).toMap());
      Get.offAndToNamed(Routes.DASHBOARDLEADER);
    } else {
      debugPrint("LoginController checkGoogleTechLeadCredentials error!");
      onShowAlert("Error!", "Invalid Google User, Please Login as a Google User");
      isLoading(false);
    }
    */
  }

  void launchRegister() {
    Get.toNamed(Routes.REGISTER);
  }

  @override
  void onClose() {
    super.onClose();
  }
}