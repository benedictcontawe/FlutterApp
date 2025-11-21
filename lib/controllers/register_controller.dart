import 'package:firebase_auth/firebase_auth.dart';
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
    if (emailController?.text.isEmpty ?? true) {// Validate email and password
      onShowAlert("Validation Error", "Please enter your email address");
      return;
    }    
    if (passwordController?.text.isEmpty ?? true) {
      onShowAlert("Validation Error", "Please enter your password");
      return;
    }    
    if (!GetUtils.isEmail(emailController?.text ?? "")) {// Validate email format
      onShowAlert("Validation Error", "Please enter a valid email address");
      return;
    }    
    if ((passwordController?.text.length ?? 0) < 6) {// Validate password strength (minimum 6 characters)
      onShowAlert("Validation Error", "Password must be at least 6 characters long");
      return;
    }    
    _auth.registerCredential (
      emailController?.text ?? "", 
      passwordController?.text ?? "",
      (userCredential) => debugPrint('RegisterController UserCredential $userCredential'), 
      (user) => debugPrint('RegisterController User registered: $user'), 
      () {
        debugPrint('RegisterController Success');
        onShowSuccess("Registration Successful!", "Account created successfully. Please verify your email.");
        Future.delayed(const Duration(milliseconds: 500), () {
          Get.offAndToNamed(Routes.MAIN);
          onSendEmailVerification();
        });
      }, 
      (firebaseAuthException) {
        debugPrint('RegisterController onRegisterCredential FirebaseAuthException ${firebaseAuthException.toString()}}');        
        String errorMessage = "Registration failed. Please try again.";        
        switch (firebaseAuthException.code) {
          case 'weak-password':
            errorMessage = "The password provided is too weak. Please use a stronger password.";
            break;
          case 'email-already-in-use':
            errorMessage = "An account already exists with this email address. Please use a different email or try logging in.";
            break;
          case 'invalid-email':
            errorMessage = "Invalid email address format. Please enter a valid email.";
            break;
          case 'operation-not-allowed':
            errorMessage = "Email/password accounts are not enabled. Please contact support.";
            break;
          case 'network-request-failed':
            errorMessage = "Network error. Please check your internet connection and try again.";
            break;
          case 'too-many-requests':
            errorMessage = "Too many requests. Please try again later.";
            break;
          default:
            errorMessage = "Registration failed: ${firebaseAuthException.message ?? 'Unknown error'}";
        }
        
        onShowAlert("Registration Failed", errorMessage);
      }, 
      (exception) {
        debugPrint('RegisterController onRegisterCredential exception ${exception.toString()}}');
        onShowAlert("Error!", "Registration failed. Please try again.");
      },
    );
  }

  void onSendEmailVerification() {
    _auth.sendEmailVerification(
      () {
        debugPrint('RegisterController sendEmailVerification');
        onShowSuccess("Verification Email Sent", "Please check your email inbox and verify your account.");
      }, 
      (firebaseAuthException) {
        debugPrint('RegisterController sendEmailVerification exception ${firebaseAuthException.toString()}}');        
        String errorMessage = "Failed to send verification email. Please try again.";        
        switch (firebaseAuthException.code) {
          case 'too-many-requests':
            errorMessage = "Too many verification emails sent. Please try again later.";
            break;
          case 'user-not-found':
            errorMessage = "User account not found. Please register again.";
            break;
          default:
            errorMessage = "Failed to send verification email: ${firebaseAuthException.message ?? 'Unknown error'}";
        }        
        onShowAlert("Email Verification Failed", errorMessage);
      }, 
      (exception) {
        debugPrint('RegisterController sendEmailVerification exception ${exception.toString()}}');
        onShowAlert("Error!", "Failed to send verification email. Please try again.");
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